from django.contrib import messages
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.models import User
from django.contrib.auth.forms import AuthenticationForm
from django.core.mail import EmailMessage
from django.core.urlresolvers import reverse
from django.http import HttpResponseRedirect
from django.shortcuts import render, redirect
from django.utils.crypto import get_random_string
from django.views.generic import FormView, ListView, TemplateView, View

from .forms import RemindPassword, UserRegister


class UserRegisterView(View):

    form_class = UserRegister
    template_name = 'app_auth/register.html'

    def get(self, request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():

            # clean (normalize) data
            username = form.cleaned_data['username']
            password = form.cleaned_data['password']

            # if password != request.POST['psw2']:
            #     messages.add_message(self.request, 25, 'Slaptažodžiai nesutampa', extra_tags="danger")
            # else:
            user = form.save(commit=False)
            user.set_password(password)
            user.save()

            return redirect('app_auth:login')

        return render(request, self.template_name, {'form': form})


class UserLoginView(FormView):

    form_class = AuthenticationForm
    template_name = 'app_auth/login.html'

    def get(self, request, *args, **kwargs):
        if request.user.is_authenticated():
            return redirect('app_tourist:index')
        else:
            return super(UserLoginView, self).get(request)

    def get_success_url(self):
        url = reverse('app_tourist:index', kwargs={})
        return url

    def form_invalid(self, form):
        messages.add_message(self.request, 25, 'Neteisingi prisijungimo duomenys', extra_tags="danger")
        return self.render_to_response(self.get_context_data(form=form))

    def form_valid(self, form):
        user = form.get_user()
        if user:
            if user.is_active:
                login(self.request, form.get_user())
                return HttpResponseRedirect(self.get_success_url())
            else:
                messages.add_message(self.request, 25, 'Prisijungimas uždraustas', extra_tags="danger")
                return self.render_to_response(self.get_context_data(form=form))


def logout_view(request):
    logout(request)
    return redirect('app_tourist:index')


class ForgotPasswordView(View):

    form_class = RemindPassword
    template_name = 'app_auth/forgot_password.html'

    def get(self, request):
        form = self.form_class(None)
        return render(request, self.template_name, {'form': form})

    def post(self, request):
        form = self.form_class(request.POST)

        if form.is_valid():
            email = form.cleaned_data['email']

            user_results = User.objects.filter(email=email)
            if user_results.count() > 0:
                new_psw = get_random_string(length=16)
                user = user_results.first()
                user.set_password(new_psw)
                user.save()

                message = ("Naudotojo vardas: %s\nNaujas slaptažodis: %s" % (user.username, new_psw))
                email_msg = EmailMessage('Naujas slaptažodis', message, to=[email])
                email_msg.send()

                messages.add_message(request, 25, "Naujas slaptažodis išsiųstas", extra_tags="success")
                return redirect('app_auth:login')

        messages.add_message(request, 25, "Nerasta paskyra su tokiu el. pašto adresu", extra_tags="danger")
        return render(request, self.template_name, {'form': form})


def change_password(request):

    if request.POST:
        old_psw = request.POST['old_psw']
        new_psw = request.POST['new_psw']
        new_psw2 = request.POST['new_psw2']

        user = User.objects.get(pk = request.user.pk)

        if user.check_password(old_psw):
            if new_psw == new_psw2:
                if len(new_psw) > 7:
                    user.set_password(new_psw)
                    user.save()

                    messages.add_message(request, 25, "Slaptažodis pakeistas. Prisijunkite iš naujo",
                                         extra_tags="success")
                    return redirect('app_tourist:index')
                else:
                    messages.add_message(request, 25, "Slaptažodžio ilgis turi viršyti 7 simbolius",
                                         extra_tags="danger")
            else:
                messages.add_message(request, 25, "Nauji slaptažodžiai nesutampa", extra_tags="danger")
        else:
            messages.add_message(request, 25, "Senas slaptažodis įvestas klaidingai", extra_tags="danger")

    return render(request, 'app_auth/change_password.html')
