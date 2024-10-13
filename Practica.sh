#!/bin/bash

# Filtra les línies que tenen exactament 16 columnes
awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv

# Mostra totes les columnes menys la 12 i la 16
cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv

# Mostra totes les línies on la columna 14 no sigui "True"
awk -F',' '$14 != "True"' sortida.csv > nou.csv

# Compta les línies abans de ser filtrades
x=$(wc -l < sortida.csv)
y=$(wc -l < nou.csv)
resul=$((x - y))

# Imprimeix el resultat dels vídeos eliminats
echo "Entrades eliminades: $resul"

# Afegeix una columna "Ranking_Views" i les clasifica segons les visualitzacions (columna 8)
awk -F',' '
    	NR==1 {print $0",Ranking_Views"
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


awk -F',' '
    NR==1 {print $0", Rlikes, Rdislikes"
		next
	}
{
Rlikes=0;
Rdislikes=0;
for (i = 1; i <= NF; i++){
		if(i == 8){
			views =$i;
		} else if (i == 9){
			likes =$i
		} else if (i == 10){
			dislikes=$i
		}
if (views != 0){
	Rlikes = (100/views)*likes;
	Rdislikes = (100/views)*dislikes;
} else{
	Rlikes = "/"
	Rdislikes = "/"
}
}

}' OFS=',' views.csv > ranking.csv
