#!/bin/bash

if test $# -ne 1
then
    echo "Uso: trova_script  dir"
    exit 1
fi

if ! test -d $1 -a -w $1 -a -r $1
then
    echo "Errore: $1 non è una directory oppure non si hanno i diritti necessari"
    exit 2
fi

case $1 in
    /*) ;;
    *) echo "Errore: non è una directory assoluta"
        exit 3;
esac

if test -e "script.txt"
then
    echo "il file script.txt esiste"
else
    echo "il file non esiste ma lo creo"
    > script.txt
fi

echo "bravo hai inserito le cose giuste"

PATH=$PATH:'pwd'
export PATH

sh es2-esame-ric_sh $1
