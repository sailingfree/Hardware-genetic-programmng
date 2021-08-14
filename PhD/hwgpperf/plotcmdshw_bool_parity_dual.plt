set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=21.99
set key top left
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_bool_parity_dual_0.dat' title 'Gen 0' with lines
replot 'tmp/hw_bool_parity_dual_2.dat' title 'Gen 1' with lines
replot 'tmp/hw_bool_parity_dual_10.dat' title 'Gen 10' with lines
replot 'tmp/hw_bool_parity_dual_31.dat' title 'Gen 31' with lines
replot 'tmp/hw_bool_parity_dual_63.dat' title 'Gen 63' with lines
set output 'hw_bool_parity_dual.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
