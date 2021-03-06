# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-11-18 09:36
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0006_visitplace_is_church'),
    ]

    operations = [
        migrations.AddField(
            model_name='event',
            name='min_ticket_price',
            field=models.FloatField(blank=True, null=True, verbose_name='Mažiausia bilieto kaina'),
        ),
        migrations.AlterField(
            model_name='tourobject',
            name='ticket_price',
            field=models.FloatField(verbose_name='Didžiausia bilieto kaina'),
        ),
        migrations.AlterField(
            model_name='visitplace',
            name='is_church',
            field=models.BooleanField(default=False, verbose_name='Bažnyčia'),
        ),
    ]
