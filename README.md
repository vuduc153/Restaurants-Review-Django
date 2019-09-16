# AngularJS - Django Web Application

## Installing

Create a virtual environment with:
```
virtualenv django_env
```
Install all required dependencies with:
```
sudo pip3 install -r requirements.txt
```
Install all ```nltk``` modules mentioned in ```nltk.txt``` following this guide:
https://www.nltk.org/data.html
Change the following lines in ```settings.py``` to fit your local database engine:
```
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'bkrv',
        'USER': 'root',
        'PASSWORD': 'TranVuDuc1998@',
    }
}
```
Run ```python3 manage.py runserver``` on terminal to launch your server.
Next, run ```python3 manage.py migrate``` to set up your database.
