# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-11-17 20:42
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0004_auto_20161117_1941'),
    ]

    operations = [
        migrations.AlterField(
            model_name='tourobject',
            name='link',
            field=models.CharField(blank=True, max_length=128, null=True, verbose_name='Oficialus puslapis'),
        ),
    ]