set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
set xrange [0:32]
maxyval=84.738
set key 
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/sim_nofit_limit_0.dat' title 'Gen 0' with linespoints
replot 'tmp/sim_nofit_limit_2.dat' title 'Gen 1' with linespoints
replot 'tmp/sim_nofit_limit_10.dat' title 'Gen 10' with linespoints
replot 'tmp/sim_nofit_limit_31.dat' title 'Gen 31' with linespoints
set output 'sim_nofit_limit.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
