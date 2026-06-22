from django.contrib import admin
from django.urls import path
from cinema import views


urlpatterns = [
    path('admin/', admin.site.urls),
    path("", views.login, name="home"),
    path("login/", views.login, name="login"),
    path("homepage/", views.homepage, name="homepage"),
    path('acquista_biglietti/<int:id_film>/',views.acquisto_biglietti,name='acquista_biglietti'),
    path('spettacolo/<int:id_spettacolo>/',views.dettaglio_spettacolo,name='dettaglio_spettacolo'),
    path("registrazione/", views.registrazione, name="registrazione"),
    path("profilo/", views.profilo, name="profilo"),
    path("logout/", views.logout, name="logout"),
    path("operatore/", views.operatore_dashboard, name="operatore_dashboard"),
]