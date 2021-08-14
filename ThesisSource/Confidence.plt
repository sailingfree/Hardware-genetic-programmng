set xtics rotate ("0-9" 0 , "10-19" 1 , "20-29" 2 , "30-39" 3 , "40-49" 4 , "50-59" 5 , "60-69" 6 , "70-79" 7 , "80-89" 8 , "90-99" 9  )
set nokey
set offsets 1,1,0,0
plot 'Confidence.dat' using 2 with boxes
set output 'images/Confidence.eps' 
set term postscript eps 'Times-Roman' 16
replot
