# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2017-01-12 20:05
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0022_auto_20161214_1906'),
    ]

    operations = [
        migrations.AlterField(
            model_name='image',
            name='image',
            field=models.ImageField(blank=True, null=True, upload_to='', verbose_name='Paveikslėlis'),
        ),
    ]