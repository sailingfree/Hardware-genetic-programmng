set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
maxyval=53.2
set key top right
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/sim_nofit_stdgp_0.dat' title 'Gen 0' with linespoints
replot 'tmp/sim_nofit_stdgp_2.dat' title 'Gen 1' with linespoints
replot 'tmp/sim_nofit_stdgp_10.dat' title 'Gen 10' with linespoints
replot 'tmp/sim_nofit_stdgp_31.dat' title 'Gen 31' with linespoints
replot 'tmp/sim_nofit_stdgp_63.dat' title 'Gen 63' with linespoints
set output 'sim_nofit_stdgp.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
