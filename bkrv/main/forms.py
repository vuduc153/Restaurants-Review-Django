from django.contrib.auth.forms import UserCreationForm, UserChangeForm
from .models import CustomUser, Review, Restaurant, RestaurantItem
from django.forms import ModelForm


class CustomUserCreationForm(UserCreationForm):

    class Meta(UserCreationForm):
        model = CustomUser
        fields = ('username', 'email')


class CustomUserChangeForm(UserChangeForm):

    class Meta(UserChangeForm):
        model = CustomUser
        fields = ('username', 'email')


class ReviewForm(ModelForm):

    class Meta:
        model = Review
        fields = ('review', 'downvotes', 'upvotes', 'rating')


class RestaurantForm(ModelForm):

    class Meta:
        model = Restaurant
        fields = ('name', 'time_open', 'time_close', 'address', 'type', 'district')


class RestaurantItemForm(ModelForm):

    class Meta:
        model = RestaurantItem
        fields = ('name', 'price')

