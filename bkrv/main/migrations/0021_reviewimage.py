# Generated by Django 2.2.2 on 2019-06-29 08:08

from django.db import migrations, models
import django.db.models.deletion
import main.models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0020_review_rating'),
    ]

    operations = [
        migrations.CreateModel(
            name='ReviewImage',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('image', models.ImageField(upload_to=main.models.review_image_path)),
                ('review', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='main.Review')),
            ],
        ),
    ]