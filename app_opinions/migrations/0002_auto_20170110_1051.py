# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2017-01-10 08:51
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_opinions', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='opinion',
            name='comment',
            field=models.TextField(max_length=5000, verbose_name='Komentaras'),
        ),
    ]