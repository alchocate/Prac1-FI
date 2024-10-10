#!/bin/bash

awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv

cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv

awk -F',' '$14 != "True"' sortida.csv > nou.csv
x=$(wc -l < sortida.csv)
y=$(wc -l < nou.csv)
resul=$((x - y)) #fa la diferencia entre el arxius abans i despres de filtrar
echo "Entrades eliminades: $resul" #ho imprimeix



awk -F',' '{
		if ($8 <1000000) {print $0,"Bo"
		} else if ($8 >10000000) {
			print $0,"Excel·lent"
		} else {
			print $0,"Estrella"}
}' OFS=, nou.csv > views.csv #la comanda OFS, investigada a part, fa que la sortida tingui com a separador la coma, i no un espai.


cat views.csv





