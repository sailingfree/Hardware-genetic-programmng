set xtics rotate ("0-1" 0 , "1-2" 1 , "2-3" 2 , "3-4" 3 , "4-5" 4 , "5-6" 5 , "6-7" 6 , "7-8" 7 , "8-9" 8 , "9-10" 9 , "10-11" 10 , "11-12" 11 , "12-13" 12 , "13-14" 13 , "14-15" 14 , "15-16" 15 , "16-17" 16 , "17-18" 17 , "18-19" 18 , "19-20" 19  )
set nokey
set offsets 1,1,0,0
plot 'Algorithms.dat' using 2 with boxes
set output 'Algorithms.eps' 
set term postscript eps 'Times-Roman' 16
replot
pause 4
