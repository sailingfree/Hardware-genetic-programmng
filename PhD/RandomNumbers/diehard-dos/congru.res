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
           Results for congru.bin     
                   For a sample of size 500:     mean   
          congru.bin       using bits  1 to 24   5.654
  duplicate       number       number 
  spacings       observed     expected
        0           1.       67.668
        1           6.      135.335
        2          22.      135.335
        3          69.       90.224
        4          79.       45.112
        5          82.       18.045
  6 to INF        241.        8.282
 Chisquare with  6 d.o.f. =  7080.68 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  2 to 25   3.556
  duplicate       number       number 
  spacings       observed     expected
        0          16.       67.668
        1          55.      135.335
        2          81.      135.335
        3         110.       90.224
        4          86.       45.112
        5          78.       18.045
  6 to INF         74.        8.282
 Chisquare with  6 d.o.f. =   871.05 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  3 to 26   3.460
  duplicate       number       number 
  spacings       observed     expected
        0          24.       67.668
        1          41.      135.335
        2          93.      135.335
        3         129.       90.224
        4          76.       45.112
        5          66.       18.045
  6 to INF         71.        8.282
 Chisquare with  6 d.o.f. =   747.40 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  4 to 27   3.572
  duplicate       number       number 
  spacings       observed     expected
        0          12.       67.668
        1          47.      135.335
        2          76.      135.335
        3         115.       90.224
        4         118.       45.112
        5          64.       18.045
  6 to INF         68.        8.282
 Chisquare with  6 d.o.f. =   801.69 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  5 to 28   3.572
  duplicate       number       number 
  spacings       observed     expected
        0          15.       67.668
        1          43.      135.335
        2          98.      135.335
        3         110.       90.224
        4          81.       45.112
        5          72.       18.045
  6 to INF         81.        8.282
 Chisquare with  6 d.o.f. =   947.01 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  6 to 29   3.498
  duplicate       number       number 
  spacings       observed     expected
        0          10.       67.668
        1          47.      135.335
        2          91.      135.335
        3         119.       90.224
        4         101.       45.112
        5          65.       18.045
  6 to INF         67.        8.282
 Chisquare with  6 d.o.f. =   738.24 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  7 to 30   3.624
  duplicate       number       number 
  spacings       observed     expected
        0          12.       67.668
        1          45.      135.335
        2          96.      135.335
        3         101.       90.224
        4          89.       45.112
        5          75.       18.045
  6 to INF         82.        8.282
 Chisquare with  6 d.o.f. =   997.46 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  8 to 31   3.608
  duplicate       number       number 
  spacings       observed     expected
        0          18.       67.668
        1          48.      135.335
        2          88.      135.335
        3          99.       90.224
        4          96.       45.112
        5          70.       18.045
  6 to INF         81.        8.282
 Chisquare with  6 d.o.f. =   955.72 p-value= 1.000000
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          congru.bin       using bits  9 to 32   3.830
  duplicate       number       number 
  spacings       observed     expected
        0          12.       67.668
        1          48.      135.335
        2          70.      135.335
        3         104.       90.224
        4          99.       45.112
        5          70.       18.045
  6 to INF         97.        8.282
 Chisquare with  6 d.o.f. =  1300.15 p-value= 1.000000
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
           OPERM5 test for file congru.bin     
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=121.285; p-value= .936398
           OPERM5 test for file congru.bin     
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom=122.317; p-value= .943980
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 31x31 matrices. The leftmost ::      
     :: 31 bits of 31 random integers from the test sequence are used ::      
     :: to form a 31x31 binary matrix over the field {0,1}. The rank  ::      
     :: is determined. That rank can be from 0 to 31, but ranks< 28   ::      
     :: are rare, and their counts are pooled with those for rank 28. ::      
     :: Ranks are found for 40,000 such random matrices and a chisqua-::      
     :: re test is performed on counts for ranks 31,30,29 and <=28.   ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
    Binary rank test for congru.bin     
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28      1506     211.4********** 7927.151
        29     15341    5134.0**********28219.797
        30     23153   23103.0   .10800828219.904
        31         0   11551.5**********39771.430
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
    Binary rank test for congru.bin     
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29      1451     211.4********** 7267.894
        30     15373    5134.0**********27687.977
        31     23176   23103.0   .23036627688.207
        32         0   11551.5**********39239.730
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
         Binary Rank Test for congru.bin     
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         3581       944.3    7362.248    7362.248
          r =5        38382     21743.9   12731.219   20093.467
          r =6        58037     77311.8    4805.451   24898.918
                        p=1-exp(-SUM/2)=1.00000
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          937       944.3        .056        .056
          r =5        21777     21743.9        .050        .107
          r =6        77286     77311.8        .009        .115
                        p=1-exp(-SUM/2)= .05609
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          937       944.3        .056        .056
          r =5        21684     21743.9        .165        .221
          r =6        77379     77311.8        .058        .280
                        p=1-exp(-SUM/2)= .13059
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          940       944.3        .020        .020
          r =5        21736     21743.9        .003        .022
          r =6        77324     77311.8        .002        .024
                        p=1-exp(-SUM/2)= .01212
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          978       944.3       1.203       1.203
          r =5        21647     21743.9        .432       1.634
          r =6        77375     77311.8        .052       1.686
                        p=1-exp(-SUM/2)= .56960
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          956       944.3        .145        .145
          r =5        21633     21743.9        .566        .711
          r =6        77411     77311.8        .127        .838
                        p=1-exp(-SUM/2)= .34224
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          927       944.3        .317        .317
          r =5        21877     21743.9        .815       1.132
          r =6        77196     77311.8        .173       1.305
                        p=1-exp(-SUM/2)= .47931
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          931       944.3        .187        .187
          r =5        21734     21743.9        .005        .192
          r =6        77335     77311.8        .007        .199
                        p=1-exp(-SUM/2)= .09463
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          935       944.3        .092        .092
          r =5        21706     21743.9        .066        .158
          r =6        77359     77311.8        .029        .186
                        p=1-exp(-SUM/2)= .08903
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          927       944.3        .317        .317
          r =5        21844     21743.9        .461        .778
          r =6        77229     77311.8        .089        .866
                        p=1-exp(-SUM/2)= .35160
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          990       944.3       2.212       2.212
          r =5        21793     21743.9        .111       2.322
          r =6        77217     77311.8        .116       2.439
                        p=1-exp(-SUM/2)= .70458
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          956       944.3        .145        .145
          r =5        21706     21743.9        .066        .211
          r =6        77338     77311.8        .009        .220
                        p=1-exp(-SUM/2)= .10411
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          929       944.3        .248        .248
          r =5        21796     21743.9        .125        .373
          r =6        77275     77311.8        .018        .390
                        p=1-exp(-SUM/2)= .17729
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          935       944.3        .092        .092
          r =5        21697     21743.9        .101        .193
          r =6        77368     77311.8        .041        .234
                        p=1-exp(-SUM/2)= .11025
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          913       944.3       1.038       1.038
          r =5        21841     21743.9        .434       1.471
          r =6        77246     77311.8        .056       1.527
                        p=1-exp(-SUM/2)= .53401
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          961       944.3        .295        .295
          r =5        21628     21743.9        .618        .913
          r =6        77411     77311.8        .127       1.040
                        p=1-exp(-SUM/2)= .40558
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          902       944.3       1.895       1.895
          r =5        21901     21743.9       1.135       3.030
          r =6        77197     77311.8        .170       3.200
                        p=1-exp(-SUM/2)= .79815
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          987       944.3       1.931       1.931
          r =5        21528     21743.9       2.144       4.074
          r =6        77485     77311.8        .388       4.462
                        p=1-exp(-SUM/2)= .89260
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          924       944.3        .436        .436
          r =5        21776     21743.9        .047        .484
          r =6        77300     77311.8        .002        .486
                        p=1-exp(-SUM/2)= .21559
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          909       944.3       1.320       1.320
          r =5        21557     21743.9       1.607       2.926
          r =6        77534     77311.8        .639       3.565
                        p=1-exp(-SUM/2)= .83176
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          926       944.3        .355        .355
          r =5        21841     21743.9        .434        .788
          r =6        77233     77311.8        .080        .869
                        p=1-exp(-SUM/2)= .35229
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          938       944.3        .042        .042
          r =5        21789     21743.9        .094        .136
          r =6        77273     77311.8        .019        .155
                        p=1-exp(-SUM/2)= .07460
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          972       944.3        .812        .812
          r =5        21840     21743.9        .425       1.237
          r =6        77188     77311.8        .198       1.435
                        p=1-exp(-SUM/2)= .51214
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          924       944.3        .436        .436
          r =5        21995     21743.9       2.900       3.336
          r =6        77081     77311.8        .689       4.025
                        p=1-exp(-SUM/2)= .86636
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG congru.bin     
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          933       944.3        .135        .135
          r =5        21802     21743.9        .155        .290
          r =6        77265     77311.8        .028        .319
                        p=1-exp(-SUM/2)= .14736
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
    1.000000     .056091     .130585     .012119     .569599
     .342240     .479306     .094631     .089029     .351600
     .704575     .104108     .177286     .110248     .534009
     .405582     .798151     .892603     .215588     .831765
     .352291     .074604     .512140     .866359     .147357
   brank test summary for congru.bin     
       The KS test for those 25 supposed UNI's yields
                    KS p-value= .987388

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
 tst no  1:  147079 missing words,   12.08 sigmas from mean, p-value=1.00000
 tst no  2:  147321 missing words,   12.64 sigmas from mean, p-value=1.00000
 tst no  3:  147463 missing words,   12.98 sigmas from mean, p-value=1.00000
 tst no  4:  146806 missing words,   11.44 sigmas from mean, p-value=1.00000
 tst no  5:  148371 missing words,   15.10 sigmas from mean, p-value=1.00000
 tst no  6:  147516 missing words,   13.10 sigmas from mean, p-value=1.00000
 tst no  7:  147814 missing words,   13.80 sigmas from mean, p-value=1.00000
 tst no  8:  147007 missing words,   11.91 sigmas from mean, p-value=1.00000
 tst no  9:  146885 missing words,   11.63 sigmas from mean, p-value=1.00000
 tst no 10:  148403 missing words,   15.17 sigmas from mean, p-value=1.00000
 tst no 11:  147234 missing words,   12.44 sigmas from mean, p-value=1.00000
 tst no 12:  147659 missing words,   13.43 sigmas from mean, p-value=1.00000
 tst no 13:  147802 missing words,   13.77 sigmas from mean, p-value=1.00000
 tst no 14:  147567 missing words,   13.22 sigmas from mean, p-value=1.00000
 tst no 15:  147693 missing words,   13.51 sigmas from mean, p-value=1.00000
 tst no 16:  148058 missing words,   14.37 sigmas from mean, p-value=1.00000
 tst no 17:  147538 missing words,   13.15 sigmas from mean, p-value=1.00000
 tst no 18:  147139 missing words,   12.22 sigmas from mean, p-value=1.00000
 tst no 19:  147093 missing words,   12.11 sigmas from mean, p-value=1.00000
 tst no 20:  147451 missing words,   12.95 sigmas from mean, p-value=1.00000

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
 OPSO test for generator congru.bin               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for congru.bin      using bits 23 to 32        142277  1.268  .8976
    OPSO for congru.bin      using bits 22 to 31        142245  1.157  .8765
    OPSO for congru.bin      using bits 21 to 30        142018   .375  .6461
    OPSO for congru.bin      using bits 20 to 29        142016   .368  .6435
    OPSO for congru.bin      using bits 19 to 28        142221  1.075  .8588
    OPSO for congru.bin      using bits 18 to 27        142435  1.813  .9651
    OPSO for congru.bin      using bits 17 to 26        141785  -.429  .3341
    OPSO for congru.bin      using bits 16 to 25        142208  1.030  .8485
    OPSO for congru.bin      using bits 15 to 24        141163 -2.574  .0050
    OPSO for congru.bin      using bits 14 to 23        142095   .640  .7390
    OPSO for congru.bin      using bits 13 to 22        142163   .875  .8091
    OPSO for congru.bin      using bits 12 to 21        142068   .547  .7079
    OPSO for congru.bin      using bits 11 to 20        141975   .226  .5896
    OPSO for congru.bin      using bits 10 to 19        142219  1.068  .8572
    OPSO for congru.bin      using bits  9 to 18        142318  1.409  .9206
    OPSO for congru.bin      using bits  8 to 17        142363  1.564  .9411
    OPSO for congru.bin      using bits  7 to 16        141870  -.136  .4461
    OPSO for congru.bin      using bits  6 to 15        141930   .071  .5284
    OPSO for congru.bin      using bits  5 to 14        142013   .357  .6396
    OPSO for congru.bin      using bits  4 to 13        142033   .426  .6651
    OPSO for congru.bin      using bits  3 to 12        141949   .137  .5544
    OPSO for congru.bin      using bits  2 to 11        141470 -1.515  .0649
    OPSO for congru.bin      using bits  1 to 10        786521******* 1.0000
 OQSO test for generator congru.bin               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for congru.bin      using bits 28 to 32        142243  1.131  .8710
    OQSO for congru.bin      using bits 27 to 31        141967   .195  .5775
    OQSO for congru.bin      using bits 26 to 30        142111   .684  .7529
    OQSO for congru.bin      using bits 25 to 29        141681  -.774  .2195
    OQSO for congru.bin      using bits 24 to 28        141903  -.021  .4914
    OQSO for congru.bin      using bits 23 to 27        142081   .582  .7197
    OQSO for congru.bin      using bits 22 to 26        141931   .073  .5293
    OQSO for congru.bin      using bits 21 to 25        141579 -1.120  .1314
    OQSO for congru.bin      using bits 20 to 24        141518 -1.327  .0923
    OQSO for congru.bin      using bits 19 to 23        141543 -1.242  .1072
    OQSO for congru.bin      using bits 18 to 22        141735  -.591  .2773
    OQSO for congru.bin      using bits 17 to 21        142006   .328  .6284
    OQSO for congru.bin      using bits 16 to 20        141767  -.482  .3147
    OQSO for congru.bin      using bits 15 to 19        141824  -.289  .3862
    OQSO for congru.bin      using bits 14 to 18        141741  -.571  .2841
    OQSO for congru.bin      using bits 13 to 17        141620  -.981  .1634
    OQSO for congru.bin      using bits 12 to 16        141787  -.415  .3392
    OQSO for congru.bin      using bits 11 to 15        141540 -1.252  .1053
    OQSO for congru.bin      using bits 10 to 14        141764  -.493  .3111
    OQSO for congru.bin      using bits  9 to 13        141827  -.279  .3901
    OQSO for congru.bin      using bits  8 to 12        142132   .755  .7748
    OQSO for congru.bin      using bits  7 to 11        142187   .941  .8267
    OQSO for congru.bin      using bits  6 to 10        141474 -1.476  .0700
    OQSO for congru.bin      using bits  5 to  9        142613  2.385  .9915
    OQSO for congru.bin      using bits  4 to  8        141719  -.645  .2594
    OQSO for congru.bin      using bits  3 to  7        141395 -1.743  .0406
    OQSO for congru.bin      using bits  2 to  6        141878  -.106  .4577
    OQSO for congru.bin      using bits  1 to  5        983040******* 1.0000
  DNA test for generator congru.bin               
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for congru.bin      using bits 31 to 32        141470 -1.296  .0975
     DNA for congru.bin      using bits 30 to 31        142544  1.872  .9694
     DNA for congru.bin      using bits 29 to 30        142376  1.377  .9157
     DNA for congru.bin      using bits 28 to 29        142121   .624  .7338
     DNA for congru.bin      using bits 27 to 28        142900  2.922  .9983
     DNA for congru.bin      using bits 26 to 27        141656  -.747  .2274
     DNA for congru.bin      using bits 25 to 26        141367 -1.600  .0548
     DNA for congru.bin      using bits 24 to 25        141474 -1.284  .0995
     DNA for congru.bin      using bits 23 to 24        141248 -1.951  .0255
     DNA for congru.bin      using bits 22 to 23        141755  -.455  .3245
     DNA for congru.bin      using bits 21 to 22        141424 -1.432  .0761
     DNA for congru.bin      using bits 20 to 21        142124   .633  .7367
     DNA for congru.bin      using bits 19 to 20        142052   .421  .6631
     DNA for congru.bin      using bits 18 to 19        141982   .214  .5849
     DNA for congru.bin      using bits 17 to 18        142004   .279  .6100
     DNA for congru.bin      using bits 16 to 17        142220   .916  .8203
     DNA for congru.bin      using bits 15 to 16        142648  2.179  .9853
     DNA for congru.bin      using bits 14 to 15        141552 -1.054  .1459
     DNA for congru.bin      using bits 13 to 14        141710  -.588  .2783
     DNA for congru.bin      using bits 12 to 13        141947   .111  .5442
     DNA for congru.bin      using bits 11 to 12        141613  -.874  .1910
     DNA for congru.bin      using bits 10 to 11        141383 -1.553  .0603
     DNA for congru.bin      using bits  9 to 10        141585  -.957  .1694
     DNA for congru.bin      using bits  8 to  9        141343 -1.671  .0474
     DNA for congru.bin      using bits  7 to  8        141721  -.556  .2893
     DNA for congru.bin      using bits  6 to  7        142192   .834  .7978
     DNA for congru.bin      using bits  5 to  6        141961   .152  .5606
     DNA for congru.bin      using bits  4 to  5        141747  -.479  .3160
     DNA for congru.bin      using bits  3 to  4        142036   .374  .6457
     DNA for congru.bin      using bits  2 to  3        141820  -.264  .3961
     DNA for congru.bin      using bits  1 to  2       1047552******* 1.0000

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
   Test results for congru.bin     
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for congru.bin      23764.17    300.721     1.000000
 byte stream for congru.bin      24484.36    310.906     1.000000

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
           bits  1 to  8 50555.55    679.608     1.000000
           bits  2 to  9  2509.32       .132      .552451
           bits  3 to 10  2434.48      -.927      .177079
           bits  4 to 11  2475.38      -.348      .363834
           bits  5 to 12  2484.18      -.224      .411493
           bits  6 to 13  2484.52      -.219      .413362
           bits  7 to 14  2530.57       .432      .667252
           bits  8 to 15  2571.60      1.013      .844376
           bits  9 to 16  2533.05       .467      .679904
           bits 10 to 17  2450.68      -.697      .242760
           bits 11 to 18  2520.33       .288      .613164
           bits 12 to 19  2496.17      -.054      .478385
           bits 13 to 20  2442.95      -.807      .209890
           bits 14 to 21  2388.27     -1.580      .057049
           bits 15 to 22  2531.02       .439      .669579
           bits 16 to 23  2584.97      1.202      .885245
           bits 17 to 24  2494.94      -.072      .471487
           bits 18 to 25  2522.71       .321      .625953
           bits 19 to 26  2703.05      2.872      .997957
           bits 20 to 27  2594.38      1.335      .909017
           bits 21 to 28  2507.26       .103      .540865
           bits 22 to 29  2690.44      2.693      .996462
           bits 23 to 30  2656.61      2.215      .986614
           bits 24 to 31  2580.23      1.135      .871733
           bits 25 to 32  2506.35       .090      .535781

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
           CDPARK: result of ten tests on file congru.bin     
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes: 1174    z-score:******* p-value: .000000
            Successes: 1172    z-score:******* p-value: .000000
            Successes: 1169    z-score:******* p-value: .000000
            Successes: 1188    z-score:******* p-value: .000000
            Successes: 1171    z-score:******* p-value: .000000
            Successes: 1188    z-score:******* p-value: .000000
            Successes: 1170    z-score:******* p-value: .000000
            Successes: 1182    z-score:******* p-value: .000000
            Successes: 1189    z-score:******* p-value: .000000
            Successes: 1180    z-score:******* p-value: .000000

           square size   avg. no.  parked   sample sigma
             100.            1178.300        7.648
            KSTEST for the above 10: p= 1.000000

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

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
               The 3DSPHERES test for file congru.bin     
 sample no:  1     r^3=    .410     p-value= .01356
 sample no:  2     r^3=   1.414     p-value= .04603
 sample no:  3     r^3=   6.436     p-value= .19309
 sample no:  4     r^3=    .091     p-value= .00303
 sample no:  5     r^3=   3.332     p-value= .10512
 sample no:  6     r^3=    .757     p-value= .02491
 sample no:  7     r^3=    .389     p-value= .01287
 sample no:  8     r^3=   1.033     p-value= .03385
 sample no:  9     r^3=   1.682     p-value= .05452
 sample no: 10     r^3=    .048     p-value= .00160
 sample no: 11     r^3=   2.393     p-value= .07667
 sample no: 12     r^3=   1.700     p-value= .05510
 sample no: 13     r^3=   1.129     p-value= .03695
 sample no: 14     r^3=   2.851     p-value= .09066
 sample no: 15     r^3=    .995     p-value= .03263
 sample no: 16     r^3=  14.939     p-value= .39223
 sample no: 17     r^3=    .470     p-value= .01556
 sample no: 18     r^3=    .214     p-value= .00711
 sample no: 19     r^3=    .491     p-value= .01624
 sample no: 20     r^3=  11.537     p-value= .31926
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file congru.bin           p-value=1.000000
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
