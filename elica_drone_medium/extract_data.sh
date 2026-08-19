#!/bin/bash

# Crea o sovrascrive il file di report
OUTPUT="Report_Simulazione.txt"

echo "=====================================" > $OUTPUT
echo "    REPORT DATI ELICA 21 POLLICI     " >> $OUTPUT
echo "=====================================" >> $OUTPUT
echo "" >> $OUTPUT

# Estrae il numero di celle
echo "[1] DIMENSIONE GRIGLIA" >> $OUTPUT
checkMesh | grep "cells:" | tr -s ' ' >> $OUTPUT
echo "" >> $OUTPUT

# Estrae le prestazioni finali
echo "[2] PRESTAZIONI AERODINAMICHE FINALI" >> $OUTPUT
grep -E "Effective lift|Effective drag|Effective power" log.foamRun | tail -n 3 >> $OUTPUT
echo "" >> $OUTPUT

echo "Estrazione completata. Controlla il file $OUTPUT"
