from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser


class Restaurant(models.Model):
    name = models.CharField(max_length=100)
    time_open = models.TimeField()
    time_close = models.TimeField()
    address = models.CharField(max_length=100)
    type_choices = [
        ('CF', 'Cafe - Dessert'),
        ('RS', 'Restaurant'),
        ('BP', 'Bar - Pub'),
        ('SK', 'Snack'),
    ]
    type = models.CharField(choices=type_choices, max_length=30)
    district_choices = [
        ('DD', 'Dong Da'),
        ('BD', 'Ba Dinh'),
        ('TX', 'Thanh Xuan'),
        ('CG', 'Cau Giay'),
        ('LB', 'Long Bien'),
        ('NL', 'Nam Tu Liem'),
        ('HK', 'Hoan Kiem'),
        ('TH', 'Tay Ho'),
        ('HT', 'Hai Ba Trung'),
        ('HM', 'Hoang Mai'),
        ('HD', 'Ha Dong'),
        ('BL', 'Bac Tu Liem'),
    ]
    district = models.CharField(choices=district_choices, max_length=30)


class CustomUser(AbstractUser):

    def __str__(self):
        return self.username


class Review(models.Model):
    review = models.TextField()
    rating = models.FloatField(default=0)
    upvotes = models.IntegerField(default=0)
    downvotes = models.IntegerField(default=0)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)


class ReviewItem(models.Model):
    name = models.CharField(max_length=50)
    price = models.IntegerField()
    review = models.ForeignKey(Review, on_delete=models.CASCADE)


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
