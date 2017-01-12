<snippet>
  <content><![CDATA[
# ${1:Turizmo informacinė sistema}
Bakalaurinis baigimasis darbas.
Paruošė Žygimantas Ulevičius
## Instaliacija
Naudotos technologijos:
 Python 3.4
 10.1.16-MariaDB (Windows naudotojams patogu leisti per XAMPP)
 
 Parsisiuntus projektą įinstaliuoti reikiamas bibliotekas:
 Iš projekto šakninio katalogo paleisti `pip install -r requirements.list`
 
 Jei naudojate Windows ir neįsiinstaliavo mysqlclient biblioteka, iš https://pypi.python.org/pypi/mysqlclient/1.3.4 parsisiųskite ir įinstaliuokite šį WHL failą:
 `python -m pip install mysqlclient-1.3.4-cp34-none-win32.whl`
 
 Duomenų bazėje sukurkite "tourist-system" duomenų bazę su UTF-8 general koduote ir importuokite failą "db_dump/tourist-system_17-01-12.sql".
 
 Projekto prisijungimo prie duomenų bazės nustatymai yra "tourist/settings.py":
```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'tourist-system',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': '127.0.0.1',
        'PORT': '3306',
    }
}s
```
 
 Iš projekto šakninio katalogo paleisti `python manage.py migrate`
 
## Naudojimas
 Iš projekto šakninio katalogo paleisti `python manage.py runserver`
 
 Projektas turėtų būti randamas http://127.0.0.1:8000/turizmo-sistema/
 
]]></content>
  <tabTrigger>readme</tabTrigger>
</snippet>