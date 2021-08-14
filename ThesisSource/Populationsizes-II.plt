set xtics rotate ("0-249" 0 , "250-499" 1 , "500-749" 2 , "750-999" 3 , "1000-1249" 4 , "1250-1499" 5 , "1500-1749" 6 , "1750-1999" 7 , "2000-2249" 8 , "2250-2499" 9 , "2500-2749" 10 , "2750-2999" 11 , "3000-3249" 12 , "3250-3499" 13 , "3500-3749" 14 , "3750-3999" 15 , "4000-4249" 16 , "4250-4499" 17 , "4500-4749" 18 , "4750-4999" 19  )
set nokey
set offsets 1,1,0,0
plot 'Populationsizes-II.dat' using 2 with boxes
set output 'images/Populationsizes-II.eps' 
set term postscript eps 'Times-Roman' 16
replot
