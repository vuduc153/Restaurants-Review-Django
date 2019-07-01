from .forms import CustomUserCreationForm, RestaurantItemForm, RestaurantForm, ReviewForm, ReviewImageForm, VotingForm
from .models import Review, Vote
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import login, authenticate
from django.views.generic.list import ListView
from django.views.generic import DetailView
from django.http import JsonResponse
from django.utils.decorators import method_decorator
from django.views.decorators.csrf import ensure_csrf_cookie
from .utils import get_price_range


class IndexView(ListView):

    context_object_name = 'recent_list'
    template_name = 'main/index.html'

    def get_queryset(self):
        return Review.objects.select_related('restaurant').prefetch_related('reviewimage_set').order_by('-id')[:3]

    def get_context_data(self, *args, **kwargs):
        context = super().get_context_data(*args, **kwargs)
        context['popular_list'] = Review.objects.select_related('restaurant').prefetch_related('reviewimage_set').\
            order_by('-upvotes')[:3]
        return context


class ResultListView(ListView):

    context_object_name = "result_list"
    template_name = 'main/listing.html'

    def get_queryset(self):
        # request sent from search bar
        base_query = Review.objects.select_related('restaurant').\
            prefetch_related('restaurant__restaurantitem_set').all()
        if 'keyword' in self.request.GET:  # query contains 'keyword'
            if self.request.GET.get('keyword'):  # keyword has a value
                query1 = base_query.\
                    filter(restaurant__restaurantitem__name__icontains=self.request.GET.get('keyword')).distinct()
                query2 = base_query.filter(restaurant__name__icontains=self.request.GET.get('keyword')).distinct()
                query3 = base_query.filter(restaurant__address__icontains=self.request.GET.get('keyword')).distinct()
                combined_query = query1 | query2 | query3
                return combined_query
            else:  # keyword doesnt have a value
                return base_query

        # request sent from search filter
        elif 'sd[]' in self.request.GET or 'sp[]' in self.request.GET or 'sc[]' in self.request.GET:
            # area-based query
            if self.request.GET.getlist('sd[]'):
                query1 = base_query.filter(restaurant__district__in=self.request.GET.getlist('sd[]')).distinct()
            else:  # no 'sd' is passed
                query1 = base_query.distinct()
            # type-based query
            if self.request.GET.getlist('sc[]'):
                query2 = base_query.filter(restaurant__type__in=self.request.GET.getlist('sc[]')).distinct()
            else:  # no 'sc' is passed
                query2 = base_query.distinct()
            # price-based query
            if self.request.GET.getlist('sp[]'):
                stack_query = Review.objects.none()
                for params in self.request.GET.getlist('sp[]'):
                    price_range = get_price_range(params)
                    query = base_query.filter\
                        (restaurant__restaurantitem__price__range=(price_range['low'], price_range['high'])).distinct()
                    stack_query = stack_query | query
                query3 = stack_query
            else:  # no 'sp' is passed
                query3 = base_query.distinct()
            combined_query = query1 & query2 & query3
            return combined_query

        # request sent from search filter with no item selected / invalid request
        else:
            return base_query


class ReviewDetailView(DetailView):

    template_name = 'main/detail.html'
    queryset = Review.objects.select_related('restaurant').select_related('user').\
        prefetch_related('reviewcomment_set').prefetch_related('restaurant__restaurantitem_set')

    @method_decorator(ensure_csrf_cookie)
    def dispatch(self, *args, **kwargs):
        return super(ReviewDetailView, self).dispatch(*args, **kwargs)


def vote(request, review_id):

    review = get_object_or_404(Review, id=review_id)
    if request.POST.get('reqType') == 'vote':
        vote_type = request.POST.get('voteType')
        vote_form = VotingForm({'vote': vote_type})
        if vote_form.is_valid():
            # if user's already voted, update current record
            if Vote.objects.filter(user=request.user, review=review):
                last_state = Vote.objects.filter(user=request.user, review=review).first().vote
                Vote.objects.filter(user=request.user, review=review).update(vote=vote_type)
                # update upvotes/downvotes field
                if last_state == vote_type:  # if last vote == current vote
                    pass
                else:
                    if last_state == 'UP':
                        review.upvotes -= 1
                        review.downvotes += 1
                    else:
                        review.downvotes -= 1
                        review.upvotes += 1
                    review.save()

            # else create new object and save it to database
            else:
                vote_object = vote_form.save(commit=False)
                vote_object.user = request.user
                vote_object.review = review
                vote_object.save()
                # update upvotes/downvotes field
                if vote_type == 'UP':
                    review.upvotes += 1
                else:
                    review.downvotes += 1
                review.save()

            # return current upvotes/downvotes
            return JsonResponse({'error': False, 'upvotes': review.upvotes, 'downvotes': review.downvotes})

    return JsonResponse({'error': True})


def register(request):

    if request.method == 'POST':
        form = CustomUserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            username = form.cleaned_data.get('username')
            raw_password = form.cleaned_data.get('password1')
            user = authenticate(username=username, password=raw_password)
            login(request, user)
            return redirect('main:index')
    else:
        form = CustomUserCreationForm()
    return render(request, 'main/register.html', {'form': form})


def post(request):

    if request.method == 'POST':
        review_form = ReviewForm(request.POST)
        restaurant_form = RestaurantForm(request.POST)
        # items handling
        item_name = request.POST.getlist('item_name[]')
        item_price = request.POST.getlist('item_price[]')
        item_form = [RestaurantItemForm({'name': item_name[i], 'price': item_price[i]}) for i in range(0, len(item_name))]
        if not all([form.is_valid() for form in item_form]):
            return render(request, 'main/post.html',
                          {'review_form': review_form, 'restaurant_form': restaurant_form, 'item_error': True})
        # images handling
        images = request.FILES.getlist('file[]')
        image_form = [ReviewImageForm(None, {'image': images[i]}) for i in range(0, len(images))]
        if not images:
            return render(request, 'main/post.html',
                          {'review_form': review_form, 'restaurant_form': restaurant_form, 'image_error': True})
        if review_form.is_valid() and restaurant_form.is_valid() \
                and all([form.is_valid() for form in item_form]) \
                and all([form.is_valid() for form in image_form]):
            # store restaurant to database
            restaurant = restaurant_form.save()
            # store review to database
            review = review_form.save(commit=False)
            review.user = request.user
            review.restaurant = restaurant
            review.save()
            # store items to database
            for form in item_form:
                item = form.save(commit=False)
                item.restaurant = restaurant
                item.save()
            # store images to database
            for form in image_form:
                image = form.save(commit=False)
                image.review = review
                image.save()
            return redirect('main:index')
    else:
        review_form = ReviewForm()
        restaurant_form = RestaurantForm()
    return render(request, 'main/post.html', {'review_form': review_form, 'restaurant_form': restaurant_form})
