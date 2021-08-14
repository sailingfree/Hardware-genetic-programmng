set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=65.022
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/hw_nofit_trunc_0.dat' title 'Gen 0' with linespoints
replot 'tmp/hw_nofit_trunc_2.dat' title 'Gen 1' with linespoints
replot 'tmp/hw_nofit_trunc_10.dat' title 'Gen 10' with linespoints
replot 'tmp/hw_nofit_trunc_31.dat' title 'Gen 31' with linespoints
replot 'tmp/hw_nofit_trunc_63.dat' title 'Gen 63' with linespoints
set output 'hw_nofit_trunc.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
