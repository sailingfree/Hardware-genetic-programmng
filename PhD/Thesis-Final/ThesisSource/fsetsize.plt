set xtics rotate ("0-3" 0 , "4-7" 1 , "8-11" 2 , "12-15" 3 , "16-19" 4 , "20-23" 5 , "24-27" 6 , "28-31" 7 , "32-35" 8 , "36-39" 9 , "40-43" 10 , "44-47" 11 , "48-51" 12 , "52-55" 13 , "56-59" 14 , "60-63" 15 , "64-67" 16 , "68-71" 17 , "72-75" 18 , "76-79" 19  )
set nokey
set offsets 1,1,0,0
plot 'fsetsize.dat' using 2 with boxes
set output 'images/fsetsize.eps' 
set term postscript eps 'Times-Roman' 16
replot
