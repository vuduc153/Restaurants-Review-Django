# Generated by Django 2.2.2 on 2019-06-22 12:16

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main', '0009_auto_20190622_1140'),
    ]

    operations = [
        migrations.AlterField(
            model_name='restaurant',
            name='district',
            field=models.CharField(choices=[('DD', 'Dong Da'), ('BD', 'Ba Dinh'), ('TX', 'Thanh Xuan'), ('CG', 'Cau Giay'), ('LB', 'Long Bien'), ('NL', 'Nam Tu Liem'), ('HK', 'Hoan Kiem'), ('TH', 'Tay Ho'), ('HT', 'Hai Ba Trung'), ('HM', 'Hoang Mai'), ('HD', 'Ha Dong'), ('BL', 'Bac Tu Liem')], max_length=30),
        ),
        migrations.AlterField(
            model_name='restaurant',
            name='type',
            field=models.CharField(choices=[('CF', 'Cafe - Dessert'), ('RS', 'Restaurant'), ('BP', 'Bar - Pub'), ('SK', 'Snack')], max_length=30),
        ),
    ]
