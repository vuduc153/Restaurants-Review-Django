from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser


class Restaurant(models.Model):
    name = models.CharField(max_length=100)
    time_open = models.TimeField()
    time_close = models.TimeField()
    address = models.CharField(max_length=100)
    type_choices = [
        ('Cafe - Dessert', 'Cafe - Dessert'),
        ('Restaurant', 'Restaurant'),
        ('Bar - Pub', 'Bar - Pub'),
        ('Snack', 'Snack'),
    ]
    type = models.CharField(choices=type_choices, max_length=30)
    district_choices = [
        ('Dong Da', 'Dong Da'),
        ('Ba Dinh', 'Ba Dinh'),
        ('Thanh Xuan', 'Thanh Xuan'),
        ('Cau Giay', 'Cau Giay'),
        ('Long Bien', 'Long Bien'),
        ('Nam Tu Liem', 'Nam Tu Liem'),
        ('Hoan Kiem', 'Hoan Kiem'),
        ('Tay Ho', 'Tay Ho'),
        ('Hai Ba Trung', 'Hai Ba Trung'),
        ('Hoang Mai', 'Hoang Mai'),
        ('Ha Dong', 'Ha Dong'),
        ('Bac Tu Liem', 'Bac Tu Liem'),
    ]
    district = models.CharField(choices=district_choices, max_length=30)

    def __str__(self):
        return self.name


class CustomUser(AbstractUser):

    def __str__(self):
        return self.username


class Review(models.Model):
    review = models.TextField()
    upvotes = models.IntegerField(default=0)
    downvotes = models.IntegerField(default=0)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)


class RestaurantItem(models.Model):
    name = models.CharField(max_length=50)
    price = models.IntegerField()
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)

    def __str__(self):
        return self.name


class ReviewComment(models.Model):
    summary = models.TextField()
    comment = models.TextField()
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    review = models.ForeignKey(Review, on_delete=models.CASCADE)


class Vote(models.Model):
    vote_choices = [
        ('UP', 'Upvote'),
        ('DW', 'Downvote'),
    ]
    vote = models.CharField(choices=vote_choices, max_length=5)
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)
    review = models.ForeignKey(Review, on_delete=models.CASCADE)

    def __str__(self):
        return self.vote
