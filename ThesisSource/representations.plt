set xtics ("Unknown " 0 , "graph " 1 , "linear " 2 , "stack " 3 , "tree " 4  )
set nokey
set offsets 1,1,0,0
plot 'representations.dat' using 2 with boxes
set output 'images/representations.eps' 
set term postscript eps 'Times-Roman' 16
replot
