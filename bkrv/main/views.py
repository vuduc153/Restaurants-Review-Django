from .forms import CustomUserCreationForm, RestaurantItemForm, RestaurantForm, ReviewForm
from .models import Review
from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from django.views.generic.list import ListView
from .utils import get_price_range


def index(request):
    return render(request, 'main/index.html')


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


def post(request):
    if request.method == 'POST':
        review_form = ReviewForm(request.POST)
        restaurant_form = RestaurantForm(request.POST)
        item_form = RestaurantItemForm()
        if review_form.is_valid() and restaurant_form.is_valid():
            restaurant = restaurant_form.save()
            review = review_form.save(commit=False)
            review.user = request.user
            review.restaurant = restaurant
            review.save()
            return redirect('main:index')
    else:
        review_form = ReviewForm()
        restaurant_form = RestaurantForm()
    return render(request, 'main/test.html', {'review_form': review_form, 'restaurant_form': restaurant_form})
