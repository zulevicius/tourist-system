# -*- coding: utf-8 -*-

from django.views.generic import TemplateView


class IndexView(TemplateView):
    template_name = 'app_tourist/index.html'

    def get_context_data(self):
        context = super(IndexView, self).get_context_data()

        return context
