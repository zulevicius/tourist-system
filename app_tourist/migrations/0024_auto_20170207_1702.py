# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2017-02-07 15:02
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0023_auto_20170112_2205'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tourobject',
            name='main_photo',
            field=models.ImageField(upload_to='', verbose_name='Pagrindinė nuotrauka'),
        ),
    ]