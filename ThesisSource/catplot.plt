set xtics ("Algorithms " 0 , "Art " 1 , "Classification " 2 , "Control " 3 , "Design " 4 , "Regression " 5  )
set nokey
set offsets 1,1,0,0
plot 'cats.dat' using 2 with boxes
set output 'categories.eps' 
set term postscript eps 'Times-Roman' 16
replot
pause 4
