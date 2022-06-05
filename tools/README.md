# Istruzioni per la generazione del dizionario

## Requisiti

* Una macchina con sistema operativo *nix (Linux, BSD, MacOS)
* L'inteprete Python (possibilmente versione >=3.9)
* Il pacchetto python3 ``pyhphen``

## Esecuzione

Lanciare da linea di comando lo script ``./generate.sh`` per generare il file ``dialogo.csv``

## Dataset di partenza

* `nvdb01.txt` Nuovo Vocabolario di Base, Tullio De Mauro, 2016 - ottenuto con `wget https://raw.githubusercontent.com/zorbaproject/Bran/master/dizionario/orig_vdb/nuovovocabolariodibase.csv -O nvdb01.txt`
* `hunspell01.txt` Recupero e pulizia dizionario italiano Hunspell / LibreOffice... - aggiornabile con ``wget https://raw.githubusercontent.com/LibreOffice/dictionaries/master/it_IT/it_IT.dic -O hunspell01.txt``
* `hyph_it_IT.dic` - Regole di sillbazione italiane Hunspell / LibreOffice modificate da @emanueleg - file originale scaricabile con ``wget https://raw.githubusercontent.com/LibreOffice/dictionaries/master/it_IT/hyph_it_IT.dic -O hyph_it_IT.dic``
