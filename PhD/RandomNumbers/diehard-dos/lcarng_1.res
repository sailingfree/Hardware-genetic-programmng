       NOTE: Most of the tests in DIEHARD return a p-value, which             
       should be uniform on [0,1) if the input file contains truly            
       independent random bits.   Those p-values are obtained by              
       p=F(X), where F is the assumed distribution of the sample              
       random variable X---often normal. But that assumed F is just           
       an asymptotic approximation, for which the fit will be worst           
       in the tails. Thus you should not be surprised with                    
       occasional p-values near 0 or 1, such as .0012 or .9983.               
       When a bit stream really FAILS BIG, you will get p's of 0 or           
       1 to six or more places.  By all means, do not, as a                   
       Statistician might, think that a p < .025 or p> .975 means             
       that the RNG has "failed the test at the .05 level".  Such             
       p's happen among the hundreds that DIEHARD produces, even              
       with good RNG's.  So keep in mind that " p happens".                   
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::            This is the BIRTHDAY SPACINGS TEST                 ::      
     :: Choose m birthdays in a year of n days.  List the spacings    ::      
     :: between the birthdays.  If j is the number of values that     ::      
     :: occur more than once in that list, then j is asymptotically   ::      
     :: Poisson distributed with mean m^3/(4n).  Experience shows n   ::      
     :: must be quite large, say n>=2^18, for comparing the results   ::      
     :: to the Poisson distribution with that mean.  This test uses   ::      
     :: n=2^24 and m=2^9,  so that the underlying distribution for j  ::      
     :: is taken to be Poisson with lambda=2^27/(2^26)=2.  A sample   ::      
     :: of 500 j's is taken, and a chi-square goodness of fit test    ::      
     :: provides a p value.  The first test uses bits 1-24 (counting  ::      
     :: from the left) from integers in the specified file.           ::      
     ::   Then the file is closed and reopened. Next, bits 2-25 are   ::      
     :: used to provide birthdays, then 3-26 and so on to bits 9-32.  ::      
     :: Each set of bits provides a p-value, and the nine p-values    ::      
     :: provide a sample for a KSTEST.                                ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
 BIRTHDAY SPACINGS TEST, M= 512 N=2**24 LAMBDA=  2.0000
           Results for lcarng_1.bin   
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  1 to 24   2.058
  duplicate       number       number 
  spacings       observed     expected
        0          64.       67.668
        1         130.      135.335
        2         137.      135.335
        3          96.       90.224
        4          48.       45.112
        5          12.       18.045
  6 to INF         13.        8.282
 Chisquare with  6 d.o.f. =     5.70 p-value=  .542052
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  2 to 25   2.052
  duplicate       number       number 
  spacings       observed     expected
        0          75.       67.668
        1         111.      135.335
        2         137.      135.335
        3         101.       90.224
        4          53.       45.112
        5          16.       18.045
  6 to INF          7.        8.282
 Chisquare with  6 d.o.f. =     8.29 p-value=  .782207
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  3 to 26   2.102
  duplicate       number       number 
  spacings       observed     expected
        0          60.       67.668
        1         120.      135.335
        2         144.      135.335
        3          99.       90.224
        4          52.       45.112
        5          17.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     5.14 p-value=  .473618
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  4 to 27   2.060
  duplicate       number       number 
  spacings       observed     expected
        0          58.       67.668
        1         135.      135.335
        2         136.      135.335
        3          99.       90.224
        4          47.       45.112
        5          16.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     2.61 p-value=  .144277
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  5 to 28   2.052
  duplicate       number       number 
  spacings       observed     expected
        0          59.       67.668
        1         143.      135.335
        2         136.      135.335
        3          85.       90.224
        4          47.       45.112
        5          18.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =     3.60 p-value=  .269176
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  6 to 29   2.052
  duplicate       number       number 
  spacings       observed     expected
        0          68.       67.668
        1         129.      135.335
        2         135.      135.335
        3          86.       90.224
        4          50.       45.112
        5          23.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     2.45 p-value=  .125922
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  7 to 30   2.078
  duplicate       number       number 
  spacings       observed     expected
        0          75.       67.668
        1         113.      135.335
        2         139.      135.335
        3          87.       90.224
        4          55.       45.112
        5          20.       18.045
  6 to INF         11.        8.282
 Chisquare with  6 d.o.f. =     7.97 p-value=  .759434
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  8 to 31   2.062
  duplicate       number       number 
  spacings       observed     expected
        0          68.       67.668
        1         132.      135.335
        2         114.      135.335
        3         114.       90.224
        4          44.       45.112
        5          19.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     9.85 p-value=  .869034
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_1.bin     using bits  9 to 32   2.096
  duplicate       number       number 
  spacings       observed     expected
        0          61.       67.668
        1         128.      135.335
        2         141.      135.335
        3          92.       90.224
        4          42.       45.112
        5          24.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =     5.18 p-value=  .478560
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
        .542052   .782207   .473618   .144277   .269176
        .125922   .759434   .869034   .478560
  A KSTEST for the 9 p-values yields  .046759

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::            THE OVERLAPPING 5-PERMUTATION TEST                 ::      
     :: This is the OPERM5 test.  It looks at a sequence of one mill- ::      
     :: ion 32-bit random integers.  Each set of five consecutive     ::      
     :: integers can be in one of 120 states, for the 5! possible or- ::      
     :: derings of five numbers.  Thus the 5th, 6th, 7th,...numbers   ::      
     :: each provide a state. As many thousands of state transitions  ::      
     :: are observed,  cumulative counts are made of the number of    ::      
     :: occurences of each state.  Then the quadratic form in the     ::      
     :: weak inverse of the 120x120 covariance matrix yields a test   ::      
     :: equivalent to the likelihood ratio test that the 120 cell     ::      
     :: counts came from the specified (asymptotically) normal dis-   ::      
     :: tribution with the specified 120x120 covariance matrix (with  ::      
     :: rank 99).  This version uses 1,000,000 integers, twice.       ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
           OPERM5 test for file lcarng_1.bin   
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=*******; p-value=1.000000
           OPERM5 test for file lcarng_1.bin   
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=*******; p-value=1.000000
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 31x31 matrices. The leftmost ::      
     :: 31 bits of 31 random integers from the test sequence are used ::      
     :: to form a 31x31 binary matrix over the field {0,1}. The rank  ::      
     :: is determined. That rank can be from 0 to 31, but ranks< 28   ::      
     :: are rare, and their counts are pooled with those for rank 28. ::      
     :: Ranks are found for 40,000 such random matrices and a chisqua-::      
     :: re test is performed on counts for ranks 31,30,29 and <=28.   ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
    Binary rank test for lcarng_1.bin   
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28       201     211.4   .513367     .513
        29      5168    5134.0   .225029     .738
        30     22953   23103.0   .974506    1.713
        31     11678   11551.5  1.384759    3.098
  chisquare= 3.098 for 3 d. of f.; p-value= .662391
--------------------------------------------------------------
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 32x32 matrices. A random 32x ::      
     :: 32 binary matrix is formed, each row a 32-bit random integer. ::      
     :: The rank is determined. That rank can be from 0 to 32, ranks  ::      
     :: less than 29 are rare, and their counts are pooled with those ::      
     :: for rank 29.  Ranks are found for 40,000 such random matrices ::      
     :: and a chisquare test is performed on counts for ranks  32,31, ::      
     :: 30 and <=29.                                                  ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
    Binary rank test for lcarng_1.bin   
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29       186     211.4  3.055915    3.056
        30      5241    5134.0  2.229603    5.286
        31     23202   23103.0   .423828    5.709
        32     11371   11551.5  2.821192    8.531
  chisquare= 8.531 for 3 d. of f.; p-value= .965516
--------------------------------------------------------------

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 6x8 matrices.  From each of  ::      
     :: six random 32-bit integers from the generator under test, a   ::      
     :: specified byte is chosen, and the resulting six bytes form a  ::      
     :: 6x8 binary matrix whose rank is determined.  That rank can be ::      
     :: from 0 to 6, but ranks 0,1,2,3 are rare; their counts are     ::      
     :: pooled with those for rank 4. Ranks are found for 100,000     ::      
     :: random matrices, and a chi-square test is performed on        ::      
     :: counts for ranks 6,5 and <=4.                                 ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
         Binary Rank Test for lcarng_1.bin   
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1586       944.3     436.066     436.066
          r =5        17269     21743.9     920.936    1357.001
          r =6        81145     77311.8     190.054    1547.055
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1584       944.3     433.352     433.352
          r =5        17463     21743.9     842.816    1276.168
          r =6        80953     77311.8     171.491    1447.659
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1550       944.3     388.510     388.510
          r =5        17254     21743.9     927.120    1315.631
          r =6        81196     77311.8     195.145    1510.775
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1555       944.3     394.951     394.951
          r =5        17280     21743.9     916.414    1311.365
          r =6        81165     77311.8     192.042    1503.407
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1557       944.3     397.542     397.542
          r =5        17307     21743.9     905.361    1302.904
          r =6        81136     77311.8     189.162    1492.066
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1557       944.3     397.542     397.542
          r =5        17383     21743.9     874.611    1272.153
          r =6        81060     77311.8     181.718    1453.871
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1560       944.3     401.445     401.445
          r =5        17143     21743.9     973.527    1374.972
          r =6        81297     77311.8     205.425    1580.397
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1555       944.3     394.951     394.951
          r =5        17332     21743.9     895.187    1290.139
          r =6        81113     77311.8     186.894    1477.032
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1557       944.3     397.542     397.542
          r =5        17469     21743.9     840.455    1237.997
          r =6        80974     77311.8     173.475    1411.473
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1578       944.3     425.261     425.261
          r =5        17242     21743.9     932.082    1357.343
          r =6        81180     77311.8     193.540    1550.883
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1601       944.3     456.690     456.690
          r =5        17121     21743.9     982.860    1439.550
          r =6        81278     77311.8     203.471    1643.021
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1592       944.3     444.258     444.258
          r =5        17318     21743.9     900.878    1345.136
          r =6        81090     77311.8     184.639    1529.775
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1558       944.3     398.841     398.841
          r =5        17389     21743.9     872.206    1271.047
          r =6        81053     77311.8     181.040    1452.087
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1554       944.3     393.659     393.659
          r =5        17208     21743.9     946.214    1339.873
          r =6        81238     77311.8     199.388    1539.261
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1568       944.3     411.945     411.945
          r =5        17071     21743.9    1004.236    1416.180
          r =6        81361     77311.8     212.076    1628.256
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1547       944.3     384.671     384.671
          r =5        17327     21743.9     897.218    1281.889
          r =6        81126     77311.8     188.174    1470.063
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1534       944.3     368.256     368.256
          r =5        17277     21743.9     917.646    1285.902
          r =6        81189     77311.8     194.442    1480.344
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1534       944.3     368.256     368.256
          r =5        17255     21743.9     926.707    1294.963
          r =6        81211     77311.8     196.655    1491.618
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1536       944.3     370.758     370.758
          r =5        17106     21743.9     989.248    1360.007
          r =6        81358     77311.8     211.762    1571.769
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1541       944.3     377.051     377.051
          r =5        17268     21743.9     921.347    1298.398
          r =6        81191     77311.8     194.642    1493.040
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1607       944.3     465.074     465.074
          r =5        17267     21743.9     921.759    1386.833
          r =6        81126     77311.8     188.174    1575.007
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1528       944.3     360.800     360.800
          r =5        17249     21743.9     929.186    1289.986
          r =6        81223     77311.8     197.867    1487.853
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1540       944.3     375.788     375.788
          r =5        17355     21743.9     885.878    1261.666
          r =6        81105     77311.8     186.108    1447.774
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1596       944.3     449.762     449.762
          r =5        17282     21743.9     915.593    1365.355
          r =6        81122     77311.8     187.780    1553.135
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_1.bin   
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1600       944.3     455.300     455.300
          r =5        17248     21743.9     929.600    1384.900
          r =6        81152     77311.8     190.748    1575.648
                        p=1-exp(-SUM/2)=1.00000
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
   brank test summary for lcarng_1.bin   
       The KS test for those 25 supposed UNI's yields
                    KS p-value=1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::                   THE BITSTREAM TEST                          ::      
     :: The file under test is viewed as a stream of bits. Call them  ::      
     :: b1,b2,... .  Consider an alphabet with two "letters", 0 and 1 ::      
     :: and think of the stream of bits as a succession of 20-letter  ::      
     :: "words", overlapping.  Thus the first word is b1b2...b20, the ::      
     :: second is b2b3...b21, and so on.  The bitstream test counts   ::      
     :: the number of missing 20-letter (20-bit) words in a string of ::      
     :: 2^21 overlapping 20-letter words.  There are 2^20 possible 20 ::      
     :: letter words.  For a truly random string of 2^21+19 bits, the ::      
     :: number of missing words j should be (very close to) normally  ::      
     :: distributed with mean 141,909 and sigma 428.  Thus            ::      
     ::  (j-141909)/428 should be a standard normal variate (z score) ::      
     :: that leads to a uniform [0,1) p value.  The test is repeated  ::      
     :: twenty times.                                                 ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
       THE OVERLAPPING 20-tuples BITSTREAM TEST,
            20 BITS PER WORD, 2^21 words.
    This test samples the bitstream 20 times.
  No. missing words should average  141909. with sigma=428.
-----------------------------------        ---------------
 tst no  1:  169663 missing words,   64.85 sigmas from mean, p-value=1.00000
 tst no  2:  240975 missing words,  231.46 sigmas from mean, p-value=1.00000
 tst no  3:  240666 missing words,  230.74 sigmas from mean, p-value=1.00000
 tst no  4:  241522 missing words,  232.74 sigmas from mean, p-value=1.00000
 tst no  5:  240053 missing words,  229.31 sigmas from mean, p-value=1.00000
 tst no  6:  239831 missing words,  228.79 sigmas from mean, p-value=1.00000
 tst no  7:  240397 missing words,  230.11 sigmas from mean, p-value=1.00000
 tst no  8:  241692 missing words,  233.14 sigmas from mean, p-value=1.00000
 tst no  9:  240953 missing words,  231.41 sigmas from mean, p-value=1.00000
 tst no 10:  241039 missing words,  231.61 sigmas from mean, p-value=1.00000
 tst no 11:  240690 missing words,  230.80 sigmas from mean, p-value=1.00000
 tst no 12:  241090 missing words,  231.73 sigmas from mean, p-value=1.00000
 tst no 13:  242164 missing words,  234.24 sigmas from mean, p-value=1.00000
 tst no 14:  241629 missing words,  232.99 sigmas from mean, p-value=1.00000
 tst no 15:  240652 missing words,  230.71 sigmas from mean, p-value=1.00000
 tst no 16:  240906 missing words,  231.30 sigmas from mean, p-value=1.00000
 tst no 17:  241641 missing words,  233.02 sigmas from mean, p-value=1.00000
 tst no 18:  240608 missing words,  230.60 sigmas from mean, p-value=1.00000
 tst no 19:  240614 missing words,  230.62 sigmas from mean, p-value=1.00000
 tst no 20:  241074 missing words,  231.69 sigmas from mean, p-value=1.00000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::             The tests OPSO, OQSO and DNA                      ::      
     ::         OPSO means Overlapping-Pairs-Sparse-Occupancy         ::      
     :: The OPSO test considers 2-letter words from an alphabet of    ::      
     :: 1024 letters.  Each letter is determined by a specified ten   ::      
     :: bits from a 32-bit integer in the sequence to be tested. OPSO ::      
     :: generates  2^21 (overlapping) 2-letter words  (from 2^21+1    ::      
     :: "keystrokes")  and counts the number of missing words---that  ::      
     :: is 2-letter words which do not appear in the entire sequence. ::      
     :: That count should be very close to normally distributed with  ::      
     :: mean 141,909, sigma 290. Thus (missingwrds-141909)/290 should ::      
     :: be a standard normal variable. The OPSO test takes 32 bits at ::      
     :: a time from the test file and uses a designated set of ten    ::      
     :: consecutive bits. It then restarts the file for the next de-  ::      
     :: signated 10 bits, and so on.                                  ::      
     ::                                                               ::      
     ::     OQSO means Overlapping-Quadruples-Sparse-Occupancy        ::      
     ::   The test OQSO is similar, except that it considers 4-letter ::      
     :: words from an alphabet of 32 letters, each letter determined  ::      
     :: by a designated string of 5 consecutive bits from the test    ::      
     :: file, elements of which are assumed 32-bit random integers.   ::      
     :: The mean number of missing words in a sequence of 2^21 four-  ::      
     :: letter words,  (2^21+3 "keystrokes"), is again 141909, with   ::      
     :: sigma = 295.  The mean is based on theory; sigma comes from   ::      
     :: extensive simulation.                                         ::      
     ::                                                               ::      
     ::    The DNA test considers an alphabet of 4 letters::  C,G,A,T,::      
     :: determined by two designated bits in the sequence of random   ::      
     :: integers being tested.  It considers 10-letter words, so that ::      
     :: as in OPSO and OQSO, there are 2^20 possible words, and the   ::      
     :: mean number of missing words from a string of 2^21  (over-    ::      
     :: lapping)  10-letter  words (2^21+9 "keystrokes") is 141909.   ::      
     :: The standard deviation sigma=339 was determined as for OQSO   ::      
     :: by simulation.  (Sigma for OPSO, 290, is the true value (to   ::      
     :: three places), not determined by simulation.                  ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
 OPSO test for generator lcarng_1.bin             
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for lcarng_1.bin    using bits 23 to 32       1044997******* 1.0000
    OPSO for lcarng_1.bin    using bits 22 to 31       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits 21 to 30       1044998******* 1.0000
    OPSO for lcarng_1.bin    using bits 20 to 29       1045000******* 1.0000
    OPSO for lcarng_1.bin    using bits 19 to 28       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits 18 to 27       1044997******* 1.0000
    OPSO for lcarng_1.bin    using bits 17 to 26       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits 16 to 25       1044997******* 1.0000
    OPSO for lcarng_1.bin    using bits 15 to 24       1044997******* 1.0000
    OPSO for lcarng_1.bin    using bits 14 to 23       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits 13 to 22       1044996******* 1.0000
    OPSO for lcarng_1.bin    using bits 12 to 21       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits 11 to 20       1044994******* 1.0000
    OPSO for lcarng_1.bin    using bits 10 to 19       1044994******* 1.0000
    OPSO for lcarng_1.bin    using bits  9 to 18       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits  8 to 17       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits  7 to 16       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits  6 to 15       1045000******* 1.0000
    OPSO for lcarng_1.bin    using bits  5 to 14       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits  4 to 13       1044995******* 1.0000
    OPSO for lcarng_1.bin    using bits  3 to 12       1044992******* 1.0000
    OPSO for lcarng_1.bin    using bits  2 to 11       1044993******* 1.0000
    OPSO for lcarng_1.bin    using bits  1 to 10       1044993******* 1.0000
 OQSO test for generator lcarng_1.bin             
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for lcarng_1.bin    using bits 28 to 32       1046581******* 1.0000
    OQSO for lcarng_1.bin    using bits 27 to 31       1046599******* 1.0000
    OQSO for lcarng_1.bin    using bits 26 to 30       1046595******* 1.0000
    OQSO for lcarng_1.bin    using bits 25 to 29       1046569******* 1.0000
    OQSO for lcarng_1.bin    using bits 24 to 28       1046561******* 1.0000
    OQSO for lcarng_1.bin    using bits 23 to 27       1046592******* 1.0000
    OQSO for lcarng_1.bin    using bits 22 to 26       1046574******* 1.0000
    OQSO for lcarng_1.bin    using bits 21 to 25       1046595******* 1.0000
    OQSO for lcarng_1.bin    using bits 20 to 24       1046595******* 1.0000
    OQSO for lcarng_1.bin    using bits 19 to 23       1046599******* 1.0000
    OQSO for lcarng_1.bin    using bits 18 to 22       1046595******* 1.0000
    OQSO for lcarng_1.bin    using bits 17 to 21       1046610******* 1.0000
    OQSO for lcarng_1.bin    using bits 16 to 20       1046584******* 1.0000
    OQSO for lcarng_1.bin    using bits 15 to 19       1046582******* 1.0000
    OQSO for lcarng_1.bin    using bits 14 to 18       1046564******* 1.0000
    OQSO for lcarng_1.bin    using bits 13 to 17       1046574******* 1.0000
    OQSO for lcarng_1.bin    using bits 12 to 16       1046562******* 1.0000
    OQSO for lcarng_1.bin    using bits 11 to 15       1046579******* 1.0000
    OQSO for lcarng_1.bin    using bits 10 to 14       1046583******* 1.0000
    OQSO for lcarng_1.bin    using bits  9 to 13       1046557******* 1.0000
    OQSO for lcarng_1.bin    using bits  8 to 12       1046566******* 1.0000
    OQSO for lcarng_1.bin    using bits  7 to 11       1046591******* 1.0000
    OQSO for lcarng_1.bin    using bits  6 to 10       1046577******* 1.0000
    OQSO for lcarng_1.bin    using bits  5 to  9       1046584******* 1.0000
    OQSO for lcarng_1.bin    using bits  4 to  8       1046580******* 1.0000
    OQSO for lcarng_1.bin    using bits  3 to  7       1046600******* 1.0000
    OQSO for lcarng_1.bin    using bits  2 to  6       1046591******* 1.0000
    OQSO for lcarng_1.bin    using bits  1 to  5       1046575******* 1.0000
  DNA test for generator lcarng_1.bin             
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for lcarng_1.bin    using bits 31 to 32       1029976******* 1.0000
     DNA for lcarng_1.bin    using bits 30 to 31       1030176******* 1.0000
     DNA for lcarng_1.bin    using bits 29 to 30       1030223******* 1.0000
     DNA for lcarng_1.bin    using bits 28 to 29       1030107******* 1.0000
     DNA for lcarng_1.bin    using bits 27 to 28       1030180******* 1.0000
     DNA for lcarng_1.bin    using bits 26 to 27       1030204******* 1.0000
     DNA for lcarng_1.bin    using bits 25 to 26       1029908******* 1.0000
     DNA for lcarng_1.bin    using bits 24 to 25       1030219******* 1.0000
     DNA for lcarng_1.bin    using bits 23 to 24       1030109******* 1.0000
     DNA for lcarng_1.bin    using bits 22 to 23       1030035******* 1.0000
     DNA for lcarng_1.bin    using bits 21 to 22       1030004******* 1.0000
     DNA for lcarng_1.bin    using bits 20 to 21       1030147******* 1.0000
     DNA for lcarng_1.bin    using bits 19 to 20       1030116******* 1.0000
     DNA for lcarng_1.bin    using bits 18 to 19       1030186******* 1.0000
     DNA for lcarng_1.bin    using bits 17 to 18       1030068******* 1.0000
     DNA for lcarng_1.bin    using bits 16 to 17       1030122******* 1.0000
     DNA for lcarng_1.bin    using bits 15 to 16       1030140******* 1.0000
     DNA for lcarng_1.bin    using bits 14 to 15       1030100******* 1.0000
     DNA for lcarng_1.bin    using bits 13 to 14       1030164******* 1.0000
     DNA for lcarng_1.bin    using bits 12 to 13       1030032******* 1.0000
     DNA for lcarng_1.bin    using bits 11 to 12       1029965******* 1.0000
     DNA for lcarng_1.bin    using bits 10 to 11       1029916******* 1.0000
     DNA for lcarng_1.bin    using bits  9 to 10       1030233******* 1.0000
     DNA for lcarng_1.bin    using bits  8 to  9       1030125******* 1.0000
     DNA for lcarng_1.bin    using bits  7 to  8       1030100******* 1.0000
     DNA for lcarng_1.bin    using bits  6 to  7       1029972******* 1.0000
     DNA for lcarng_1.bin    using bits  5 to  6       1030108******* 1.0000
     DNA for lcarng_1.bin    using bits  4 to  5       1030018******* 1.0000
     DNA for lcarng_1.bin    using bits  3 to  4       1030084******* 1.0000
     DNA for lcarng_1.bin    using bits  2 to  3       1029976******* 1.0000
     DNA for lcarng_1.bin    using bits  1 to  2       1030069******* 1.0000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::     This is the COUNT-THE-1's TEST on a stream of bytes.      ::      
     :: Consider the file under test as a stream of bytes (four per   ::      
     :: 32 bit integer).  Each byte can contain from 0 to 8 1's,      ::      
     :: with probabilities 1,8,28,56,70,56,28,8,1 over 256.  Now let  ::      
     :: the stream of bytes provide a string of overlapping  5-letter ::      
     :: words, each "letter" taking values A,B,C,D,E. The letters are ::      
     :: determined by the number of 1's in a byte::  0,1,or 2 yield A,::      
     :: 3 yields B, 4 yields C, 5 yields D and 6,7 or 8 yield E. Thus ::      
     :: we have a monkey at a typewriter hitting five keys with vari- ::      
     :: ous probabilities (37,56,70,56,37 over 256).  There are 5^5   ::      
     :: possible 5-letter words, and from a string of 256,000 (over-  ::      
     :: lapping) 5-letter words, counts are made on the frequencies   ::      
     :: for each word.   The quadratic form in the weak inverse of    ::      
     :: the covariance matrix of the cell counts provides a chisquare ::      
     :: test::  Q5-Q4, the difference of the naive Pearson sums of    ::      
     :: (OBS-EXP)^2/EXP on counts for 5- and 4-letter cell counts.    ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
   Test results for lcarng_1.bin   
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for lcarng_1.bin   *********  18282.051     1.000000
 byte stream for lcarng_1.bin   *********  18278.121     1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::     This is the COUNT-THE-1's TEST for specific bytes.        ::      
     :: Consider the file under test as a stream of 32-bit integers.  ::      
     :: From each integer, a specific byte is chosen , say the left-  ::      
     :: most::  bits 1 to 8. Each byte can contain from 0 to 8 1's,   ::      
     :: with probabilitie 1,8,28,56,70,56,28,8,1 over 256.  Now let   ::      
     :: the specified bytes from successive integers provide a string ::      
     :: of (overlapping) 5-letter words, each "letter" taking values  ::      
     :: A,B,C,D,E. The letters are determined  by the number of 1's,  ::      
     :: in that byte::  0,1,or 2 ---> A, 3 ---> B, 4 ---> C, 5 ---> D,::      
     :: and  6,7 or 8 ---> E.  Thus we have a monkey at a typewriter  ::      
     :: hitting five keys with with various probabilities::  37,56,70,::      
     :: 56,37 over 256. There are 5^5 possible 5-letter words, and    ::      
     :: from a string of 256,000 (overlapping) 5-letter words, counts ::      
     :: are made on the frequencies for each word. The quadratic form ::      
     :: in the weak inverse of the covariance matrix of the cell      ::      
     :: counts provides a chisquare test::  Q5-Q4, the difference of  ::      
     :: the naive Pearson  sums of (OBS-EXP)^2/EXP on counts for 5-   ::      
     :: and 4-letter cell counts.                                     ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
 Chi-square with 5^5-5^4=2500 d.of f. for sample size: 256000
                      chisquare  equiv normal  p value
  Results for COUNT-THE-1's in specified bytes:
           bits  1 to  8582625.25   8204.210     1.000000
           bits  2 to  9580019.44   8167.358     1.000000
           bits  3 to 10574355.44   8087.257     1.000000
           bits  4 to 11580849.56   8179.098     1.000000
           bits  5 to 12581005.12   8181.298     1.000000
           bits  6 to 13577175.12   8127.134     1.000000
           bits  7 to 14581443.12   8187.492     1.000000
           bits  8 to 15580294.44   8171.247     1.000000
           bits  9 to 16578850.75   8150.831     1.000000
           bits 10 to 17582427.69   8201.416     1.000000
           bits 11 to 18580354.31   8172.094     1.000000
           bits 12 to 19578982.12   8152.688     1.000000
           bits 13 to 20579250.69   8156.486     1.000000
           bits 14 to 21576954.06   8124.007     1.000000
           bits 15 to 22578592.88   8147.184     1.000000
           bits 16 to 23578713.88   8148.895     1.000000
           bits 17 to 24577971.75   8138.399     1.000000
           bits 18 to 25578168.19   8141.178     1.000000
           bits 19 to 26579514.69   8160.220     1.000000
           bits 20 to 27573483.50   8074.926     1.000000
           bits 21 to 28574751.38   8092.856     1.000000
           bits 22 to 29578206.94   8141.726     1.000000
           bits 23 to 30573237.94   8071.453     1.000000
           bits 24 to 31575114.62   8097.994     1.000000
           bits 25 to 32578554.88   8146.646     1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::               THIS IS A PARKING LOT TEST                      ::      
     :: In a square of side 100, randomly "park" a car---a circle of  ::      
     :: radius 1.   Then try to park a 2nd, a 3rd, and so on, each    ::      
     :: time parking "by ear".  That is, if an attempt to park a car  ::      
     :: causes a crash with one already parked, try again at a new    ::      
     :: random location. (To avoid path problems, consider parking    ::      
     :: helicopters rather than cars.)   Each attempt leads to either ::      
     :: a crash or a success, the latter followed by an increment to  ::      
     :: the list of cars already parked. If we plot n:  the number of ::      
     :: attempts, versus k::  the number successfully parked, we get a::      
     :: curve that should be similar to those provided by a perfect   ::      
     :: random number generator.  Theory for the behavior of such a   ::      
     :: random curve seems beyond reach, and as graphics displays are ::      
     :: not available for this battery of tests, a simple characteriz ::      
     :: ation of the random experiment is used: k, the number of cars ::      
     :: successfully parked after n=12,000 attempts. Simulation shows ::      
     :: that k should average 3523 with sigma 21.9 and is very close  ::      
     :: to normally distributed.  Thus (k-3523)/21.9 should be a st-  ::      
     :: andard normal variable, which, converted to a uniform varia-  ::      
     :: ble, provides input to a KSTEST based on a sample of 10.      ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
           CDPARK: result of ten tests on file lcarng_1.bin   
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes:  262    z-score:******* p-value: .000000
            Successes:  263    z-score:******* p-value: .000000
            Successes:  267    z-score:******* p-value: .000000
            Successes:  264    z-score:******* p-value: .000000
            Successes:  266    z-score:******* p-value: .000000
            Successes:  267    z-score:******* p-value: .000000
            Successes:  266    z-score:******* p-value: .000000
            Successes:  260    z-score:******* p-value: .000000
            Successes:  249    z-score:******* p-value: .000000
            Successes:  272    z-score:******* p-value: .000000

           square size   avg. no.  parked   sample sigma
             100.             263.600        5.782
            KSTEST for the above 10: p= 1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::               THE MINIMUM DISTANCE TEST                       ::      
     :: It does this 100 times::   choose n=8000 random points in a   ::      
     :: square of side 10000.  Find d, the minimum distance between   ::      
     :: the (n^2-n)/2 pairs of points.  If the points are truly inde- ::      
     :: pendent uniform, then d^2, the square of the minimum distance ::      
     :: should be (very close to) exponentially distributed with mean ::      
     :: .995 .  Thus 1-exp(-d^2/.995) should be uniform on [0,1) and  ::      
     :: a KSTEST on the resulting 100 values serves as a test of uni- ::      
     :: formity for random points in the square. Test numbers=0 mod 5 ::      
     :: are printed but the KSTEST is based on the full set of 100    ::      
     :: random choices of 8000 points in the 10000x10000 square.      ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
               This is the MINIMUM DISTANCE test
              for random integers in the file lcarng_1.bin   
     Sample no.    d^2     avg     equiv uni            
           5     .0000    .0000     .000000
          10     .0000    .0000     .000009
          15     .0000    .0000     .000001
          20     .0000    .0000     .000001
          25     .0000    .0000     .000001
          30     .0000    .0000     .000002
          35     .0000    .0000     .000000
          40     .0000    .0000     .000000
          45     .0000    .0000     .000000
          50     .0000    .0000     .000000
          55     .0000    .0000     .000001
          60     .0000    .0000     .000000
          65     .0000    .0000     .000000
          70     .0000    .0000     .000001
          75     .0000    .0000     .000001
          80     .0000    .0000     .000000
          85     .0000    .0000     .000002
          90     .0000    .0000     .000000
          95     .0000    .0000     .000000
         100     .0000    .0000     .000001
     MINIMUM DISTANCE TEST for lcarng_1.bin   
          Result of KS test on 20 transformed mindist^2's:
                                  p-value=1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$ 

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::              THE 3DSPHERES TEST                               ::      
     :: Choose  4000 random points in a cube of edge 1000.  At each   ::      
     :: point, center a sphere large enough to reach the next closest ::      
     :: point. Then the volume of the smallest such sphere is (very   ::      
     :: close to) exponentially distributed with mean 120pi/3.  Thus  ::      
     :: the radius cubed is exponential with mean 30. (The mean is    ::      
     :: obtained by extensive simulation).  The 3DSPHERES test gener- ::      
     :: ates 4000 such spheres 20 times.  Each min radius cubed leads ::      
     :: to a uniform variable by means of 1-exp(-r^3/30.), then a     ::      
     ::  KSTEST is done on the 20 p-values.                           ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
               The 3DSPHERES test for file lcarng_1.bin   
 sample no:  1     r^3=    .000     p-value= .00001
 sample no:  2     r^3=    .027     p-value= .00089
 sample no:  3     r^3=    .009     p-value= .00031
 sample no:  4     r^3=    .042     p-value= .00140
 sample no:  5     r^3=    .013     p-value= .00044
 sample no:  6     r^3=    .094     p-value= .00313
 sample no:  7     r^3=    .000     p-value= .00000
 sample no:  8     r^3=    .018     p-value= .00059
 sample no:  9     r^3=    .016     p-value= .00053
 sample no: 10     r^3=    .001     p-value= .00004
 sample no: 11     r^3=    .054     p-value= .00180
 sample no: 12     r^3=    .119     p-value= .00395
 sample no: 13     r^3=    .004     p-value= .00013
 sample no: 14     r^3=    .011     p-value= .00036
 sample no: 15     r^3=    .006     p-value= .00020
 sample no: 16     r^3=    .104     p-value= .00345
 sample no: 17     r^3=    .305     p-value= .01012
 sample no: 18     r^3=    .002     p-value= .00008
 sample no: 19     r^3=    .098     p-value= .00327
 sample no: 20     r^3=    .005     p-value= .00016
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file lcarng_1.bin         p-value=1.000000
$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::      This is the SQEEZE test                                  ::      
     ::  Random integers are floated to get uniforms on [0,1). Start- ::      
     ::  ing with k=2^31=2147483647, the test finds j, the number of  ::      
     ::  iterations necessary to reduce k to 1, using the reduction   ::      
     ::  k=ceiling(k*U), with U provided by floating integers from    ::      
     ::  the file being tested.  Such j's are found 100,000 times,    ::      
     ::  then counts for the number of times j was <=6,7,...,47,>=48  ::      
     ::  are used to provide a chi-square test for cell frequencies.  ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
            RESULTS OF SQUEEZE TEST FOR lcarng_1.bin   
         Table of standardized frequency counts
     ( (obs-exp)/sqrt(exp) )^2
        for j taking values <=6,7,8,...,47,>=48:
    -1.5    -2.4    -4.2    -5.4    -5.6    -4.5
     6.9     4.2    12.1    13.1     9.0    10.5
     3.5      .8     -.8    -3.7    -7.7    -7.9
   -10.8    -8.7    -6.1    -7.6    -2.5    -2.0
     2.7     3.1     5.5     9.9    11.5    11.5
    10.8    11.1     9.8    12.6     8.6     7.3
     9.2    10.8     8.3    11.5     2.4     7.1
     8.4
           Chi-square with 42 degrees of freedom:*******
              z-score=288.714  p-value=1.000000
______________________________________________________________

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::             The  OVERLAPPING SUMS test                        ::      
     :: Integers are floated to get a sequence U(1),U(2),... of uni-  ::      
     :: form [0,1) variables.  Then overlapping sums,                 ::      
     ::   S(1)=U(1)+...+U(100), S2=U(2)+...+U(101),... are formed.    ::      
     :: The S's are virtually normal with a certain covariance mat-   ::      
     :: rix.  A linear transformation of the S's converts them to a   ::      
     :: sequence of independent standard normals, which are converted ::      
     :: to uniform variables for a KSTEST. The  p-values from ten     ::      
     :: KSTESTs are given still another KSTEST.                       ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
                Test no.  1      p-value  .428723
                Test no.  2      p-value  .053856
                Test no.  3      p-value  .580611
                Test no.  4      p-value  .963959
                Test no.  5      p-value  .830603
                Test no.  6      p-value  .474462
                Test no.  7      p-value  .712448
                Test no.  8      p-value  .962882
                Test no.  9      p-value  .260726
                Test no. 10      p-value  .991947
   Results of the OSUM test for lcarng_1.bin   
        KSTEST on the above 10 p-values:  .849912

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     ::     This is the RUNS test.  It counts runs up, and runs down, ::      
     :: in a sequence of uniform [0,1) variables, obtained by float-  ::      
     :: ing the 32-bit integers in the specified file. This example   ::      
     :: shows how runs are counted:  .123,.357,.789,.425,.224,.416,.95::      
     :: contains an up-run of length 3, a down-run of length 2 and an ::      
     :: up-run of (at least) 2, depending on the next values.  The    ::      
     :: covariance matrices for the runs-up and runs-down are well    ::      
     :: known, leading to chisquare tests for quadratic forms in the  ::      
     :: weak inverses of the covariance matrices.  Runs are counted   ::      
     :: for sequences of length 10,000.  This is done ten times. Then ::      
     :: repeated.                                                     ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
           The RUNS test for file lcarng_1.bin   
     Up and down runs in a sample of 10000
_________________________________________________ 
                 Run test for lcarng_1.bin   :
       runs up; ks test for 10 p's:1.000000
     runs down; ks test for 10 p's:1.000000
                 Run test for lcarng_1.bin   :
       runs up; ks test for 10 p's:1.000000
     runs down; ks test for 10 p's:1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the CRAPS TEST. It plays 200,000 games of craps, finds::      
     :: the number of wins and the number of throws necessary to end  ::      
     :: each game.  The number of wins should be (very close to) a    ::      
     :: normal with mean 200000p and variance 200000p(1-p), with      ::      
     :: p=244/495.  Throws necessary to complete the game can vary    ::      
     :: from 1 to infinity, but counts for all>21 are lumped with 21. ::      
     :: A chi-square test is made on the no.-of-throws cell counts.   ::      
     :: Each 32-bit integer from the test file provides the value for ::      
     :: the throw of a die, by floating to [0,1), multiplying by 6    ::      
     :: and taking 1 plus the integer part of the result.             ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
                Results of craps test for lcarng_1.bin   
  No. of wins:  Observed Expected
                               109651    98585.86
                 109651= No. of wins, z-score=49.490 pvalue=1.00000
   Analysis of Throws-per-Game:
 Chisq=******* for 20 degrees of freedom, p=********
               Throws Observed Expected  Chisq     Sum
                  1    85475    66666.75306.298 5306.298
                  2    36489    37654.3  36.064 5342.362
                  3    25032    26954.7 137.152 5479.514
                  4    15881    19313.5 610.030 6089.544
                  5    10588    13851.4 768.867 6858.411
                  6     7082     9943.5 823.492 7681.903
                  7     4758     7145.0 797.462 8479.365
                  8     3397     5139.1 590.537 9069.902
                  9     2565     3699.9 348.099 9418.001
                 10     1892     2666.3 224.857 9642.858
                 11     1405     1923.3 139.687 9782.546
                 12     1133     1388.7  47.095 9829.641
                 13      897     1003.7  11.346 9840.986
                 14      642      726.1   9.750 9850.736
                 15      508      525.8    .605 9851.341
                 16      438      381.2   8.479 9859.820
                 17      351      276.5  20.049 9879.869
                 18      293      200.8  42.301 9922.170
                 19      236      146.0  55.505 9977.675
                 20      152      106.2  19.736 9997.411
                 21      786      287.1 866.84810864.260
            SUMMARY  FOR lcarng_1.bin   
                p-value for no. of wins:1.000000
                p-value for throws/game:********

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

 Results of DIEHARD battery of tests sent to file lcarng_1.res   
