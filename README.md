# DATABASE AZIENDE PALESTRE
## BASI DI DATI e LABORATORIO DI BASI DATI 1
A cura di:  
    Di Palma Giuseppe
    Gabriele Paolocci

Categoria:									App Palestra



# Progettazione
## Sintesi dei requisiti
Il Database deve gestire un’applicazione che faciliti la comunicazione tra le palestre e i sui clienti. Ogni palestra ha un numero di iscritti, può avere differenti sedi e ha personal trainer in esclusiva. La app deve poter dare la possibilità alla palestra di offrire dei particolari corsi ai clienti possono frequentarlo dando la propria frequenza al fine statistico dei corsi. Il cliente è abilitato nel momento in cui ha un certificato medico valido, quindi bisogna tener conto dei certificati medici dei clienti, controllando le date di scadenza. L’app deve dare la possibilità ai clienti e ai personal trainer di visionare le schede di esercizi e misurazioni creando uno storico per ogni cliente al fine statistico. Le schede e le misurazioni vengono compilate dai personal trainer della palestra dove è iscritto il cliente.
Analisi dei requisiti
•	La palestra ha N clienti.
•	La palestra ha N trainer.
•	Il trainer lavora per 1 palestra in esclusiva.
•	N certificati medici sono di 1 cliente.
•	Il cliente può essere iscritto a N palestre se si considera nel tempo.
•	Una palestra ha N sedi.
•	Una palestra propone N corsi tenuti da 1 trainer.
•	N clienti possono frequentare M corsi.
•	In 1 sala di una palestra si svolgono N corsi.
•	Il trainer compila N schede e misurazioni.
•	Il cliente può leggere N schede e misurazioni.
•	La scheda è composta da N esercizi.
•	Gli esercizi vengono svolti con N attrezzi.
# Diagramma EE/R
 
# Diagramma Relazionale


# Operazioni degli utenti
Le operazioni degli utenti sono operazioni base con un semplice comando DML. Le uniche cose che può fare l’utente è visualizzare le sue misurazioni, le sue schede, aggiungere il suo certificato medico e visualizzare le sedi delle palestre. 
Le procedure di inserimento e di visita da parte dell’utente sono gestite tramite il richiamo di procedure.
Nel diagramma dei casi d’uso sono visibili per operazioni implementate che gli utenti coinvolti svolgono.
PERSONAL_TRAINER può compilare schede e misurazioni, leggere schede e misurazioni.
PROPRIETARIO DELLA PALESTRA può aumentare lo stipendio ad un personal trainer.
CLIENTE che può effettuare varie operazioni.
  
# VOLUMI
Nella tabella dei volumi, vengono indicate verosimilmente il numero di tuple presenti in ciascuna tabella, una volta che il Database è a pieno carico.
Si fa conto che le tuple di CERTIFICATO MEDICO, MISURAZIONI e SCHEDA potrebbero essere eliminate a distanza di mesi o anni.
TABELLA	              TIPO
CERTIFICATO_MEDICO	    E
CLIENTE	               E
FREQUENTA	             A
E_ISCRITTO	            A
CORSO	                 E
PALESTRA	              E
SEDE	                  E
PERSONAL_TRAINER	      E
MISURAZIONE	           ED
SCHEDA	                ED
COMPOSTO_DA	           A
ESERCIZI	              E
SVOLTO_CON	            A
ATTREZZO	              E
E = Entità || ED = Entità debole || A = tabella transizione

## Vincoli d’integrità
Si riportano i vincoli di integrità più importanti per il Database Palestra. Non compaiono in elenco, i vincoli ovvi, ovvero le chiavi primarie e chiave esterne.

### Vincoli Statici:
Per CLIENTE
•	CODICE_TESSERA dovrà essere un valore univoco e obbligatorio.
•	NOME_CLIENTE dovrà essere obbligatorio.
•	COGNOME_CLIENTE dovrà essere obbligatorio.
•	SESSO dovrà essere uguale a M o F.
### Per CERTIFICATO_MEDICO
•	ID_CERTIFICATO dovrà essere un valore univoco e obbligatorio.
•	DATA_SCADENZA dovrà essere obbligatorio.
•	NOME_MEDICO dovrà essere obbligatorio.
•	COGNOME_MEDICO dovrà essere obbligatorio.
### Per PALESTRA
•	PARTITA_IVA dovrà essere un valore univoco e obbligatorio.
•	NOME_PALESTRA dovrà essere obbligatorio.
### Per ESERCIZIO
•	ID_ESERCIZIO dovrà essere un valore univoco e obbligatorio.
•	NOME_ESERCIZIO dovrà essere obbligatorio.
### Per ATTREZZO
•	ID_ATTREZZO dovrà essere un valore univoco e obbligatorio.
•	NOME_ATTREZZO dovrà essere obbligatorio.
### Per SEDE
•	STRADA dovrà essere un valore univoco e obbligatorio.
•	CITTA dovrà essere un valore univoco e obbligatorio.
•	CAP dovrà essere un valore univoco e obbligatorio.
## Per PERSONAL_TRAINER
•	ID_TESSERA dovrà essere un valore univoco e obbligatorio.
•	COGNOME_TRAINER dovrà essere obbligatorio.
•	DATA_NASCITA_TRAINER dovrà essere obbligatorio.
### Per CORSO
•	ID_CORSO dovrà essere un valore univoco e obbligatorio.
•	NOME_CORSO dovrà essere obbligatorio.
•	DATA_INIZIO dovrà essere obbligatorio.

## Vincoli Dinamici:
•	Il certificato medico dovrà avere una data di scadenza superiori a 30 giorni a quella odierna.
•	Un personal trainer può compilare schede solo per i clienti della sua palestra.
•	Il cliente può frequentare solo un corso appartenente alla sua palestra.
•	In una palestra non possono essere svolti più corsi di quante siano le sale.
•	Gli esercizi possono essere abbinati solo agli attrezzi giusti.
•	Ogni personal trainer può lavorare per una sola palestra.
•	Le date delle presenze ai corsi devono rientrare tra data di inizio e fine del corso.

## Possibili estensioni
Sono possibili casi non reali che possono accadere, del tipo:
•	Se è già stata inserita una scheda e ancora non è scaduta non si può procedere con la sovrascrittura di quest’ultima.
•	La misurazione può essere presa al massimo una volta al mese.
•	La sede di una palestra può essere cambiata solo una volta al mese.
•	Un corso non può avvenire in due sedi diverse.
•	Un esercizio non può essere seguito da un altro dello stesso nome e/o Id.

# Trigger
### Spiegazione di ogni trigger con relativo codice.
## Primo trigger:
Questo primo trigger va a controllare se la data di scadenza su un nuovo certificato medico inserito è superiore a 30 giorni dalla data odierna, nel qual caso risulti superiore allora il certificato viene aggiunto, altrimenti viene rifiutato, stampando a video il messaggio con il codice di errore relativo.
 
## Secondo trigger:
Questo trigger effettua controlli sull’entità scheda, e viene attivato sull’inserimento.  Controlla che ogni personal trainer possa aggiungere una scheda solo ad un cliente appartenente alla palestra per quale lavora.

## Terzo trigger:
Questo trigger lavoro sulla relazione Frequenta, e permette di controllare che un cliente possa frequentare solo un corso offerto dalla palestra alla quale è iscritto.

## Quarto trigger:
Questo trigger, limita l’inserimento di corsi se il numero di sale di una determinata sede sia minore rispetto al numero di corsi inseriti in quel determinato giorno.

## Quinto trigger:
Questo trigger controlla che a un esercizio venga assegnato uno specifico attrezzo.
(In questo caso abbiamo abbinato l’esercizio pettorali con panca piana)

## Sesto trigger:
Viene effettuato un controllo, sull’aggiunta di personal trainer, e viene controllato che un personal trainer non lavori per più palestra contemporaneamente.

## Settimo trigger:
Controlla che il cliente frequenti il corso in una data compresa fra l'inizio e la fine del corso

# Procedure e Funzioni
## Prima procedura
Usata per calcolare l’età dei personal trainer, va richiamata senza parametri.

## Seconda procedura
Questa procedura aumenta lo stipendio dei personal trainer che effettuano più corsi (dunque lavorano di più), occorre passare la partita iva della palestra per la quale lavorano e il numero di $ da aumentare. 
 
## Terza procedura
Per evitare appesantimenti del database, dovuta alla presenza di certificati vecchi scaduti, con questa procedura si è in grado di cancellare i certificati medici scaduti da 1 anno.
 
## Quarta procedura
Questa procedura aggiorna il campo IMC settato su ogni scheda (inizialmente a 0), calcolando l’indice di massa corporea per ogni cliente, usando la formula sotto proposta.

