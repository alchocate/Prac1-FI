#!/bin/bash
awk -F',' '{ if (NF == 16) print $0 }' CAvideos.csv > supervivents.csv
cut -d ',' --complement -f12,16 supervivents.csv > sortida.csv
awk -F',' '$14 != "True"' sortida.csv > nou.csv
