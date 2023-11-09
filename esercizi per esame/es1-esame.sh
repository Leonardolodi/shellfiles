#!/bin/bash
#riordina foto

if test $# -ne 2
then
    echo "Uso: riordina_foto  dir_sorgente  dir_destinazione"
    exit 1
fi

if ! test -d $1
then
    echo "Errore: dir_sorgente non è una directory"
    exit 2
fi

case $1 in
    /*) echo "Errore: non è una directory relativa"
        exit 3;;
    *) ;;
esac

if ! test -d $2
then
    echo "Errore: dir_sorgente non è una directory"
    exit 4
fi

case $2 in
    /*) echo "Errore: non è una directory relativa"
        exit 5;;
    *) ;;
esac

if ! test -d $2/duplicati
    then
    mkdir $2/duplicati
fi

PATH=$PATH:'pwd'
export path

> tmp/spostati
es1-esame-ric.sh $1 'pwd'/$2
echo "ho spostato 'wc -l /tmp/spostati' file."
rm -f /tmp/spostati