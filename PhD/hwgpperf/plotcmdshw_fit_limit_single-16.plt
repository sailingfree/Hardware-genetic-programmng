set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=122.8
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_fit_limit_single-16_0.dat' title 'Gen 0' with linespoints
replot 'tmp/hw_fit_limit_single-16_2.dat' title 'Gen 1' with linespoints
replot 'tmp/hw_fit_limit_single-16_10.dat' title 'Gen 10' with linespoints
replot 'tmp/hw_fit_limit_single-16_31.dat' title 'Gen 31' with linespoints
set output 'hw_fit_limit_single-16.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10