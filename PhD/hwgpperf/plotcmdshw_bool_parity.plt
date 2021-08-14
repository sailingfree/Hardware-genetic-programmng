set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=32.1
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_bool_parity_0.dat' title 'Gen 0' with linespoints
replot 'tmp/hw_bool_parity_2.dat' title 'Gen 1' with linespoints
replot 'tmp/hw_bool_parity_10.dat' title 'Gen 10' with linespoints
replot 'tmp/hw_bool_parity_31.dat' title 'Gen 31' with linespoints
set output 'hw_bool_parity.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
