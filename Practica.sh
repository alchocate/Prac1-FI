#!/bin/bash

# Filtra líneas con exactamente 16 campos
awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv

# Elimina las columnas 12 y 16
cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv

# Filtra líneas donde la columna 14 no sea "True"
awk -F',' '$14 != "True"' sortida.csv > nou.csv

# Cuenta las líneas antes y después del filtrado
x=$(wc -l < sortida.csv)
y=$(wc -l < nou.csv)
resul=$((x - y))

# Imprime el número de entradas eliminadas
echo "Entrades eliminades: $resul"

# Añade una columna "Ranking_Views" y clasifica según la columna 8
awk -F',' '
    NR==1 {
        print $0",Ranking_Views"
        next
    }
    {
        if ($8 < 1000000) {
            print $0",Bo"
        } else if ($8 > 1000000 && $8 <= 10000000) {
            print $0",Excel·lent"
        } else if ($8 > 10000000) {
            print $0",Estrella"
        }
    }
' OFS=',' nou.csv > views.csv


