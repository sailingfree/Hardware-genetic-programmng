set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=17.7
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_bool_parity_single_0.dat'    title 'Gen 0' with lines
replot 'tmp/hw_bool_parity_single_2.dat'  title 'Gen 1' with lines
replot 'tmp/hw_bool_parity_single_10.dat' title 'Gen 10' with lines
replot 'tmp/hw_bool_parity_single_63.dat' title 'Gen 63' with lines
set output 'hw_bool_parity_single.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
