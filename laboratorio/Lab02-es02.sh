#!/bin/bash

#Si scriva il file comandi "contaricorrenze" che conti (in un file il cui nome è passato come primo parametro) 
#in quante righe
#ricorre (almeno un volta) ognuna delle parole passate come successivi parametri
#Esempio: 
#$ sh contaricorrenze.sh processi sbin var
#Apertura file processi...
#Parametro: sbin - Ricorrenze: 26
#Parametro: var - Ricorrenze: 4

#verifica argomenti
#servono almeno due argomenti 
if test $# -lt 2
then
    echo "usp: contaricorrenze <file> <stringhe...>"
    exit 1
fi

#il primo argomento deve essere un file
file=$1
if test ! -f "$file"
then
    echo "errore: il primo argomento deve essere un file"
    exit 2
fi

#elimino il primo argomento dalla lista
shift

#ricerca pattern
echo apertura file $file
for i in $*
do
    count=$(grep "$i" "$file" | wc -l)
    echo "Parametro: $i - Ricorrenze: $count"
done