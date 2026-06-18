from django.db import models


class Cliente(models.Model):
    id_cliente = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    premium = models.BooleanField(default=False)
    id_carta = models.IntegerField(unique=True, null=True, blank=True)

    class Meta:
        db_table = 'Cliente'

    def __str__(self):
        return f"{self.nome} {self.cognome}"


class Operatore(models.Model):
    id_operatore = models.AutoField(primary_key=True)
    nome = models.CharField(max_length=50)
    cognome = models.CharField(max_length=50)
    email = models.EmailField(unique=True)
    password = models.CharField(max_length=255)
    stipendio = models.DecimalField(max_digits=8, decimal_places=2)
    data_assunzione = models.DateField()

    class Meta:
        db_table = 'Operatore'

    def __str__(self):
        return f"{self.nome} {self.cognome}"


class Sala(models.Model):
    id_sala = models.AutoField(primary_key=True)
    nome_sala = models.CharField(max_length=50)
    capienza = models.IntegerField()

    class Meta:
        db_table = 'Sala'

    def __str__(self):
        return self.nome_sala


class Film(models.Model):
    id_film = models.AutoField(primary_key=True)
    titolo = models.CharField(max_length=100)
    genere = models.CharField(max_length=50)
    durata = models.IntegerField()
    anno_uscita = models.IntegerField()
    regista = models.CharField(max_length=100)

    class Meta:
        db_table = 'Film'

    def __str__(self):
        return self.titolo


class Spettacolo(models.Model):
    id_spettacolo = models.AutoField(primary_key=True)
    data_spettacolo = models.DateField()
    ora_inizio = models.TimeField()

    film = models.ForeignKey(
        Film,
        on_delete=models.CASCADE,
        db_column='id_film'
    )

    sala = models.ForeignKey(
        Sala,
        on_delete=models.CASCADE,
        db_column='id_sala'
    )

    operatore = models.ForeignKey(
        Operatore,
        on_delete=models.SET_NULL,
        null=True,
        blank=True,
        db_column='id_operatore'
    )

    class Meta:
        db_table = 'Spettacolo'


class Posto(models.Model):
    id_posto = models.AutoField(primary_key=True)
    fila = models.CharField(max_length=5)
    numero = models.IntegerField()

    sala = models.ForeignKey(
        Sala,
        on_delete=models.CASCADE,
        db_column='id_sala'
    )

    class Meta:
        db_table = 'Posto'


class Biglietto(models.Model):
    id_biglietto = models.AutoField(primary_key=True)
    data_acquisto = models.DateField()

    cliente = models.ForeignKey(
        Cliente,
        on_delete=models.CASCADE,
        db_column='id_cliente'
    )

    spettacolo = models.ForeignKey(
        Spettacolo,
        on_delete=models.CASCADE,
        db_column='id_spettacolo'
    )

    posto = models.ForeignKey(
        Posto,
        on_delete=models.CASCADE,
        db_column='id_posto'
    )

    class Meta:
        db_table = 'Biglietto'


class Acquisto(models.Model):
    id_acquisto = models.AutoField(primary_key=True)
    prezzo_biglietto = models.DecimalField(max_digits=5, decimal_places=2)
    metodo_pagamento = models.CharField(max_length=30)

    cliente = models.ForeignKey(
        Cliente,
        on_delete=models.CASCADE,
        db_column='id_cliente'
    )

    biglietto = models.OneToOneField(
        Biglietto,
        on_delete=models.CASCADE,
        db_column='id_biglietto'
    )

    class Meta:
        db_table = 'Acquisto'


class Recensione(models.Model):
    id_recensione = models.AutoField(primary_key=True)
    valutazione = models.IntegerField()
    descrizione = models.TextField()

    cliente = models.ForeignKey(
        Cliente,
        on_delete=models.CASCADE,
        db_column='id_cliente'
    )

    film = models.ForeignKey(
        Film,
        on_delete=models.CASCADE,
        db_column='id_film'
    )

    class Meta:
        db_table = 'Recensione'
        unique_together = ('cliente', 'film')


class Gestione(models.Model):
    id_gestione = models.AutoField(primary_key=True)

    spettacolo = models.ForeignKey(
        Spettacolo,
        on_delete=models.CASCADE,
        db_column='id_spettacolo'
    )

    operatore = models.ForeignKey(
        Operatore,
        on_delete=models.CASCADE,
        db_column='id_operatore'
    )

    class Meta:
        db_table = 'Gestione'