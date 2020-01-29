# Django - AngularJS Web Application

## About
An online platform that allows users to freely share their experience and opinion about restaurants all around the world with the community.

Built on Django framework.

## Setup
Create a new virtual environment with:
```
virtualenv django_env
```
Install all required dependencies with:
```
sudo pip3 install -r requirements.txt
```
Download all ```nltk``` corpora in ```nltk.txt``` following the guide in the following link:

https://www.nltk.org/data.html

Change the `DATABASES = { ... }` in ```settings.py``` to match your local database setup

Run ```python3 manage.py runserver``` on terminal to launch your server.

Then, run ```python3 manage.py migrate``` to set up your database.
