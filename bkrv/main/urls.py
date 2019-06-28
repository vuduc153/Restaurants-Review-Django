from django.urls import path, include
from . import views


app_name = 'main'
urlpatterns = [
    path('', views.index, name='index'),
    path('users/', include('django.contrib.auth.urls')),
    path('users/register/', views.register, name='register'),
    path('search/', views.ResultListView.as_view(), name='search'),
    path('post/', views.post, name='post'),
]
