
all : hwgp lgpchost

hwgp : hwgp.c hwgph.h Makefile graph.c
	gcc -Wall -I. -g3 -o hwgp.exe hwgp.c -DANT -DLIMITED -DSINGLE graph.c

lgpchost: lgpchost.c
	gcc -I. -o lgpchost lgpchost.c -Wall "c:/Program Files/Celoxica/RC1000/lib/pp1000.lib"

lgpchostms: lgpchost.c
	cl -I. /Z7 -o lgpchost lgpchost.c 

testcase: testcase.c
	cl /nologo -I. /Z7 -o testcase testcase.c -I"c:/Program Files/Celoxica/RC1000/include/" "c:/Program Files/Celoxica/RC1000/lib/pp1000.lib" "c:/Program Files/Microsoft Visual Studio/VC98/lib/chkstk.obj"  

backup:
	tar cvf hwgp-backup-`date +"%d-%m-%y-%H-%M"`.tar hwgp.c hwgph.h Makefile anttrail.c lgpchost.c runstats*
