from django.shortcuts import render, redirect
from django.contrib import messages
from .models import * #NON TOCCARE
import hashlib
from django.utils import timezone
from decimal import Decimal


def login(request):

    if request.method == 'POST':

        email = request.POST.get('email')
        password = request.POST.get('password')

        password_md5 = hashlib.md5(
            password.encode('utf-8')
        ).hexdigest()

        # Prima controllo se è un cliente
        cliente = Cliente.objects.filter(
            email=email,
            password=password_md5
        ).first()

        if cliente:
            request.session.flush()
            request.session['cliente_id'] = cliente.id_cliente
            request.session['nome'] = cliente.nome
            request.session['ruolo'] = 'cliente'

            return redirect('homepage')

        # Poi controllo se è un operatore
        operatore = Operatore.objects.filter(
            email=email,
            password=password_md5
        ).first()

        if operatore:
            request.session.flush()
            request.session['operatore_id'] = operatore.id_operatore
            request.session['nome'] = operatore.nome
            request.session['ruolo'] = 'operatore'

            return redirect('operatore_dashboard')

        return render(
            request,
            'Log-in.html',
            {
                'errore': 'Email o password errati'
            }
        )

    return render(request, 'Log-in.html')


def registrazione(request):

    if request.method == 'POST':

        nome = request.POST.get('nome')
        cognome = request.POST.get('cognome')
        email = request.POST.get('email')
        password = request.POST.get('password')
        conferma_password = request.POST.get('conferma_password')

        if password != conferma_password:
            return render(
                request,
                'registrazione.html',
                {
                    'errore': 'Le password non coincidono'
                }
            )

        if Cliente.objects.filter(email=email).exists():
            return render(
                request,
                'registrazione.html',
                {
                    'errore': 'Email già registrata'
                }
            )

        password_md5 = hashlib.md5(
            password.encode('utf-8')
        ).hexdigest()

        cliente = Cliente.objects.create(
            nome=nome,
            cognome=cognome,
            email=email,
            password=password_md5
        )

        request.session['cliente_id'] = cliente.id_cliente
        request.session['nome'] = cliente.nome

        return redirect('homepage')

    return render(request, 'registrazione.html')


def homepage(request):

    film_list = Film.objects.all()

    spettacoli = Spettacolo.objects.select_related(
        'film',
        'sala'
    ).order_by(
        'film__titolo',
        'ora_inizio'
    )


    premium = False

    cliente_id = request.session.get('cliente_id')

    if cliente_id:
        try:
            cliente = Cliente.objects.get(id_cliente=cliente_id)
            premium = cliente.premium

        except Cliente.DoesNotExist:
            premium = False

    return render(
        request,
        'homepage.html',
        {
            'film_list': film_list,
            'spettacoli': spettacoli,
            'premium': premium
        }
    )
def acquisto_biglietti(request, id_film):
    """Visualizza la pagina di acquisto e gestisce selezione e conferma.
    - GET: permette selezione separata di data e orario; mostra griglia 5x5 dei posti
    - POST: conferma l'acquisto (richiede cliente in sessione) e crea Biglietto+Acquisto
    """

    film = Film.objects.get(id_film=id_film)

    spettacoli = Spettacolo.objects.filter(film=film).select_related('sala').order_by('data_spettacolo','ora_inizio')

    prezzo_base = Decimal('8.00')
    prezzo_biglietto = prezzo_base
    premium = False
    sconto_applicato = False

    cliente_id_sessione = request.session.get('cliente_id')

    if cliente_id_sessione:
        try:
            cliente_corrente = Cliente.objects.get(id_cliente=cliente_id_sessione)
            premium = cliente_corrente.premium

            if premium:
                prezzo_biglietto = (prezzo_base * Decimal('0.70')).quantize(Decimal('0.01'))
                sconto_applicato = True

        except Cliente.DoesNotExist:
            premium = False
            prezzo_biglietto = prezzo_base
            sconto_applicato = False


    selected_spettacolo = None
    posti = None
    posti_occupati = []
    selected_posto = None
    error = None
    success = None
    selected_date = None
    times_for_date = None
    seats = None

    # POST: conferma acquisto
    if request.method == 'POST':
        cliente_id = request.session.get('cliente_id')
        if not cliente_id:
            return redirect('login')

        spettacolo_id = request.POST.get('spettacolo')
        posto_id = request.POST.get('posto')
        metodo = request.POST.get('metodo_pagamento', 'Carta')

        if not spettacolo_id or not posto_id:
            error = 'Selezionare spettacolo e posto prima di confermare.'
        else:
            try:
                spettacolo_obj = Spettacolo.objects.select_related('sala').get(id_spettacolo=spettacolo_id)
                posto_obj = Posto.objects.get(id_posto=posto_id)
                if Biglietto.objects.filter(spettacolo=spettacolo_obj, posto=posto_obj).exists():
                    error = 'Il posto selezionato è già occupato.'
                else:
                    cliente = Cliente.objects.get(id_cliente=cliente_id)
                    biglietto = Biglietto.objects.create(
                        data_acquisto=timezone.now().date(),
                        cliente=cliente,
                        spettacolo=spettacolo_obj,
                        posto=posto_obj
                    )

                    prezzo_finale = prezzo_base

                    if cliente.premium:
                        prezzo_finale = (prezzo_base * Decimal('0.70')).quantize(Decimal('0.01'))

                    Acquisto.objects.create(
                        prezzo_biglietto=prezzo_finale,
                        metodo_pagamento=metodo,
                        cliente=cliente,
                        biglietto=biglietto
                    )
                    messages.success(request, 'Acquisto riuscito')
                    return redirect('homepage')
            except (Spettacolo.DoesNotExist, Posto.DoesNotExist, Cliente.DoesNotExist):
                error = 'Dati non validi.'

    # GET: selezioni
    selected_date = request.GET.get('data')
    spettacolo_id_get = request.GET.get('spettacolo')
    posto_id_get = request.GET.get('posto')

    # if a date is selected, filter times for that date
    if selected_date:
        times_for_date = spettacoli.filter(data_spettacolo=selected_date)
    else:
        times_for_date = None

    # if a spettacolo is selected, load posti e costruisci matrice 5x5
    if spettacolo_id_get:
        try:
            selected_spettacolo = Spettacolo.objects.select_related('sala').get(id_spettacolo=spettacolo_id_get)
            posti = Posto.objects.filter(sala=selected_spettacolo.sala)
            biglietti = Biglietto.objects.filter(spettacolo=selected_spettacolo)
            posti_occupati = [b.posto.id_posto for b in biglietti]

            # mappa posti per (fila, numero)
            posto_map = {(p.fila.strip().upper(), int(p.numero)): p for p in posti}

            # righe A-E e colonne 1-5 -> griglia 5x5
            rows = ['A', 'B', 'C', 'D', 'E']
            cols = [1, 2, 3, 4, 5]

            seats = []
            for r in rows:
                row_list = []
                for c in cols:
                    key = (r, c)
                    posto_obj = posto_map.get(key)
                    occupied = False
                    if posto_obj and posto_obj.id_posto in posti_occupati:
                        occupied = True
                    row_list.append({
                        'fila': r,
                        'numero': c,
                        'posto': posto_obj,
                        'occupied': occupied
                    })
                seats.append(row_list)

            if posto_id_get:
                try:
                    selected_posto = Posto.objects.get(id_posto=posto_id_get)
                except Posto.DoesNotExist:
                    selected_posto = None

        except Spettacolo.DoesNotExist:
            selected_spettacolo = None

    return render(request, 'acquisto_biglietti.html', {
        'film': film,
        'spettacoli': spettacoli,
        'spettacolo_selected': selected_spettacolo,
        'posti': posti,
        'posti_occupati': posti_occupati,
        'posto_selected': selected_posto,
        'error': error,
        'success': success,
        'selected_date': selected_date,
        'times_for_date': times_for_date,
        'seats': seats,
        'prezzo_biglietto': prezzo_biglietto,
        'premium': premium,
        'sconto_applicato': sconto_applicato
    })
def dettaglio_spettacolo(request, id_spettacolo):

    spettacolo = Spettacolo.objects.select_related(
        'film',
        'sala'
    ).get(
        id_spettacolo=id_spettacolo
    )

    posti = Posto.objects.filter(
        sala=spettacolo.sala
    )

    biglietti = Biglietto.objects.filter(
        spettacolo=spettacolo
    )

    posti_occupati = []

    for biglietto in biglietti:

        posti_occupati.append(
            biglietto.posto.id_posto
        )

    return render(
        request,
        'acquisto_biglietti.html',
        {
            'film': spettacolo.film,
            'spettacolo': spettacolo,
            'posti': posti,
            'posti_occupati': posti_occupati
        }
    )


def profilo(request):

    cliente_id = request.session.get('cliente_id')

    if not cliente_id:
        return redirect('login')

    try:
        cliente = Cliente.objects.get(id_cliente=cliente_id)
    except Cliente.DoesNotExist:
        request.session.flush()
        return redirect('login')

    if request.method == 'POST':
        cliente.premium = True
        cliente.save()

        messages.success(request, 'Abbonamento premium attivato con successo')
        return redirect('profilo')

    biglietti = Biglietto.objects.filter(
        cliente=cliente
    ).select_related(
        'spettacolo',
        'spettacolo__film',
        'spettacolo__sala',
        'posto'
    ).order_by(
        '-data_acquisto'
    )

    return render(
        request,
        'profilo.html',
        {
            'cliente': cliente,
            'biglietti': biglietti
        }
    )

def operatore_dashboard(request):

    operatore_id = request.session.get('operatore_id')

    if not operatore_id:
        return redirect('login')

    try:
        operatore = Operatore.objects.get(id_operatore=operatore_id)
    except Operatore.DoesNotExist:
        request.session.flush()
        return redirect('login')

    if request.method == 'POST':

        azione = request.POST.get('azione')

        # AGGIUNTA NUOVO SPETTACOLO
        if azione == 'aggiungi':

            id_film = request.POST.get('film')
            id_sala = request.POST.get('sala')
            data_spettacolo = request.POST.get('data_spettacolo')
            ora_inizio = request.POST.get('ora_inizio')

            try:
                film = Film.objects.get(id_film=id_film)
                sala = Sala.objects.get(id_sala=id_sala)

                Spettacolo.objects.create(
                    film=film,
                    sala=sala,
                    data_spettacolo=data_spettacolo,
                    ora_inizio=ora_inizio,
                    operatore=operatore
                )

                messages.success(request, 'Spettacolo aggiunto con successo')

            except (Film.DoesNotExist, Sala.DoesNotExist):
                messages.error(request, 'Errore durante l’aggiunta dello spettacolo')

            return redirect('operatore_dashboard')

        # MODIFICA SPETTACOLO ESISTENTE
        elif azione == 'modifica':

            id_spettacolo = request.POST.get('id_spettacolo')
            id_sala = request.POST.get('sala')
            data_spettacolo = request.POST.get('data_spettacolo')
            ora_inizio = request.POST.get('ora_inizio')

            try:
                spettacolo = Spettacolo.objects.get(id_spettacolo=id_spettacolo)
                sala = Sala.objects.get(id_sala=id_sala)

                spettacolo.sala = sala
                spettacolo.data_spettacolo = data_spettacolo
                spettacolo.ora_inizio = ora_inizio
                spettacolo.operatore = operatore
                spettacolo.save()

                messages.success(request, 'Spettacolo modificato con successo')

            except (Spettacolo.DoesNotExist, Sala.DoesNotExist):
                messages.error(request, 'Errore durante la modifica dello spettacolo')

            return redirect('operatore_dashboard')

    spettacoli = Spettacolo.objects.select_related(
        'film',
        'sala',
        'operatore'
    ).order_by(
        'film__titolo',
        'data_spettacolo',
        'ora_inizio'
    )

    sale = Sala.objects.all().order_by('nome_sala')
    film = Film.objects.all().order_by('titolo')

    return render(
        request,
        'operatore.html',
        {
            'operatore': operatore,
            'spettacoli': spettacoli,
            'sale': sale,
            'film': film
        }
    )


def logout(request):
    request.session.flush()
    return redirect('login')