#!/bin/bash

awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv
cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv
awk -F',' '$14 != "True"' sortida.csv > nou.csv

x=$(wc -l < sortida.csv)

y=$(wc -l < nou.csv)


resul=$((x - y)) #fa la diferencia entre el arxius abans i despres de filtrar


echo "Entrades eliminades: $resul" #ho imprimeix



# awk -F ',' | {if -f 8 <1000000} > -f 17 =="Bo" nou.csv




