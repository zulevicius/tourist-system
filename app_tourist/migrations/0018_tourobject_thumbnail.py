# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-12-13 19:58
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0017_auto_20161212_1941'),
    ]

    operations = [
        migrations.AddField(
            model_name='tourobject',
            name='thumbnail',
            field=models.ImageField(blank=True, max_length=500, null=True, upload_to='', verbose_name='Miniatūra'),
        ),
    ]
