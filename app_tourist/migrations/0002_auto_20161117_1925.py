# -*- coding: utf-8 -*-
# Generated by Django 1.9.2 on 2016-11-17 17:25
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app_tourist', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='image',
            options={'verbose_name': 'Paveikslėlis', 'verbose_name_plural': 'Paveikslėliai'},
        ),
        migrations.AlterModelOptions(
            name='place',
            options={'verbose_name': 'Vieta', 'verbose_name_plural': 'Vietos'},
        ),
        migrations.RemoveField(
            model_name='tourobject',
            name='title',
        ),
        migrations.AddField(
            model_name='place',
            name='city',
            field=models.CharField(default='Vilnius', max_length=30, verbose_name='Miestas'),
            preserve_default=False,
        ),
        migrations.AlterField(
            model_name='place',
            name='address',
            field=models.CharField(blank=True, max_length=64, null=True, verbose_name='Adresas'),
        ),
        migrations.AlterField(
            model_name='place',
            name='title',
            field=models.CharField(blank=True, max_length=50, null=True, verbose_name='Pavadinimas'),
        ),
    ]
