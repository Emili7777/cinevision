# **Sistema Informativo – Gestione Cinema “CineVision”**

Il progetto **CineVision** nasce con l’obiettivo di digitalizzare e semplificare la gestione di un cinema tramite un’applicazione web sviluppata con Django.

L’applicativo consente a clienti e operatori di accedere a funzionalità differenziate: i clienti possono registrarsi, effettuare il login, consultare gli spettacoli disponibili, acquistare biglietti, gestire il proprio profilo e lasciare recensioni; gli operatori possono invece gestire la programmazione degli spettacoli, modificare date, orari e sale, aggiungere nuovi spettacoli ed eliminare quelli non ancora associati a biglietti venduti.

Il sistema integra inoltre controlli lato database tramite trigger MySQL/MariaDB, utili a garantire la coerenza dei dati, impedendo l’inserimento di spettacoli in date passate e prevenendo sovrapposizioni di film nella stessa sala.

---

## **Indice**

1. [Obiettivo del Sistema](#obiettivo-del-sistema)
2. [Tecnologie Utilizzate](#tecnologie-utilizzate)
3. [Installazione](#installazione)
4. [Configurazione del Database](#configurazione-del-database)
5. [Trigger e Controlli sul Database](#trigger-e-controlli-sul-database)
6. [Utilizzo](#utilizzo)
7. [Credenziali di Accesso](#credenziali-di-accesso)
8. [Licenza](#licenza)

---

## **Obiettivo del Sistema**

La piattaforma è progettata per supportare due categorie principali di utenti:

* **Cliente**
* **Operatore**

Il sistema offre le seguenti funzionalità:

* **Login differenziato** in base al ruolo dell’utente.
* **Registrazione cliente** con controllo delle credenziali.
* **Homepage con elenco film e spettacoli disponibili**.
* **Acquisto biglietti** con selezione dello spettacolo, del posto e del metodo di pagamento.
* **Gestione posti occupati**, per evitare la vendita dello stesso posto più volte.
* **Profilo cliente**, con visualizzazione dei biglietti acquistati.
* **Abbonamento premium**, che consente al cliente di ottenere uno sconto sul prezzo del biglietto.
* **Gestione recensioni**, consentita solo ai clienti che hanno acquistato almeno un biglietto per il film recensito.
* **Area operatore**, per aggiungere, modificare ed eliminare spettacoli.
* **Controllo delle sovrapposizioni tra spettacoli**, considerando la durata del film e un intervallo tecnico di 30 minuti.
* **Controllo delle date**, per impedire l’inserimento o la modifica di spettacoli con data precedente a quella corrente.
* **Controllo accessi basato su sessione utente**.

L’architettura del progetto garantisce modularità, semplicità di utilizzo e separazione delle responsabilità tra cliente e operatore.

---

## **Tecnologie Utilizzate**

### **Backend**

* **Python** – Linguaggio di programmazione principale.
* **Django** – Framework utilizzato per la gestione della logica server-side, delle view e delle sessioni.
* **mysqlclient** – Libreria utilizzata per collegare Django a MySQL/MariaDB.

### **Database**

* **MySQL / MariaDB** – Sistema di gestione relazionale dei dati.
* **phpMyAdmin** – Strumento consigliato per importare e gestire il database.

### **Frontend**

* **HTML**
* **CSS**
* **Bootstrap** – Framework utilizzato per la realizzazione dell’interfaccia grafica responsive.

---

## **Installazione**

Per eseguire l’applicazione è necessario avere installati:

* **Python 3.10 o superiore**
* **MySQL / MariaDB**
* **phpMyAdmin**, consigliato per la gestione del database
* **pip**
* **Git**

### **1. Clonare il progetto**

```bash
git clone https://github.com/Emili7777/cinevision.git
cd cinevision
```

Se la cartella del progetto viene rinominata diversamente, entrare nella cartella corrispondente.

---

### **2. Creare e attivare un ambiente virtuale**

```bash
python -m venv .venv
```

#### **Windows – CMD**

```bash
.venv\Scripts\activate.bat
```

#### **Windows – PowerShell**

```bash
.\.venv\Scripts\Activate.ps1
```

#### **Linux / macOS**

```bash
source .venv/bin/activate
```

---

### **3. Installare le dipendenze**

```bash
pip install -r requirements.txt
```

---

## **Configurazione del Database**

Il progetto utilizza un database MySQL/MariaDB chiamato:

```text
cinema
```

### **1. Creare il database**

Da phpMyAdmin:

1. Accedere a phpMyAdmin.
2. Creare un nuovo database chiamato:

```text
cinema
```

3. Selezionare il database appena creato.
4. Cliccare su **Importa**.
5. Caricare il file:

```text
cinema.sql
```

6. Confermare l’importazione.

---

### **2. Configurare Django**

Nel file `settings.py`, all’interno della cartella `mysite`, configurare il database nel seguente modo:

```python
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql',
        'NAME': 'cinema',
        'USER': 'root',
        'PASSWORD': '',
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```

Nel caso in cui MySQL utilizzi una password per l’utente `root`, inserirla nel campo `PASSWORD`.

---

## **Trigger e Controlli sul Database**

Il database utilizza trigger MySQL/MariaDB per mantenere la coerenza dei dati nella tabella `spettacolo`.

### **Controllo data spettacolo**

Il sistema impedisce l’inserimento o la modifica di uno spettacolo con una data precedente alla data corrente.

Esempio:

```text
Se oggi è 24/06/2026, non è possibile inserire uno spettacolo con data 23/06/2026.
```

In caso di errore, il sistema mostra un messaggio simile:

```text
Non puoi inserire o modificare uno spettacolo con data precedente a oggi.
```

---

### **Controllo sovrapposizione spettacoli**

Il sistema impedisce che due spettacoli si sovrappongano nella stessa sala e nella stessa data.

Il controllo considera:

```text
orario di inizio dello spettacolo
durata del film
30 minuti aggiuntivi per la preparazione della sala
```

Quindi un nuovo spettacolo può essere inserito nella stessa sala solo dopo la fine del film precedente più 30 minuti.

Esempio:

```text
Film A:
inizio: 18:00
durata: 90 minuti
intervallo tecnico: 30 minuti

La sala sarà nuovamente disponibile dalle 20:00.
```

Se si prova a inserire uno spettacolo prima di quell’orario, il database blocca l’operazione e viene mostrato un messaggio di errore:

```text
Sala occupata: lo spettacolo si sovrappone a un altro film.
```

---

## **Utilizzo**

Dopo aver configurato il database, eseguire le migrazioni Django:

```bash
python manage.py makemigrations
python manage.py migrate
```

Avviare il server locale:

```bash
python manage.py runserver
```

L’applicazione sarà accessibile dal browser all’indirizzo:

```text
http://localhost:8000
```

---

## **Credenziali di Accesso**

Le credenziali dipendono dagli utenti presenti nel database importato tramite `cinema.sql`.

Le password di test sono:

```text
Cliente: cliente123
Operatore: operatore123
```

Per accedere è necessario utilizzare l’email associata all’utente cliente o operatore presente nel database.

---

## **Licenza**

Questo progetto è stato realizzato e distribuito a scopo didattico con licenza **MIT**.

Puoi usarlo, modificarlo e distribuirlo liberamente, a patto che venga mantenuta la nota di copyright.
