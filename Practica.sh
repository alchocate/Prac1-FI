#!/bin/bash

awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv #ordre donada per l'enunciat, elimina las columnes incompletes
#explicada millor a l'informe

cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv #exercisi 1. La ordre es agafa tot menys la columna 12 i 16 i el copia a sortida.csv

awk -F',' '$14 != "True"' sortida.csv > nou.csv #comprova quines no tenen la etiqueta True i els guarda a nou.csv
x=$(wc -l < sortida.csv) 
y=$(wc -l < nou.csv) #compta les paraules de nou.csv i et retorna un enter, que s asigna a una variable (el mateix amb l anterior)
resul=$((x - y)) #fa la diferencia entre el arxius abans i despres de filtrar
echo "Entrades eliminades: $resul" #ho imprimeix



awk -F',' '{
		if ($8 <1000000) {print $0,"Bo"
		} else if ($8 >10000000) {
			print $0,"Excel·lent"
		} else {
			print $0,"Estrella"}
}' OFS=',' nou.csv > views.csv #la comanda OFS, investigada a part, fa que la sortida tingui com a separador la coma, i no un espai.


cat views.csv





