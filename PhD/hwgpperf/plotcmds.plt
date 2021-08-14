set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
set xrange [0:40]
maxyval=384.862
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_fit_limit_single-8_0.dat' title 'Gen 0' with linespoints
replot 'tmp/hw_fit_limit_single-8_2.dat' title 'Gen 1' with linespoints
replot 'tmp/hw_fit_limit_single-8_10.dat' title 'Gen 10' with linespoints
replot 'tmp/hw_fit_limit_single-8_31.dat' title 'Gen 31' with linespoints
set output 'hw_fit_limit_single-8.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10