#!/bin/bash

# Create or overwrite the report file
OUTPUT="simulation_report.txt"

echo "=====================================" > $OUTPUT
echo "   21-INCH PROPELLER DATA REPORT     " >> $OUTPUT
echo "=====================================" >> $OUTPUT
echo "" >> $OUTPUT

# Extract cell count
echo "[1] GRID SIZE" >> $OUTPUT
checkMesh | grep "cells:" | tr -s ' ' >> $OUTPUT
echo "" >> $OUTPUT

# Extract final aerodynamic performance
echo "[2] FINAL AERODYNAMIC PERFORMANCE" >> $OUTPUT
grep -E "Effective lift|Effective drag|Effective power" log.foamRun | tail -n 3 >> $OUTPUT
echo "" >> $OUTPUT

echo "Extraction complete. Check the file $OUTPUT"
