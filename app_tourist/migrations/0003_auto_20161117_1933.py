# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-11-17 17:33
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0002_auto_20161117_1925'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='place',
            name='x',
        ),
        migrations.RemoveField(
            model_name='place',
            name='y',
        ),
        migrations.AlterField(
            model_name='place',
            name='address',
            field=models.CharField(max_length=64, verbose_name='Adresas'),
        ),
    ]