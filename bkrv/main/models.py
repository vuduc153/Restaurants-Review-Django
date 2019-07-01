from django.db import models
from django.contrib.auth import get_user_model
from django.contrib.auth.models import AbstractUser
from django.core.validators import MaxValueValidator, MinValueValidator


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

    @property
    def min_price(self):
        _min = 10000000
        for item in self.restaurantitem_set.all():
            if item.price < _min:
                _min = item.price
        return format(_min, ',').replace(',', '.')

    @property
    def max_price(self):
        _max = 0
        for item in self.restaurantitem_set.all():
            if item.price > _max:
                _max = item.price
        return format(_max, ',').replace(',', '.')


def profile_picture_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/users/<username>/<filename>
    return 'users/{}/{}'.format(instance.username, filename)


class CustomUser(AbstractUser):
    picture = models.ImageField(upload_to=profile_picture_path, default='users/default_avatar.jpg')

    def __str__(self):
        return self.username

    @property
    def number_of_reviews(self):
        return self.review_set.count()

    @property
    def number_of_upvotes(self):
        return sum(self.review_set.values_list('upvotes', flat=True))

    @property
    def number_of_downvotes(self):
        return sum(self.review_set.values_list('downvotes', flat=True))


class Review(models.Model):
    review = models.TextField()
    rating = models.IntegerField(default=0, validators=[MinValueValidator(0), MaxValueValidator(10)])
    upvotes = models.IntegerField(default=0)
    downvotes = models.IntegerField(default=0)
    restaurant = models.ForeignKey(Restaurant, on_delete=models.CASCADE)
    user = models.ForeignKey(get_user_model(), on_delete=models.CASCADE)

    @property
    def first_image(self):
        return self.reviewimage_set.first()

    @property
    def number_of_comments(self):
        return self.reviewcomment_set.count()


def review_image_path(instance, filename):
    # file will be uploaded to MEDIA_ROOT/reviews/<review_id>/<filename>
    return 'reviews/{}/{}'.format(instance.review.id, filename)


class ReviewImage(models.Model):
    image = models.ImageField(upload_to=review_image_path)
    review = models.ForeignKey(Review, on_delete=models.CASCADE)


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
