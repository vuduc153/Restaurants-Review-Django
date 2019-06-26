from django.shortcuts import render, redirect
from django.contrib.auth import login, authenticate
from .forms import CustomUserCreationForm
from .models import Review
from django.http import Http404
from django.views.generic.list import ListView


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
        elif 'sd' in self.request.GET or 'sp' in self.request.GET or 'sc' in self.request.GET:
            # area-based query
            try:
                query1 = base_query.filter(restaurant__district__in=self.request.GET.get('sd'))
            except ValueError:  # no 'sd' is passed
                query1 = base_query
            # type-based query
            try:
                query2 = base_query.filter(restaurant__type__in=self.request.GET.get('sc'))
            except ValueError:  # no 'sc' is passed
                query2 = base_query

        # request sent from search filter with no item selected / invalid request
        else:
            return base_query
