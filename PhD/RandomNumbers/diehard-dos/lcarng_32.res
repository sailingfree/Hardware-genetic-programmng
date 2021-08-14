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
           Results for lcarng_32.bin  
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  1 to 24   2.024
  duplicate       number       number 
  spacings       observed     expected
        0          71.       67.668
        1         125.      135.335
        2         125.      135.335
        3         104.       90.224
        4          57.       45.112
        5          11.       18.045
  6 to INF          7.        8.282
 Chisquare with  6 d.o.f. =     9.93 p-value=  .872274
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  2 to 25   1.918
  duplicate       number       number 
  spacings       observed     expected
        0          62.       67.668
        1         145.      135.335
        2         147.      135.335
        3          96.       90.224
        4          29.       45.112
        5          12.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =    10.38 p-value=  .890527
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  3 to 26   2.066
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         120.      135.335
        2         144.      135.335
        3          89.       90.224
        4          48.       45.112
        5          17.       18.045
  6 to INF         13.        8.282
 Chisquare with  6 d.o.f. =     5.27 p-value=  .490153
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  4 to 27   1.808
  duplicate       number       number 
  spacings       observed     expected
        0          75.       67.668
        1         163.      135.335
        2         143.      135.335
        3          65.       90.224
        4          28.       45.112
        5          14.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =    23.00 p-value=  .999204
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  5 to 28   2.146
  duplicate       number       number 
  spacings       observed     expected
        0          58.       67.668
        1         123.      135.335
        2         138.      135.335
        3         108.       90.224
        4          40.       45.112
        5          20.       18.045
  6 to INF         13.        8.282
 Chisquare with  6 d.o.f. =     9.54 p-value=  .854569
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  6 to 29   1.966
  duplicate       number       number 
  spacings       observed     expected
        0          71.       67.668
        1         134.      135.335
        2         143.      135.335
        3          84.       90.224
        4          42.       45.112
        5          18.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     1.27 p-value=  .026448
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  7 to 30   2.094
  duplicate       number       number 
  spacings       observed     expected
        0          44.       67.668
        1         147.      135.335
        2         145.      135.335
        3          87.       90.224
        4          49.       45.112
        5          17.       18.045
  6 to INF         11.        8.282
 Chisquare with  6 d.o.f. =    11.38 p-value=  .922588
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  8 to 31   2.192
  duplicate       number       number 
  spacings       observed     expected
        0          46.       67.668
        1         128.      135.335
        2         159.      135.335
        3          73.       90.224
        4          55.       45.112
        5          27.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =    23.04 p-value=  .999218
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lcarng_32.bin    using bits  9 to 32   1.882
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         156.      135.335
        2         129.      135.335
        3          82.       90.224
        4          44.       45.112
        5          16.       18.045
  6 to INF          4.        8.282
 Chisquare with  6 d.o.f. =     6.70 p-value=  .650569
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
        .872274   .890527   .490153   .999204   .854569
        .026448   .922588   .999218   .650569
  A KSTEST for the 9 p-values yields  .998827

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
           OPERM5 test for file lcarng_32.bin  
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=*******; p-value=1.000000
           OPERM5 test for file lcarng_32.bin  
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
    Binary rank test for lcarng_32.bin  
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28       170     211.4  8.114029    8.114
        29      5186    5134.0   .526476    8.641
        30     22877   23103.0  2.211708   10.852
        31     11767   11551.5  4.019360   14.872
  chisquare=14.872 for 3 d. of f.; p-value= .998128
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
    Binary rank test for lcarng_32.bin  
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29       221     211.4   .434279     .434
        30      4985    5134.0  4.324895    4.759
        31     23034   23103.0   .206357    4.966
        32     11760   11551.5  3.762453    8.728
  chisquare= 8.728 for 3 d. of f.; p-value= .968432
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
         Binary Rank Test for lcarng_32.bin  
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          836       944.3      12.421      12.421
          r =5        22888     21743.9      60.199      72.620
          r =6        76276     77311.8      13.877      86.498
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1027       944.3       7.242       7.242
          r =5        22702     21743.9      42.217      49.459
          r =6        76271     77311.8      14.012      63.471
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          970       944.3        .699        .699
          r =5        22439     21743.9      22.221      22.920
          r =6        76591     77311.8       6.720      29.640
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1008       944.3       4.297       4.297
          r =5        21660     21743.9        .324       4.621
          r =6        77332     77311.8        .005       4.626
                        p=1-exp(-SUM/2)= .90103
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          914       944.3        .972        .972
          r =5        22006     21743.9       3.159       4.132
          r =6        77080     77311.8        .695       4.827
                        p=1-exp(-SUM/2)= .91048
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          834       944.3      12.884      12.884
          r =5        22531     21743.9      28.492      41.376
          r =6        76635     77311.8       5.925      47.301
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          930       944.3        .217        .217
          r =5        21786     21743.9        .082        .298
          r =6        77284     77311.8        .010        .308
                        p=1-exp(-SUM/2)= .14277
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1134       944.3      38.108      38.108
          r =5        22008     21743.9       3.208      41.316
          r =6        76858     77311.8       2.664      43.980
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1009       944.3       4.433       4.433
          r =5        21990     21743.9       2.785       7.218
          r =6        77001     77311.8       1.249       8.468
                        p=1-exp(-SUM/2)= .98550
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1018       944.3       5.752       5.752
          r =5        22510     21743.9      26.992      32.744
          r =6        76472     77311.8       9.122      41.866
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1111       944.3      29.428      29.428
          r =5        21923     21743.9       1.475      30.903
          r =6        76966     77311.8       1.547      32.449
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          923       944.3        .481        .481
          r =5        21702     21743.9        .081        .561
          r =6        77375     77311.8        .052        .613
                        p=1-exp(-SUM/2)= .26395
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          997       944.3       2.941       2.941
          r =5        22128     21743.9       6.785       9.726
          r =6        76875     77311.8       2.468      12.194
                        p=1-exp(-SUM/2)= .99775
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          998       944.3       3.054       3.054
          r =5        22043     21743.9       4.114       7.168
          r =6        76959     77311.8       1.610       8.778
                        p=1-exp(-SUM/2)= .98759
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1000       944.3       3.285       3.285
          r =5        22058     21743.9       4.537       7.823
          r =6        76942     77311.8       1.769       9.592
                        p=1-exp(-SUM/2)= .99174
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1077       944.3      18.648      18.648
          r =5        22017     21743.9       3.430      22.078
          r =6        76906     77311.8       2.130      24.208
                        p=1-exp(-SUM/2)= .99999
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1039       944.3       9.497       9.497
          r =5        22006     21743.9       3.159      12.656
          r =6        76955     77311.8       1.647      14.303
                        p=1-exp(-SUM/2)= .99922
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          897       944.3       2.369       2.369
          r =5        22167     21743.9       8.233      10.602
          r =6        76936     77311.8       1.827      12.429
                        p=1-exp(-SUM/2)= .99800
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          984       944.3       1.669       1.669
          r =5        21762     21743.9        .015       1.684
          r =6        77254     77311.8        .043       1.727
                        p=1-exp(-SUM/2)= .57837
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          941       944.3        .012        .012
          r =5        21759     21743.9        .010        .022
          r =6        77300     77311.8        .002        .024
                        p=1-exp(-SUM/2)= .01184
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1037       944.3       9.100       9.100
          r =5        21495     21743.9       2.849      11.949
          r =6        77468     77311.8        .316      12.265
                        p=1-exp(-SUM/2)= .99783
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          928       944.3        .281        .281
          r =5        21488     21743.9       3.012       3.293
          r =6        77584     77311.8        .958       4.251
                        p=1-exp(-SUM/2)= .88065
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1048       944.3      11.388      11.388
          r =5        21742     21743.9        .000      11.388
          r =6        77210     77311.8        .134      11.522
                        p=1-exp(-SUM/2)= .99685
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          961       944.3        .295        .295
          r =5        21289     21743.9       9.517       9.812
          r =6        77750     77311.8       2.484      12.296
                        p=1-exp(-SUM/2)= .99786
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lcarng_32.bin  
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          907       944.3       1.473       1.473
          r =5        22326     21743.9      15.583      17.057
          r =6        76767     77311.8       3.839      20.896
                        p=1-exp(-SUM/2)= .99997
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
    1.000000    1.000000    1.000000     .901030     .910484
    1.000000     .142771    1.000000     .985503    1.000000
    1.000000     .263947     .997750     .987586     .991735
     .999994     .999216     .998000     .578366     .011844
     .997828     .880650     .996852     .997862     .999971
   brank test summary for lcarng_32.bin  
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
 tst no  1:  456926 missing words,  736.02 sigmas from mean, p-value=1.00000
 tst no  2:  470021 missing words,  766.62 sigmas from mean, p-value=1.00000
 tst no  3:  470034 missing words,  766.65 sigmas from mean, p-value=1.00000
 tst no  4:  470010 missing words,  766.59 sigmas from mean, p-value=1.00000
 tst no  5:  470050 missing words,  766.68 sigmas from mean, p-value=1.00000
 tst no  6:  470022 missing words,  766.62 sigmas from mean, p-value=1.00000
 tst no  7:  470021 missing words,  766.62 sigmas from mean, p-value=1.00000
 tst no  8:  470033 missing words,  766.64 sigmas from mean, p-value=1.00000
 tst no  9:  470048 missing words,  766.68 sigmas from mean, p-value=1.00000
 tst no 10:  470038 missing words,  766.66 sigmas from mean, p-value=1.00000
 tst no 11:  470022 missing words,  766.62 sigmas from mean, p-value=1.00000
 tst no 12:  470050 missing words,  766.68 sigmas from mean, p-value=1.00000
 tst no 13:  470030 missing words,  766.64 sigmas from mean, p-value=1.00000
 tst no 14:  470047 missing words,  766.68 sigmas from mean, p-value=1.00000
 tst no 15:  470025 missing words,  766.63 sigmas from mean, p-value=1.00000
 tst no 16:  470036 missing words,  766.65 sigmas from mean, p-value=1.00000
 tst no 17:  470018 missing words,  766.61 sigmas from mean, p-value=1.00000
 tst no 18:  470042 missing words,  766.67 sigmas from mean, p-value=1.00000
 tst no 19:  470054 missing words,  766.69 sigmas from mean, p-value=1.00000
 tst no 20:  470007 missing words,  766.58 sigmas from mean, p-value=1.00000

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
 OPSO test for generator lcarng_32.bin            
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for lcarng_32.bin   using bits 23 to 32       1021209******* 1.0000
    OPSO for lcarng_32.bin   using bits 22 to 31       1021170******* 1.0000
    OPSO for lcarng_32.bin   using bits 21 to 30       1021186******* 1.0000
    OPSO for lcarng_32.bin   using bits 20 to 29       1021175******* 1.0000
    OPSO for lcarng_32.bin   using bits 19 to 28       1021188******* 1.0000
    OPSO for lcarng_32.bin   using bits 18 to 27       1021208******* 1.0000
    OPSO for lcarng_32.bin   using bits 17 to 26       1021217******* 1.0000
    OPSO for lcarng_32.bin   using bits 16 to 25       1021184******* 1.0000
    OPSO for lcarng_32.bin   using bits 15 to 24       1021192******* 1.0000
    OPSO for lcarng_32.bin   using bits 14 to 23       1021215******* 1.0000
    OPSO for lcarng_32.bin   using bits 13 to 22       1021177******* 1.0000
    OPSO for lcarng_32.bin   using bits 12 to 21       1021209******* 1.0000
    OPSO for lcarng_32.bin   using bits 11 to 20       1021203******* 1.0000
    OPSO for lcarng_32.bin   using bits 10 to 19       1021204******* 1.0000
    OPSO for lcarng_32.bin   using bits  9 to 18       1021165******* 1.0000
    OPSO for lcarng_32.bin   using bits  8 to 17       1021177******* 1.0000
    OPSO for lcarng_32.bin   using bits  7 to 16       1021189******* 1.0000
    OPSO for lcarng_32.bin   using bits  6 to 15       1021192******* 1.0000
    OPSO for lcarng_32.bin   using bits  5 to 14       1021209******* 1.0000
    OPSO for lcarng_32.bin   using bits  4 to 13       1021188******* 1.0000
    OPSO for lcarng_32.bin   using bits  3 to 12       1021200******* 1.0000
    OPSO for lcarng_32.bin   using bits  2 to 11       1021183******* 1.0000
    OPSO for lcarng_32.bin   using bits  1 to 10       1021227******* 1.0000
 OQSO test for generator lcarng_32.bin            
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for lcarng_32.bin   using bits 28 to 32       1020216******* 1.0000
    OQSO for lcarng_32.bin   using bits 27 to 31       1020201******* 1.0000
    OQSO for lcarng_32.bin   using bits 26 to 30       1020182******* 1.0000
    OQSO for lcarng_32.bin   using bits 25 to 29       1020210******* 1.0000
    OQSO for lcarng_32.bin   using bits 24 to 28       1020211******* 1.0000
    OQSO for lcarng_32.bin   using bits 23 to 27       1020215******* 1.0000
    OQSO for lcarng_32.bin   using bits 22 to 26       1020221******* 1.0000
    OQSO for lcarng_32.bin   using bits 21 to 25       1020198******* 1.0000
    OQSO for lcarng_32.bin   using bits 20 to 24       1020211******* 1.0000
    OQSO for lcarng_32.bin   using bits 19 to 23       1020260******* 1.0000
    OQSO for lcarng_32.bin   using bits 18 to 22       1020207******* 1.0000
    OQSO for lcarng_32.bin   using bits 17 to 21       1020208******* 1.0000
    OQSO for lcarng_32.bin   using bits 16 to 20       1020226******* 1.0000
    OQSO for lcarng_32.bin   using bits 15 to 19       1020210******* 1.0000
    OQSO for lcarng_32.bin   using bits 14 to 18       1020209******* 1.0000
    OQSO for lcarng_32.bin   using bits 13 to 17       1020222******* 1.0000
    OQSO for lcarng_32.bin   using bits 12 to 16       1020194******* 1.0000
    OQSO for lcarng_32.bin   using bits 11 to 15       1020231******* 1.0000
    OQSO for lcarng_32.bin   using bits 10 to 14       1020215******* 1.0000
    OQSO for lcarng_32.bin   using bits  9 to 13       1020212******* 1.0000
    OQSO for lcarng_32.bin   using bits  8 to 12       1020160******* 1.0000
    OQSO for lcarng_32.bin   using bits  7 to 11       1020199******* 1.0000
    OQSO for lcarng_32.bin   using bits  6 to 10       1020188******* 1.0000
    OQSO for lcarng_32.bin   using bits  5 to  9       1020195******* 1.0000
    OQSO for lcarng_32.bin   using bits  4 to  8       1020218******* 1.0000
    OQSO for lcarng_32.bin   using bits  3 to  7       1020218******* 1.0000
    OQSO for lcarng_32.bin   using bits  2 to  6       1020195******* 1.0000
    OQSO for lcarng_32.bin   using bits  1 to  5       1020206******* 1.0000
  DNA test for generator lcarng_32.bin            
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for lcarng_32.bin   using bits 31 to 32       1017511******* 1.0000
     DNA for lcarng_32.bin   using bits 30 to 31       1017531******* 1.0000
     DNA for lcarng_32.bin   using bits 29 to 30       1017513******* 1.0000
     DNA for lcarng_32.bin   using bits 28 to 29       1017625******* 1.0000
     DNA for lcarng_32.bin   using bits 27 to 28       1017534******* 1.0000
     DNA for lcarng_32.bin   using bits 26 to 27       1017544******* 1.0000
     DNA for lcarng_32.bin   using bits 25 to 26       1017560******* 1.0000
     DNA for lcarng_32.bin   using bits 24 to 25       1017454******* 1.0000
     DNA for lcarng_32.bin   using bits 23 to 24       1017556******* 1.0000
     DNA for lcarng_32.bin   using bits 22 to 23       1017550******* 1.0000
     DNA for lcarng_32.bin   using bits 21 to 22       1017539******* 1.0000
     DNA for lcarng_32.bin   using bits 20 to 21       1017584******* 1.0000
     DNA for lcarng_32.bin   using bits 19 to 20       1017567******* 1.0000
     DNA for lcarng_32.bin   using bits 18 to 19       1017576******* 1.0000
     DNA for lcarng_32.bin   using bits 17 to 18       1017494******* 1.0000
     DNA for lcarng_32.bin   using bits 16 to 17       1017549******* 1.0000
     DNA for lcarng_32.bin   using bits 15 to 16       1017582******* 1.0000
     DNA for lcarng_32.bin   using bits 14 to 15       1017499******* 1.0000
     DNA for lcarng_32.bin   using bits 13 to 14       1017520******* 1.0000
     DNA for lcarng_32.bin   using bits 12 to 13       1017547******* 1.0000
     DNA for lcarng_32.bin   using bits 11 to 12       1017510******* 1.0000
     DNA for lcarng_32.bin   using bits 10 to 11       1017504******* 1.0000
     DNA for lcarng_32.bin   using bits  9 to 10       1017561******* 1.0000
     DNA for lcarng_32.bin   using bits  8 to  9       1017625******* 1.0000
     DNA for lcarng_32.bin   using bits  7 to  8       1017525******* 1.0000
     DNA for lcarng_32.bin   using bits  6 to  7       1017568******* 1.0000
     DNA for lcarng_32.bin   using bits  5 to  6       1017493******* 1.0000
     DNA for lcarng_32.bin   using bits  4 to  5       1017483******* 1.0000
     DNA for lcarng_32.bin   using bits  3 to  4       1017498******* 1.0000
     DNA for lcarng_32.bin   using bits  2 to  3       1017624******* 1.0000
     DNA for lcarng_32.bin   using bits  1 to  2       1017601******* 1.0000

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
   Test results for lcarng_32.bin  
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for lcarng_32.bin   60696.28    823.020     1.000000
 byte stream for lcarng_32.bin   60908.30    826.018     1.000000

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
           bits  1 to  8 25368.52    323.410     1.000000
           bits  2 to  9 24641.62    313.130     1.000000
           bits  3 to 10 23497.31    296.947     1.000000
           bits  4 to 11 25034.68    318.688     1.000000
           bits  5 to 12 23464.98    296.490     1.000000
           bits  6 to 13 24541.88    311.719     1.000000
           bits  7 to 14 24400.40    309.718     1.000000
           bits  8 to 15 24914.81    316.993     1.000000
           bits  9 to 16 24072.24    305.078     1.000000
           bits 10 to 17 24564.12    312.034     1.000000
           bits 11 to 18 25275.31    322.092     1.000000
           bits 12 to 19 24111.73    305.636     1.000000
           bits 13 to 20 24414.94    309.924     1.000000
           bits 14 to 21 24339.05    308.851     1.000000
           bits 15 to 22 24728.86    314.363     1.000000
           bits 16 to 23 23227.70    293.134     1.000000
           bits 17 to 24 25189.80    320.882     1.000000
           bits 18 to 25 24191.14    306.759     1.000000
           bits 19 to 26 24272.26    307.906     1.000000
           bits 20 to 27 24471.35    310.722     1.000000
           bits 21 to 28 24671.17    313.548     1.000000
           bits 22 to 29 23673.93    299.445     1.000000
           bits 23 to 30 25085.71    319.410     1.000000
           bits 24 to 31 23276.29    293.821     1.000000
           bits 25 to 32 24634.00    313.022     1.000000

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
           CDPARK: result of ten tests on file lcarng_32.bin  
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes: 3518    z-score:  -.228 p-value: .409702
            Successes: 3515    z-score:  -.365 p-value: .357445
            Successes: 3522    z-score:  -.046 p-value: .481790
            Successes: 3563    z-score:  1.826 p-value: .966111
            Successes: 3554    z-score:  1.416 p-value: .921543
            Successes: 3517    z-score:  -.274 p-value: .392053
            Successes: 3515    z-score:  -.365 p-value: .357445
            Successes: 3544    z-score:   .959 p-value: .831196
            Successes: 3470    z-score: -2.420 p-value: .007758
            Successes: 3521    z-score:  -.091 p-value: .463618

           square size   avg. no.  parked   sample sigma
             100.            3523.900       24.492
            KSTEST for the above 10: p=  .452319

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
              for random integers in the file lcarng_32.bin  
     Sample no.    d^2     avg     equiv uni            
           5     .3594   1.0767     .303130
          10    1.3943    .9190     .753727
          15     .3594    .8845     .303130
          20    2.1847    .8956     .888711
          25     .3594    .8530     .303130
          30     .5967    .8952     .451025
          35     .3726    .8585     .312338
          40     .5967    .8685     .451025
          45     .7050    .8689     .507663
          50     .5967    .9055     .451025
          55     .7050    .8736     .507663
          60     .5967    .8860     .451025
          65     .7512    .8612     .529968
          70     .5967    .8632     .451025
          75     .7512    .8752     .529968
          80     .3594    .8632     .303130
          85     .7512    .8650     .529968
          90     .3594    .8554     .303130
          95    3.1445    .8756     .957589
         100     .3594    .8585     .303130
     MINIMUM DISTANCE TEST for lcarng_32.bin  
          Result of KS test on 20 transformed mindist^2's:
                                  p-value= .999971

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
               The 3DSPHERES test for file lcarng_32.bin  
 sample no:  1     r^3=  12.351     p-value= .33749
 sample no:  2     r^3= 111.543     p-value= .97572
 sample no:  3     r^3=  28.213     p-value= .60954
 sample no:  4     r^3=  29.585     p-value= .62699
 sample no:  5     r^3=   9.517     p-value= .27184
 sample no:  6     r^3=  56.903     p-value= .84995
 sample no:  7     r^3=  30.337     p-value= .63623
 sample no:  8     r^3=  14.776     p-value= .38892
 sample no:  9     r^3=  21.687     p-value= .51466
 sample no: 10     r^3=   3.414     p-value= .10757
 sample no: 11     r^3=  29.207     p-value= .62227
 sample no: 12     r^3=  23.571     p-value= .54420
 sample no: 13     r^3=  29.802     p-value= .62968
 sample no: 14     r^3=   9.278     p-value= .26602
 sample no: 15     r^3=  43.339     p-value= .76417
 sample no: 16     r^3=  78.878     p-value= .92787
 sample no: 17     r^3=  39.743     p-value= .73414
 sample no: 18     r^3=  21.644     p-value= .51396
 sample no: 19     r^3=  12.183     p-value= .33376
 sample no: 20     r^3=  48.861     p-value= .80381
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file lcarng_32.bin        p-value= .722921
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
            RESULTS OF SQUEEZE TEST FOR lcarng_32.bin  
         Table of standardized frequency counts
     ( (obs-exp)/sqrt(exp) )^2
        for j taking values <=6,7,8,...,47,>=48:
    -1.5    -2.4    14.4    -2.6    -2.6     6.7
     6.9     8.3    -4.9     9.4    -4.0     6.0
   -10.9    13.2    10.2     2.3    -3.8     1.4
     2.2    -5.8     -.8    -7.8    -6.5     4.6
   -15.6     2.7     2.1    -2.6     -.2    -5.5
    -2.5    -3.2   -10.4      .4     2.4    26.1
    -3.3     -.7    -2.4    -1.8    -1.3    -1.0
    -1.1
           Chi-square with 42 degrees of freedom:*******
              z-score=242.449  p-value=1.000000
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
                Test no.  1      p-value  .050941
                Test no.  2      p-value  .142072
                Test no.  3      p-value  .410897
                Test no.  4      p-value  .627077
                Test no.  5      p-value  .721904
                Test no.  6      p-value  .243674
                Test no.  7      p-value  .912778
                Test no.  8      p-value  .949644
                Test no.  9      p-value  .736699
                Test no. 10      p-value  .284038
   Results of the OSUM test for lcarng_32.bin  
        KSTEST on the above 10 p-values:  .008525

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
           The RUNS test for file lcarng_32.bin  
     Up and down runs in a sample of 10000
_________________________________________________ 
                 Run test for lcarng_32.bin  :
       runs up; ks test for 10 p's: .999928
     runs down; ks test for 10 p's: .801991
                 Run test for lcarng_32.bin  :
       runs up; ks test for 10 p's:1.000000
     runs down; ks test for 10 p's: .565567

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
                Results of craps test for lcarng_32.bin  
  No. of wins:  Observed Expected
                                99504    98585.86
                  99504= No. of wins, z-score= 4.106 pvalue= .99998
   Analysis of Throws-per-Game:
 Chisq= 450.95 for 20 degrees of freedom, p= 1.00000
               Throws Observed Expected  Chisq     Sum
                  1    66856    66666.7    .538     .538
                  2    37445    37654.3   1.164    1.701
                  3    27060    26954.7    .411    2.112
                  4    20350    19313.5  55.630   57.743
                  5    13573    13851.4   5.596   63.339
                  6     9770     9943.5   3.029   66.368
                  7     6883     7145.0   9.609   75.977
                  8     4951     5139.1   6.883   82.860
                  9     3214     3699.9  63.804  146.663
                 10     2594     2666.3   1.960  148.623
                 11     2134     1923.3  23.076  171.699
                 12     1485     1388.7   6.672  178.371
                 13     1002     1003.7    .003  178.374
                 14      819      726.1  11.875  190.249
                 15      429      525.8  17.833  208.082
                 16      330      381.2   6.864  214.947
                 17      332      276.5  11.123  226.069
                 18      233      200.8   5.153  231.223
                 19       53      146.0  59.226  290.449
                 20       28      106.2  57.596  348.045
                 21      459      287.1 102.900  450.945
            SUMMARY  FOR lcarng_32.bin  
                p-value for no. of wins: .999980
                p-value for throws/game: .999999

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

 Results of DIEHARD battery of tests sent to file lcarng_32.res  
