set xtics rotate ("0-2" 0  )
set nokey
set offsets 1,1,0,0
plot 'linear.dat' using 2 with boxes
set output 'linear.eps' 
set term postscript eps 'Times-Roman' 16
replot
pause 4
