/*
 * Clock 
 */
set clock = external "D17" with {rate=220};

unsigned int 16 outval;
interface bus_out() OutBus(outval) with 
	{data={ "AN29", "AM31", "AD29", "AF31",
			"AE30", "AG33", "AH33", "AE29",
			"AJ26", "AF30", "AH32", "AJ32",
			"AF29", "AH31", "AG30", "AK32"
									   }};

ram unsigned int 8 d1[8] = {1,2,3,4,5,6,7,8};
/*
 * Function main
 */
 #define N 32
void main(void)
{
	unsigned int 3 idx;
	unsigned int 9 c1,c2;

	idx = 0;

	c1 = 0;
	c2 = 0;
    
    do    {
		do {
            c2=0@d1[idx];
			outval = c2[7:0]@c1[7:0];		
			c1++;
		} while(!c1[8]);
	c2++;
	c1=0;
    } while (!c2[8]);
}

