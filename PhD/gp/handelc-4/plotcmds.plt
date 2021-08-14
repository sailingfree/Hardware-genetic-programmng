set nokey
set title 'Fitness value against generation
set xlabel 'Generation'
set ylabel 'Fitness (percent)'
set ytics rotate
plot 'y.dat' with boxes
replot
