#!/bin/bash

if test $# -ne 3
then
    echo "Utilizzo: nome.sh dir recuperati titolo."
    exit 1
fi

if ! test -d $1
then
    echo "Errore: $1 non è una directory."
    exit 2
fi

case $1 in
    /*) echo "Manager: $1 è una directory assoluta.";;
    *) echo "Errore: $1 non è una directory assoluta."
    exit 3;
esac

if ! test -d $2
then
    echo "Errore: $2 non è una directory."
    exit 4
fi

case $2 in
    /*) echo "Manager: $2 è una directory assoluta.";;
    *) echo "Errore: $2 non è una directory assoluta."
    exit 5;
esac

if ! test -f $3
then
    echo "Errore: non è stato inserito un nome valido."
fi

# Controllo esistenza della directory Ripristinati
if test ! -d $2
  then
  mkdir $2
fi

# Export del nuovo path e delle variabili contenenti i nomi dei file temporanei necessari per la ricerca
PATH=$PATH:`pwd`; export PATH
MAX_DIR=/tmp/.maxDir; export MAX_DIR; >$MAX_DIR
MAX_HIT=/tmp/.maxHit; export MAX_HIT; echo 0 >$MAX_HIT
TOTALE=/tmp/.totale; export TOTALE; echo 0 >$TOTALE

recupera_ric.sh "$1" "$2" "$3"

echo La directory contenente il maggior numero di "file" ripristinati 
è`head -1 /tmp/.maxDir` con `cat /tmp/.maxHit` occorrenze totali.
echo sono stati spostati `cat $TOTALE` file.

rm $MAX_DIR
rm $MAX_HIT
