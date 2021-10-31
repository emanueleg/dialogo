# DIALOGO - Dizionario Italiano Amatoriale per LOGOpedisti

Questo dizionario italiano non professionale, utile per logopedisti (ma non solo), contiene oltre 96.000 lemmi in ordine alfabetico.

Il dizionario è in formato CSV, facilmente utilizzabile con Python o altri linguaggi di programmazione, ed importabile in MS Excel, LibreOffice Calc, SQLite etc.

Per ciascuna lemma vengono indicati:
- la parola (estratte dal dizionario italiano di Hunspell, usato anche da LibreOffice);
- la frequenza d'uso nella lingua italiana da 1 (più frequente) a 4 (meno frequente) - il valore è basato sul "Nuovo vocabolario di base della lingua italiana", Tullio di Mauro, 2016;
- se è un nome proprio di persona/località (NP) oppure no (NC);
- la divisione in sillabe (basata sul dizionario di sillabazione del pacchetto Hunspell);
- la tipologia delle sillabe (C, CV, CVV etc);
- il numero di sillabe.

Ad esempio: `androide,4,NC,an-droi-de,vc-ccvv-cv,3`

L'utilizzo di questo dizionario è consentito nei termini della licenza GPL-3, ovvero la stessa del dizionario di partenza hunspell-it.

Se trovate utile questo pacchetto, non disdegnate l'idea di effettuare una donazione a Casa del Sole onlus (https://www.casadelsole.org/) per sostenerne le attività.

_Emanuele Goldoni_
