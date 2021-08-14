set xtics rotate ("0-24" 0 , "25-49" 1 , "50-74" 2 , "75-99" 3 , "100-124" 4 , "125-149" 5 , "150-174" 6 , "175-199" 7 , "200-224" 8 , "225-249" 9 , "250-274" 10 , "275-299" 11 , "300-324" 12 , "325-349" 13 , "350-374" 14 , "375-399" 15 , "400-424" 16 , "425-449" 17 , "450-474" 18 , "475-499" 19  )
set nokey
set offsets 1,1,0,0
plot 'progsizes.dat' using 2 with boxes
set output 'images/progsizes.eps' 
set term postscript eps 'Times-Roman' 16
replot
