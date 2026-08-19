set terminal pngcairo size 800,600 font "Arial,12"
set output "grafico_residui.png"

set title "Andamento dei Residui (Mesh Fine)" font "Arial:Bold,14"
set xlabel "Iterazioni" font "Arial:Bold,12"
set ylabel "Residuo (Scala Logaritmica)" font "Arial:Bold,12"

set logscale y
set format y "%.0e"
set grid

plot "logs/Ux_0" using 1:2 with lines lw 2 title "Ux", \
     "logs/Uy_0" using 1:2 with lines lw 2 title "Uy", \
     "logs/Uz_0" using 1:2 with lines lw 2 title "Uz", \
     "logs/p_0" using 1:2 with lines lw 2 title "Pressione (p)"

