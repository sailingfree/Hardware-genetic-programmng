set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=96.8
set key top left
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_fit_trunc_0.dat' title 'Gen 0' with linespoints
replot 'tmp/hw_fit_trunc_2.dat' title 'Gen 1' with linespoints
replot 'tmp/hw_fit_trunc_10.dat' title 'Gen 10' with linespoints
replot 'tmp/hw_fit_trunc_31.dat' title 'Gen 31' with linespoints
replot 'tmp/hw_fit_trunc_63.dat' title 'Gen 63' with linespoints
set output 'hw_fit_trunc.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
