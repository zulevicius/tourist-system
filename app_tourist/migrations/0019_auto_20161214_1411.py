# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-12-14 12:11
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0018_tourobject_thumbnail'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tourobject',
            name='thumbnail',
            field=models.ImageField(blank=True, editable=False, max_length=500, null=True, upload_to='', verbose_name='Miniatūra'),
        ),
    ]
