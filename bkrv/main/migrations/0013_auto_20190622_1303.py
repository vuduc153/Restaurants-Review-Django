# Generated by Django 2.2.2 on 2019-06-22 13:03

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0012_auto_20190622_1300'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='time_close',
            field=models.TimeField(),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='time_open',
            field=models.TimeField(),
        ),
    ]
