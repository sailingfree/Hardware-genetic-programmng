set xlabel 'Program Length'
set ylabel 'Number of Programs'
set ytics rotate
set xrange [0:32]
maxyval=89.234
set key 20,maxyval-(maxyval/20)
set mxtics 5
set grid xtics mxtics ytics mytics
set nogrid
plot 'tmp/sim_nofit_trunc_0.dat' title 'Gen 0' with linespoints
replot 'tmp/sim_nofit_trunc_2.dat' title 'Gen 1' with linespoints
replot 'tmp/sim_nofit_trunc_10.dat' title 'Gen 10' with linespoints
replot 'tmp/sim_nofit_trunc_31.dat' title 'Gen 31' with linespoints
set output 'sim_nofit_trunc.eps'
set term postscript eps 'Times-Roman' 24
replot
pause 10
