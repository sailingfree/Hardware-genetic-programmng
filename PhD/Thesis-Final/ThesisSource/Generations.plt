set xtics rotate ("0-124" 0 , "125-249" 1 , "250-374" 2 , "375-499" 3 , "500-624" 4 , "625-749" 5 , "750-874" 6 , "875-999" 7 , "1000-1124" 8 , "1125-1249" 9 , "1250-1374" 10 , "1375-1499" 11 , "1500-1624" 12 , "1625-1749" 13 , "1750-1874" 14 , "1875-1999" 15 , "2000-2124" 16 , "2125-2249" 17 , "2250-2374" 18 , "2375-2499" 19  )
set nokey
set offsets 1,1,0,0
plot 'Generations.dat' using 2 with boxes
set output 'images/Generations.eps' 
set term postscript eps 'Times-Roman' 16
replot
