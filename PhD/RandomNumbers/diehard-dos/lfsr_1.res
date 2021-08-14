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
           Results for lfsr_1.dat     
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  1 to 24 382.178
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  2 to 25 382.126
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  3 to 26 318.130
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  4 to 27 315.150
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  5 to 28 349.810
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  6 to 29 341.208
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  7 to 30 348.086
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  8 to 31 366.350
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_1.dat       using bits  9 to 32 382.232
  duplicate       number       number 
  spacings       observed     expected
        0           0.       67.668
        1           0.      135.335
        2           0.      135.335
        3           0.       90.224
        4           0.       45.112
        5           0.       18.045
  6 to INF        500.        8.282
 Chisquare with  6 d.o.f. = 29686.64 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
       1.000000  1.000000  1.000000  1.000000  1.000000
       1.000000  1.000000  1.000000  1.000000
  A KSTEST for the 9 p-values yields 1.000000

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
           OPERM5 test for file lfsr_1.dat     
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=*******; p-value=1.000000
           OPERM5 test for file lfsr_1.dat     
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
    Binary rank test for lfsr_1.dat     
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28     40000     211.4*******************
        29         0    5134.0*******************
        30         0   23103.0*******************
        31         0   11551.5*******************
  chisquare=****** for 3 d. of f.; p-value=1.000000
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
    Binary rank test for lfsr_1.dat     
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29     40000     211.4*******************
        30         0    5134.0*******************
        31         0   23103.0*******************
        32         0   11551.5*******************
  chisquare=****** for 3 d. of f.; p-value=1.000000
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
         Binary Rank Test for lfsr_1.dat     
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28464       944.3  802004.500  802004.500
          r =5        52986     21743.9   44889.316  846893.812
          r =6        18550     77311.8   44662.645  891556.438
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28304       944.3  792705.875  792705.875
          r =5        53138     21743.9   45327.172  838033.062
          r =6        18558     77311.8   44650.484  882683.562
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25357       944.3  631133.188  631133.188
          r =5        55750     21743.9   53183.418  684316.625
          r =6        18893     77311.8   44142.766  728459.375
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        12061       944.3  130870.312  130870.312
          r =5        44925     21743.9   24713.293  155583.609
          r =6        43014     77311.8   15215.521  170799.125
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        26393       944.3  685836.500  685836.500
          r =5        55603     21743.9   52724.613  738561.125
          r =6        18004     77311.8   45496.488  784057.625
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25105       944.3  618170.688  618170.688
          r =5        57438     21743.9   58594.312  676765.000
          r =6        17457     77311.8   46339.594  723104.625
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25353       944.3  630926.375  630926.375
          r =5        56965     21743.9   57051.676  687978.062
          r =6        17682     77311.8   45991.859  733969.938
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        27479       944.3  745620.375  745620.375
          r =5        56266     21743.9   54809.648  800430.000
          r =6        16255     77311.8   48219.461  848649.438
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28361       944.3  796012.250  796012.250
          r =5        53086     21743.9   45177.141  841189.375
          r =6        18553     77311.8   44658.086  885847.438
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28393       944.3  797871.500  797871.500
          r =5        53075     21743.9   45145.434  843016.938
          r =6        18532     77311.8   44690.012  887706.938
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25155       944.3  620731.938  620731.938
          r =5        55952     21743.9   53817.125  674549.062
          r =6        18893     77311.8   44142.766  718691.812
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        11939       944.3  128013.609  128013.609
          r =5        45083     21743.9   25051.328  153064.938
          r =6        42978     77311.8   15247.479  168312.422
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        26431       944.3  687886.250  687886.250
          r =5        55640     21743.9   52839.910  740726.188
          r =6        17929     77311.8   45611.629  786337.812
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25079       944.3  616840.938  616840.938
          r =5        57499     21743.9   58794.754  675635.688
          r =6        17422     77311.8   46393.805  722029.500
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25479       944.3  637457.000  637457.000
          r =5        56697     21743.9   56186.762  693643.750
          r =6        17824     77311.8   45773.074  739416.812
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        27428       944.3  742756.938  742756.938
          r =5        56345     21743.9   55060.785  797817.750
          r =6        16227     77311.8   48263.695  846081.438
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28324       944.3  793865.188  793865.188
          r =5        53090     21743.9   45188.672  839053.875
          r =6        18586     77311.8   44607.938  883661.812
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28339       944.3  794735.312  794735.312
          r =5        53062     21743.9   45107.977  839843.312
          r =6        18599     77311.8   44588.191  884431.500
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25155       944.3  620731.938  620731.938
          r =5        55795     21743.9   53324.266  674056.188
          r =6        19050     77311.8   43905.816  717962.000
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        12126       944.3  132405.203  132405.203
          r =5        44669     21743.9   24170.465  156575.672
          r =6        43205     77311.8   15046.526  171622.203
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        26428       944.3  687724.312  687724.312
          r =5        55727     21743.9   53111.500  740835.812
          r =6        17845     77311.8   45740.762  786576.562
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25412       944.3  633980.188  633980.188
          r =5        57227     21743.9   57903.617  691883.812
          r =6        17361     77311.8   46488.359  738372.188
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        25838       944.3  656248.438  656248.438
          r =5        56615     21743.9   55923.441  712171.875
          r =6        17547     77311.8   46200.344  758372.250
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        27643       944.3  754865.625  754865.625
          r =5        56158     21743.9   54467.246  809332.875
          r =6        16199     77311.8   48307.953  857640.812
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_1.dat     
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4        28298       944.3  792358.188  792358.188
          r =5        53289     21743.9   45764.250  838122.438
          r =6        18413     77311.8   44871.145  882993.562
                        p=1-exp(-SUM/2)=1.00000
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
   brank test summary for lfsr_1.dat     
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
 tst no  1: 1032945 missing words, 2081.86 sigmas from mean, p-value=1.00000
 tst no  2: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no  3: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no  4: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no  5: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no  6: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no  7: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no  8: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no  9: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 10: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 11: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no 12: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 13: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no 14: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no 15: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 16: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 17: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000
 tst no 18: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no 19: 1032961 missing words, 2081.90 sigmas from mean, p-value=1.00000
 tst no 20: 1032960 missing words, 2081.89 sigmas from mean, p-value=1.00000

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
 OPSO test for generator lfsr_1.dat               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for lfsr_1.dat      using bits 23 to 32       1043968******* 1.0000
    OPSO for lfsr_1.dat      using bits 22 to 31       1042240******* 1.0000
    OPSO for lfsr_1.dat      using bits 21 to 30       1044576******* 1.0000
    OPSO for lfsr_1.dat      using bits 20 to 29       1044448******* 1.0000
    OPSO for lfsr_1.dat      using bits 19 to 28       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits 18 to 27       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits 17 to 26       1047424******* 1.0000
    OPSO for lfsr_1.dat      using bits 16 to 25       1047424******* 1.0000
    OPSO for lfsr_1.dat      using bits 15 to 24       1043968******* 1.0000
    OPSO for lfsr_1.dat      using bits 14 to 23       1042240******* 1.0000
    OPSO for lfsr_1.dat      using bits 13 to 22       1044576******* 1.0000
    OPSO for lfsr_1.dat      using bits 12 to 21       1044448******* 1.0000
    OPSO for lfsr_1.dat      using bits 11 to 20       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits 10 to 19       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits  9 to 18       1047424******* 1.0000
    OPSO for lfsr_1.dat      using bits  8 to 17       1047424******* 1.0000
    OPSO for lfsr_1.dat      using bits  7 to 16       1043968******* 1.0000
    OPSO for lfsr_1.dat      using bits  6 to 15       1042240******* 1.0000
    OPSO for lfsr_1.dat      using bits  5 to 14       1044576******* 1.0000
    OPSO for lfsr_1.dat      using bits  4 to 13       1044448******* 1.0000
    OPSO for lfsr_1.dat      using bits  3 to 12       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits  2 to 11       1046400******* 1.0000
    OPSO for lfsr_1.dat      using bits  1 to 10       1047424******* 1.0000
 OQSO test for generator lfsr_1.dat               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for lfsr_1.dat      using bits 28 to 32       1022809******* 1.0000
    OQSO for lfsr_1.dat      using bits 27 to 31       1041446******* 1.0000
    OQSO for lfsr_1.dat      using bits 26 to 30       1047601******* 1.0000
    OQSO for lfsr_1.dat      using bits 25 to 29       1048399******* 1.0000
    OQSO for lfsr_1.dat      using bits 24 to 28       1047808******* 1.0000
    OQSO for lfsr_1.dat      using bits 23 to 27       1036826******* 1.0000
    OQSO for lfsr_1.dat      using bits 22 to 26        996110******* 1.0000
    OQSO for lfsr_1.dat      using bits 21 to 25       1037460******* 1.0000
    OQSO for lfsr_1.dat      using bits 20 to 24       1022821******* 1.0000
    OQSO for lfsr_1.dat      using bits 19 to 23       1041445******* 1.0000
    OQSO for lfsr_1.dat      using bits 18 to 22       1047601******* 1.0000
    OQSO for lfsr_1.dat      using bits 17 to 21       1048399******* 1.0000
    OQSO for lfsr_1.dat      using bits 16 to 20       1047808******* 1.0000
    OQSO for lfsr_1.dat      using bits 15 to 19       1036827******* 1.0000
    OQSO for lfsr_1.dat      using bits 14 to 18        996175******* 1.0000
    OQSO for lfsr_1.dat      using bits 13 to 17       1037459******* 1.0000
    OQSO for lfsr_1.dat      using bits 12 to 16       1022811******* 1.0000
    OQSO for lfsr_1.dat      using bits 11 to 15       1041446******* 1.0000
    OQSO for lfsr_1.dat      using bits 10 to 14       1047601******* 1.0000
    OQSO for lfsr_1.dat      using bits  9 to 13       1048399******* 1.0000
    OQSO for lfsr_1.dat      using bits  8 to 12       1047808******* 1.0000
    OQSO for lfsr_1.dat      using bits  7 to 11       1036834******* 1.0000
    OQSO for lfsr_1.dat      using bits  6 to 10        996152******* 1.0000
    OQSO for lfsr_1.dat      using bits  5 to  9       1037457******* 1.0000
    OQSO for lfsr_1.dat      using bits  4 to  8       1022817******* 1.0000
    OQSO for lfsr_1.dat      using bits  3 to  7       1041447******* 1.0000
    OQSO for lfsr_1.dat      using bits  2 to  6       1047601******* 1.0000
    OQSO for lfsr_1.dat      using bits  1 to  5       1048399******* 1.0000
  DNA test for generator lfsr_1.dat               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for lfsr_1.dat      using bits 31 to 32        905072******* 1.0000
     DNA for lfsr_1.dat      using bits 30 to 31        999389******* 1.0000
     DNA for lfsr_1.dat      using bits 29 to 30       1037080******* 1.0000
     DNA for lfsr_1.dat      using bits 28 to 29       1031185******* 1.0000
     DNA for lfsr_1.dat      using bits 27 to 28       1047588******* 1.0000
     DNA for lfsr_1.dat      using bits 26 to 27       1044974******* 1.0000
     DNA for lfsr_1.dat      using bits 25 to 26       1047616******* 1.0000
     DNA for lfsr_1.dat      using bits 24 to 25       1047552******* 1.0000
     DNA for lfsr_1.dat      using bits 23 to 24        904872******* 1.0000
     DNA for lfsr_1.dat      using bits 22 to 23        999392******* 1.0000
     DNA for lfsr_1.dat      using bits 21 to 22       1037067******* 1.0000
     DNA for lfsr_1.dat      using bits 20 to 21       1031194******* 1.0000
     DNA for lfsr_1.dat      using bits 19 to 20       1047588******* 1.0000
     DNA for lfsr_1.dat      using bits 18 to 19       1044974******* 1.0000
     DNA for lfsr_1.dat      using bits 17 to 18       1047616******* 1.0000
     DNA for lfsr_1.dat      using bits 16 to 17       1047552******* 1.0000
     DNA for lfsr_1.dat      using bits 15 to 16        904848******* 1.0000
     DNA for lfsr_1.dat      using bits 14 to 15        999257******* 1.0000
     DNA for lfsr_1.dat      using bits 13 to 14       1037073******* 1.0000
     DNA for lfsr_1.dat      using bits 12 to 13       1031202******* 1.0000
     DNA for lfsr_1.dat      using bits 11 to 12       1047588******* 1.0000
     DNA for lfsr_1.dat      using bits 10 to 11       1044972******* 1.0000
     DNA for lfsr_1.dat      using bits  9 to 10       1047616******* 1.0000
     DNA for lfsr_1.dat      using bits  8 to  9       1047552******* 1.0000
     DNA for lfsr_1.dat      using bits  7 to  8        904930******* 1.0000
     DNA for lfsr_1.dat      using bits  6 to  7        999276******* 1.0000
     DNA for lfsr_1.dat      using bits  5 to  6       1037073******* 1.0000
     DNA for lfsr_1.dat      using bits  4 to  5       1031195******* 1.0000
     DNA for lfsr_1.dat      using bits  3 to  4       1047588******* 1.0000
     DNA for lfsr_1.dat      using bits  2 to  3       1044974******* 1.0000
     DNA for lfsr_1.dat      using bits  1 to  2       1047616******* 1.0000

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
   Test results for lfsr_1.dat     
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for lfsr_1.dat     ********* 114861.602     1.000000
 byte stream for lfsr_1.dat     ********* 113706.945     1.000000

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
           bits  1 to  8*********  23185.992     1.000000
           bits  2 to  9*********  23106.578     1.000000
           bits  3 to 10682291.94   9613.710     1.000000
           bits  4 to 11*********  23609.770     1.000000
           bits  5 to 12*********  17478.721     1.000000
           bits  6 to 13978550.50  13803.438     1.000000
           bits  7 to 14575797.81   8107.655     1.000000
           bits  8 to 15594080.06   8366.205     1.000000
           bits  9 to 16*********  23215.332     1.000000
           bits 10 to 17*********  23189.352     1.000000
           bits 11 to 18666882.00   9395.780     1.000000
           bits 12 to 19*********  23638.359     1.000000
           bits 13 to 20*********  17396.121     1.000000
           bits 14 to 21971353.62  13701.659     1.000000
           bits 15 to 22581426.94   8187.263     1.000000
           bits 16 to 23600486.94   8456.812     1.000000
           bits 17 to 24*********  23081.045     1.000000
           bits 18 to 25*********  23053.785     1.000000
           bits 19 to 26664510.06   9362.236     1.000000
           bits 20 to 27*********  23625.609     1.000000
           bits 21 to 28*********  17668.230     1.000000
           bits 22 to 29*********  14183.162     1.000000
           bits 23 to 30586270.38   8255.760     1.000000
           bits 24 to 31601554.06   8471.903     1.000000
           bits 25 to 32*********  23169.773     1.000000

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
           CDPARK: result of ten tests on file lfsr_1.dat     
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes:   35    z-score:******* p-value: .000000
            Successes:   37    z-score:******* p-value: .000000
            Successes:   36    z-score:******* p-value: .000000
            Successes:   39    z-score:******* p-value: .000000
            Successes:   36    z-score:******* p-value: .000000
            Successes:   39    z-score:******* p-value: .000000
            Successes:   36    z-score:******* p-value: .000000
            Successes:   38    z-score:******* p-value: .000000
            Successes:   36    z-score:******* p-value: .000000
            Successes:   37    z-score:******* p-value: .000000

           square size   avg. no.  parked   sample sigma
             100.              36.900        1.300
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
              for random integers in the file lfsr_1.dat     
     Sample no.    d^2     avg     equiv uni            
           5     .0000    .0000     .000000
          10     .0000    .0000     .000000
          15     .0000    .0000     .000000
          20     .0000    .0000     .000000
          25     .0000    .0000     .000000
          30     .0000    .0000     .000000
          35     .0000    .0000     .000000
          40     .0000    .0000     .000000
          45     .0000    .0000     .000000
          50     .0000    .0000     .000000
          55     .0000    .0000     .000000
          60     .0000    .0000     .000000
          65     .0000    .0000     .000000
          70     .0000    .0000     .000000
          75     .0000    .0000     .000000
          80     .0000    .0000     .000000
          85     .0000    .0000     .000000
          90     .0000    .0000     .000000
          95     .0000    .0000     .000000
         100     .0000    .0000     .000000
     MINIMUM DISTANCE TEST for lfsr_1.dat     
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
               The 3DSPHERES test for file lfsr_1.dat     
 sample no:  1     r^3=    .000     p-value= .00000
 sample no:  2     r^3=    .000     p-value= .00000
 sample no:  3     r^3=    .000     p-value= .00000
 sample no:  4     r^3=    .000     p-value= .00000
 sample no:  5     r^3=    .000     p-value= .00000
 sample no:  6     r^3=    .000     p-value= .00000
 sample no:  7     r^3=    .000     p-value= .00000
 sample no:  8     r^3=    .000     p-value= .00000
 sample no:  9     r^3=    .000     p-value= .00000
 sample no: 10     r^3=    .000     p-value= .00000
 sample no: 11     r^3=    .000     p-value= .00000
 sample no: 12     r^3=    .000     p-value= .00000
 sample no: 13     r^3=    .000     p-value= .00000
 sample no: 14     r^3=    .000     p-value= .00000
 sample no: 15     r^3=    .000     p-value= .00000
 sample no: 16     r^3=    .000     p-value= .00000
 sample no: 17     r^3=    .000     p-value= .00000
 sample no: 18     r^3=    .000     p-value= .00000
 sample no: 19     r^3=    .000     p-value= .00000
 sample no: 20     r^3=    .000     p-value= .00000
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file lfsr_1.dat           p-value=1.000000
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
