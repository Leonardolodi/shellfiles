#!/bin/bash

cd $1
for i in *.jpg
do
    if test -f $i -a -r $i
    then
        if test -e "$2/$i"
        then
            $2/duplicati
            count=1
            while test -e "$2/duplicati/$i-$count"
            do
                count='expr $count+1'
            done
            mv $i "$2/duplicati/$i-$count"
        else
            mv $i "$2/$if"
            echo "$2/$if" >> /tmp/spostati
        fi
    fi
done

#ricorsione

for d in *
do
    if test -d $d
    then
        es1-esame-ric.sh $d $2
    fi
done