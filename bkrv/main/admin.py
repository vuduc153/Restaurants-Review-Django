from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from .forms import CustomUserCreationForm, CustomUserChangeForm
from .models import CustomUser, Review, Restaurant, ReviewComment, RestaurantItem, Vote


class CustomUserAdmin(UserAdmin):
    add_form = CustomUserCreationForm
    form = CustomUserChangeForm
    model = CustomUser
    list_display = ['email', 'username',]


admin.site.register(CustomUser, CustomUserAdmin)
admin.site.register(Review)
admin.site.register(Restaurant)
admin.site.register(RestaurantItem)
admin.site.register(ReviewComment)
admin.site.register(Vote)
