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
           Results for lfsr_mw.dat    
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  1 to 24   5.622
  duplicate       number       number 
  spacings       observed     expected
        0           2.       67.668
        1           9.      135.335
        2          25.      135.335
        3          48.       90.224
        4          78.       45.112
        5          87.       18.045
  6 to INF        251.        8.282
 Chisquare with  6 d.o.f. =  7692.29 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  2 to 25   2.880
  duplicate       number       number 
  spacings       observed     expected
        0          28.       67.668
        1          84.      135.335
        2          99.      135.335
        3         123.       90.224
        4          82.       45.112
        5          56.       18.045
  6 to INF         28.        8.282
 Chisquare with  6 d.o.f. =   221.33 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  3 to 26   2.846
  duplicate       number       number 
  spacings       observed     expected
        0          29.       67.668
        1          74.      135.335
        2         128.      135.335
        3         116.       90.224
        4          75.       45.112
        5          44.       18.045
  6 to INF         34.        8.282
 Chisquare with  6 d.o.f. =   194.66 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  4 to 27   2.060
  duplicate       number       number 
  spacings       observed     expected
        0          62.       67.668
        1         127.      135.335
        2         145.      135.335
        3          94.       90.224
        4          47.       45.112
        5          15.       18.045
  6 to INF         10.        8.282
 Chisquare with  6 d.o.f. =     2.79 p-value=  .164762
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  5 to 28   2.196
  duplicate       number       number 
  spacings       observed     expected
        0          53.       67.668
        1         126.      135.335
        2         135.      135.335
        3          97.       90.224
        4          56.       45.112
        5          19.       18.045
  6 to INF         14.        8.282
 Chisquare with  6 d.o.f. =    10.96 p-value=  .910373
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  6 to 29   2.160
  duplicate       number       number 
  spacings       observed     expected
        0          60.       67.668
        1         132.      135.335
        2         131.      135.335
        3          86.       90.224
        4          52.       45.112
        5          21.       18.045
  6 to INF         18.        8.282
 Chisquare with  6 d.o.f. =    14.23 p-value=  .972800
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  7 to 30   2.090
  duplicate       number       number 
  spacings       observed     expected
        0          65.       67.668
        1         123.      135.335
        2         129.      135.335
        3         105.       90.224
        4          52.       45.112
        5          18.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     5.01 p-value=  .457157
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  8 to 31   2.090
  duplicate       number       number 
  spacings       observed     expected
        0          57.       67.668
        1         123.      135.335
        2         148.      135.335
        3         103.       90.224
        4          44.       45.112
        5          15.       18.045
  6 to INF         10.        8.282
 Chisquare with  6 d.o.f. =     6.70 p-value=  .650327
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_mw.dat      using bits  9 to 32   2.112
  duplicate       number       number 
  spacings       observed     expected
        0          60.       67.668
        1         116.      135.335
        2         145.      135.335
        3         102.       90.224
        4          50.       45.112
        5          19.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     6.45 p-value=  .625127
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
       1.000000  1.000000  1.000000   .164762   .910373
        .972800   .457157   .650327   .625127
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
           OPERM5 test for file lfsr_mw.dat    
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=*******; p-value=1.000000
           OPERM5 test for file lfsr_mw.dat    
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
    Binary rank test for lfsr_mw.dat    
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
    Binary rank test for lfsr_mw.dat    
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
         Binary Rank Test for lfsr_mw.dat    
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         4706       944.3   14985.024   14985.024
          r =5        33537     21743.9    6396.147   21381.172
          r =6        61757     77311.8    3129.560   24510.732
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1784       944.3     746.683     746.683
          r =5        18575     21743.9     461.827    1208.511
          r =6        79641     77311.8      70.172    1278.683
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1776       944.3     732.523     732.523
          r =5        18618     21743.9     449.379    1181.902
          r =6        79606     77311.8      68.079    1249.982
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1383       944.3     203.808     203.808
          r =5        20109     21743.9     122.926     326.735
          r =6        78508     77311.8      18.508     345.243
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1380       944.3     201.031     201.031
          r =5        19930     21743.9     151.318     352.348
          r =6        78690     77311.8      24.568     376.916
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1353       944.3     176.887     176.887
          r =5        19945     21743.9     148.825     325.712
          r =6        78702     77311.8      24.998     350.710
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1496       944.3     322.325     322.325
          r =5        20084     21743.9     126.715     449.039
          r =6        78420     77311.8      15.885     464.924
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1428       944.3     247.765     247.765
          r =5        20300     21743.9      95.882     343.647
          r =6        78272     77311.8      11.925     355.572
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1446       944.3     266.548     266.548
          r =5        20042     21743.9     133.208     399.756
          r =6        78512     77311.8      18.632     418.388
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1246       944.3      96.391      96.391
          r =5        20539     21743.9      66.767     163.158
          r =6        78215     77311.8      10.552     173.710
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1213       944.3      76.458      76.458
          r =5        20726     21743.9      47.651     124.109
          r =6        78061     77311.8       7.260     131.369
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1261       944.3     106.214     106.214
          r =5        20622     21743.9      57.886     164.100
          r =6        78117     77311.8       8.386     172.486
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1338       944.3     164.141     164.141
          r =5        20668     21743.9      53.236     217.377
          r =6        77994     77311.8       6.020     223.397
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1302       944.3     135.495     135.495
          r =5        20496     21743.9      71.618     207.113
          r =6        78202     77311.8      10.250     217.363
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1257       944.3     103.548     103.548
          r =5        20549     21743.9      65.664     169.212
          r =6        78194     77311.8      10.067     179.278
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1530       944.3     363.277     363.277
          r =5        19670     21743.9     197.805     561.083
          r =6        78800     77311.8      28.647     589.729
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1520       944.3     350.978     350.978
          r =5        19823     21743.9     169.696     520.674
          r =6        78657     77311.8      23.406     544.080
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1535       944.3     369.506     369.506
          r =5        19706     21743.9     190.998     560.504
          r =6        78759     77311.8      27.090     587.594
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1468       944.3     290.437     290.437
          r =5        19835     21743.9     167.583     458.020
          r =6        78697     77311.8      24.819     482.839
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1496       944.3     322.325     322.325
          r =5        20011     21743.9     138.105     460.430
          r =6        78493     77311.8      18.047     478.476
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1443       944.3     263.370     263.370
          r =5        20211     21743.9     108.066     371.436
          r =6        78346     77311.8      13.834     385.271
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1413       944.3     232.636     232.636
          r =5        20136     21743.9     118.900     351.536
          r =6        78451     77311.8      16.786     368.322
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1417       944.3     236.624     236.624
          r =5        20166     21743.9     114.504     351.128
          r =6        78417     77311.8      15.799     366.927
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1849       944.3     866.757     866.757
          r =5        18602     21743.9     453.991    1320.748
          r =6        79549     77311.8      64.738    1385.487
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_mw.dat    
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1900       944.3     967.234     967.234
          r =5        18437     21743.9     502.927    1470.161
          r =6        79663     77311.8      71.504    1541.665
                        p=1-exp(-SUM/2)=1.00000
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
    1.000000    1.000000    1.000000    1.000000    1.000000
   brank test summary for lfsr_mw.dat    
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
 tst no  1:  149494 missing words,   17.72 sigmas from mean, p-value=1.00000
 tst no  2:  150017 missing words,   18.94 sigmas from mean, p-value=1.00000
 tst no  3:  148823 missing words,   16.15 sigmas from mean, p-value=1.00000
 tst no  4:  148971 missing words,   16.50 sigmas from mean, p-value=1.00000
 tst no  5:  149651 missing words,   18.09 sigmas from mean, p-value=1.00000
 tst no  6:  148497 missing words,   15.39 sigmas from mean, p-value=1.00000
 tst no  7:  148673 missing words,   15.80 sigmas from mean, p-value=1.00000
 tst no  8:  149934 missing words,   18.75 sigmas from mean, p-value=1.00000
 tst no  9:  149242 missing words,   17.13 sigmas from mean, p-value=1.00000
 tst no 10:  149797 missing words,   18.43 sigmas from mean, p-value=1.00000
 tst no 11:  148344 missing words,   15.03 sigmas from mean, p-value=1.00000
 tst no 12:  150576 missing words,   20.25 sigmas from mean, p-value=1.00000
 tst no 13:  150657 missing words,   20.44 sigmas from mean, p-value=1.00000
 tst no 14:  149342 missing words,   17.37 sigmas from mean, p-value=1.00000
 tst no 15:  150199 missing words,   19.37 sigmas from mean, p-value=1.00000
 tst no 16:  148879 missing words,   16.28 sigmas from mean, p-value=1.00000
 tst no 17:  149293 missing words,   17.25 sigmas from mean, p-value=1.00000
 tst no 18:  149307 missing words,   17.28 sigmas from mean, p-value=1.00000
 tst no 19:  149708 missing words,   18.22 sigmas from mean, p-value=1.00000
 tst no 20:  149628 missing words,   18.03 sigmas from mean, p-value=1.00000

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
 OPSO test for generator lfsr_mw.dat              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for lfsr_mw.dat     using bits 23 to 32        138175-12.877  .0000
    OPSO for lfsr_mw.dat     using bits 22 to 31        137544-15.053  .0000
    OPSO for lfsr_mw.dat     using bits 21 to 30        137380-15.618  .0000
    OPSO for lfsr_mw.dat     using bits 20 to 29        137418-15.487  .0000
    OPSO for lfsr_mw.dat     using bits 19 to 28        136843-17.470  .0000
    OPSO for lfsr_mw.dat     using bits 18 to 27        533390******* 1.0000
    OPSO for lfsr_mw.dat     using bits 17 to 26        533196******* 1.0000
    OPSO for lfsr_mw.dat     using bits 16 to 25        786528******* 1.0000
    OPSO for lfsr_mw.dat     using bits 15 to 24        786509******* 1.0000
    OPSO for lfsr_mw.dat     using bits 14 to 23        786516******* 1.0000
    OPSO for lfsr_mw.dat     using bits 13 to 22        786506******* 1.0000
    OPSO for lfsr_mw.dat     using bits 12 to 21        786496******* 1.0000
    OPSO for lfsr_mw.dat     using bits 11 to 20        786511******* 1.0000
    OPSO for lfsr_mw.dat     using bits 10 to 19        533408******* 1.0000
    OPSO for lfsr_mw.dat     using bits  9 to 18        533208******* 1.0000
    OPSO for lfsr_mw.dat     using bits  8 to 17        137012-16.887  .0000
    OPSO for lfsr_mw.dat     using bits  7 to 16        137594-14.880  .0000
    OPSO for lfsr_mw.dat     using bits  6 to 15        138492-11.784  .0000
    OPSO for lfsr_mw.dat     using bits  5 to 14        137924-13.743  .0000
    OPSO for lfsr_mw.dat     using bits  4 to 13        137593-14.884  .0000
    OPSO for lfsr_mw.dat     using bits  3 to 12        137845-14.015  .0000
    OPSO for lfsr_mw.dat     using bits  2 to 11        137555-15.015  .0000
    OPSO for lfsr_mw.dat     using bits  1 to 10        786512******* 1.0000
 OQSO test for generator lfsr_mw.dat              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for lfsr_mw.dat     using bits 28 to 32       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits 27 to 31       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits 26 to 30        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits 25 to 29        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits 24 to 28        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits 23 to 27        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits 22 to 26        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits 21 to 25        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits 20 to 24       1015805******* 1.0000
    OQSO for lfsr_mw.dat     using bits 19 to 23       1015805******* 1.0000
    OQSO for lfsr_mw.dat     using bits 18 to 22       1040381******* 1.0000
    OQSO for lfsr_mw.dat     using bits 17 to 21       1040381******* 1.0000
    OQSO for lfsr_mw.dat     using bits 16 to 20       1044477******* 1.0000
    OQSO for lfsr_mw.dat     using bits 15 to 19       1040381******* 1.0000
    OQSO for lfsr_mw.dat     using bits 14 to 18       1040381******* 1.0000
    OQSO for lfsr_mw.dat     using bits 13 to 17       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits 12 to 16       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits 11 to 15       1015805******* 1.0000
    OQSO for lfsr_mw.dat     using bits 10 to 14       1015805******* 1.0000
    OQSO for lfsr_mw.dat     using bits  9 to 13        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits  8 to 12        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits  7 to 11        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits  6 to 10        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits  5 to  9        983037******* 1.0000
    OQSO for lfsr_mw.dat     using bits  4 to  8        983038******* 1.0000
    OQSO for lfsr_mw.dat     using bits  3 to  7       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits  2 to  6       1032189******* 1.0000
    OQSO for lfsr_mw.dat     using bits  1 to  5       1044477******* 1.0000
  DNA test for generator lfsr_mw.dat              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for lfsr_mw.dat     using bits 31 to 32        137467-13.104  .0000
     DNA for lfsr_mw.dat     using bits 30 to 31        138229-10.856  .0000
     DNA for lfsr_mw.dat     using bits 29 to 30        137805-12.107  .0000
     DNA for lfsr_mw.dat     using bits 28 to 29        137331-13.505  .0000
     DNA for lfsr_mw.dat     using bits 27 to 28        137919-11.771  .0000
     DNA for lfsr_mw.dat     using bits 26 to 27        137611-12.679  .0000
     DNA for lfsr_mw.dat     using bits 25 to 26        137320-13.538  .0000
     DNA for lfsr_mw.dat     using bits 24 to 25        137239-13.777  .0000
     DNA for lfsr_mw.dat     using bits 23 to 24        137374-13.379  .0000
     DNA for lfsr_mw.dat     using bits 22 to 23        137508-12.983  .0000
     DNA for lfsr_mw.dat     using bits 21 to 22        137902-11.821  .0000
     DNA for lfsr_mw.dat     using bits 20 to 21        137328-13.514  .0000
     DNA for lfsr_mw.dat     using bits 19 to 20        137636-12.606  .0000
     DNA for lfsr_mw.dat     using bits 18 to 19        137763-12.231  .0000
     DNA for lfsr_mw.dat     using bits 17 to 18        137284-13.644  .0000
     DNA for lfsr_mw.dat     using bits 16 to 17        137850-11.974  .0000
     DNA for lfsr_mw.dat     using bits 15 to 16        137652-12.558  .0000
     DNA for lfsr_mw.dat     using bits 14 to 15        138004-11.520  .0000
     DNA for lfsr_mw.dat     using bits 13 to 14        137409-13.275  .0000
     DNA for lfsr_mw.dat     using bits 12 to 13        137335-13.494  .0000
     DNA for lfsr_mw.dat     using bits 11 to 12        137556-12.842  .0000
     DNA for lfsr_mw.dat     using bits 10 to 11        137345-13.464  .0000
     DNA for lfsr_mw.dat     using bits  9 to 10        137797-12.131  .0000
     DNA for lfsr_mw.dat     using bits  8 to  9        137726-12.340  .0000
     DNA for lfsr_mw.dat     using bits  7 to  8        137382-13.355  .0000
     DNA for lfsr_mw.dat     using bits  6 to  7        137120-14.128  .0000
     DNA for lfsr_mw.dat     using bits  5 to  6        138122-11.172  .0000
     DNA for lfsr_mw.dat     using bits  4 to  5        137647-12.573  .0000
     DNA for lfsr_mw.dat     using bits  3 to  4        137847-11.983  .0000
     DNA for lfsr_mw.dat     using bits  2 to  3        137555-12.845  .0000
     DNA for lfsr_mw.dat     using bits  1 to  2       1047552******* 1.0000

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
   Test results for lfsr_mw.dat    
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for lfsr_mw.dat     97213.18   1339.447     1.000000
 byte stream for lfsr_mw.dat     98332.47   1355.276     1.000000

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
           bits  1 to  8 69789.02    951.610     1.000000
           bits  2 to  9 11821.44    131.825     1.000000
           bits  3 to 10 11542.38    127.879     1.000000
           bits  4 to 11  5951.78     48.815     1.000000
           bits  5 to 12  5802.06     46.698     1.000000
           bits  6 to 13  4158.05     23.448     1.000000
           bits  7 to 14  4313.45     25.646     1.000000
           bits  8 to 15  4236.66     24.560     1.000000
           bits  9 to 16  6609.84     58.122     1.000000
           bits 10 to 17  5323.02     39.924     1.000000
           bits 11 to 18  8649.38     86.965     1.000000
           bits 12 to 19  7345.33     68.523     1.000000
           bits 13 to 20 15918.58    189.767     1.000000
           bits 14 to 21 16185.67    193.545     1.000000
           bits 15 to 22 16847.31    202.902     1.000000
           bits 16 to 23 22190.89    278.471     1.000000
           bits 17 to 24 16509.04    198.118     1.000000
           bits 18 to 25 16676.05    200.480     1.000000
           bits 19 to 26  7742.21     74.136     1.000000
           bits 20 to 27  7524.22     71.053     1.000000
           bits 21 to 28  4038.04     21.751     1.000000
           bits 22 to 29  4510.27     28.430     1.000000
           bits 23 to 30  4587.04     29.515     1.000000
           bits 24 to 31  6058.17     50.320     1.000000
           bits 25 to 32  5842.66     47.272     1.000000

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
           CDPARK: result of ten tests on file lfsr_mw.dat    
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes: 1183    z-score:******* p-value: .000000
            Successes: 1176    z-score:******* p-value: .000000
            Successes: 1187    z-score:******* p-value: .000000
            Successes: 1180    z-score:******* p-value: .000000
            Successes: 1195    z-score:******* p-value: .000000
            Successes: 1187    z-score:******* p-value: .000000
            Successes: 1164    z-score:******* p-value: .000000
            Successes: 1165    z-score:******* p-value: .000000
            Successes: 1175    z-score:******* p-value: .000000
            Successes: 1167    z-score:******* p-value: .000000

           square size   avg. no.  parked   sample sigma
             100.            1177.900        9.891
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
              for random integers in the file lfsr_mw.dat    
     Sample no.    d^2     avg     equiv uni            
           5     .0582    .3609     .056857
          10     .1863    .2922     .170723
          15     .9433    .3555     .612500
          20     .0583    .3706     .056928
          25     .0466    .3588     .045722
          30     .1979    .3572     .180338
          35     .2912    .3727     .253689
          40     .4771    .3512     .380916
          45     .6049    .3561     .455536
          50     .2333    .3694     .208995
          55     .1047    .3813     .099845
          60     .7111    .3891     .510668
          65     .0580    .3760     .056645
          70    1.1295    .3876     .678631
          75     .1982    .3892     .180645
          80     .4772    .4004     .380962
          85     .0585    .4055     .057069
          90     .0467    .4065     .045865
          95     .0466    .4063     .045722
         100     .0464    .4032     .045579
     MINIMUM DISTANCE TEST for lfsr_mw.dat    
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
               The 3DSPHERES test for file lfsr_mw.dat    
 sample no:  1     r^3=   4.303     p-value= .13362
 sample no:  2     r^3=   2.429     p-value= .07777
 sample no:  3     r^3=  11.186     p-value= .31123
 sample no:  4     r^3=  14.527     p-value= .38382
 sample no:  5     r^3=   2.247     p-value= .07217
 sample no:  6     r^3=   7.799     p-value= .22891
 sample no:  7     r^3=   1.089     p-value= .03565
 sample no:  8     r^3=   2.348     p-value= .07528
 sample no:  9     r^3=   2.432     p-value= .07786
 sample no: 10     r^3=   2.884     p-value= .09165
 sample no: 11     r^3=   9.888     p-value= .28080
 sample no: 12     r^3=   5.037     p-value= .15456
 sample no: 13     r^3=   1.025     p-value= .03358
 sample no: 14     r^3=  17.297     p-value= .43817
 sample no: 15     r^3=   1.585     p-value= .05145
 sample no: 16     r^3=    .157     p-value= .00522
 sample no: 17     r^3=   1.114     p-value= .03647
 sample no: 18     r^3=   2.456     p-value= .07860
 sample no: 19     r^3=   1.761     p-value= .05702
 sample no: 20     r^3=   3.631     p-value= .11401
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file lfsr_mw.dat          p-value=1.000000
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
