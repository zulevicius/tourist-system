# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-11-18 10:38
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0010_auto_20161118_1213'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='', verbose_name='Paveiksliukas'),
        ),
        migrations.AlterField(
            model_name='tourobject',
            name='main_photo',
            field=models.ImageField(blank=True, null=True, upload_to='', verbose_name='Pagrindinė nuotrauka'),
        ),
    ]