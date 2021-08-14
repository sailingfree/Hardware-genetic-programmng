set xtics ("Algorithms " 0 , "Art " 1 , "Classification " 2 , "Control " 3 , "Design " 4 , "Regression " 5  )
set nokey
set offsets 1,1,0,0
plot 'categories.dat' using 2 with boxes
set output 'images/categories.eps' 
set term postscript eps 'Times-Roman' 16
replot
