#!/bin/sh
#Si scriva il file comandi "verificafile" che chieda all'utente di digitare una stringa a terminale e verifichi se essa corrisponda al nome di
#un file o di un direttorio (specificando di quale dei due si tratti) nel direttorio locale.
#Al termine dell'operazione, il file comandi deve mettersi in attesa che l'utente inserisca un'altra stringa e terminare nel caso in cui l'utente inserisca la stringa "fine".
#verifico che l'utente abbia inserito una stringa diversa da "fine"
while test "$nome" != fine
do
    #lettura pattern
    echo "scrivi il nome del file (inserisci fine per uscire)":
    read nome

    if test "$nome" = fine
    then
        continue
    fi

    #ricerca pattern
    if test -f "$nome"
    then
        echo $nome è un file
    else    
        if test -d "$nome"
        then    
            echo $nome è un direttorio
        else
            echo $nome non esiste
        fi
    fi
done