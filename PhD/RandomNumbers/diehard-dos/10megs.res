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
           Results for 10megs-random.1
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  1 to 24   1.964
  duplicate       number       number 
  spacings       observed     expected
        0          73.       67.668
        1         151.      135.335
        2         121.      135.335
        3          73.       90.224
        4          48.       45.112
        5          27.       18.045
  6 to INF          7.        8.282
 Chisquare with  6 d.o.f. =    11.87 p-value=  .935007
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  2 to 25   1.962
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         151.      135.335
        2         123.      135.335
        3          85.       90.224
        4          44.       45.112
        5          20.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     3.51 p-value=  .258024
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  3 to 26   2.008
  duplicate       number       number 
  spacings       observed     expected
        0          57.       67.668
        1         157.      135.335
        2         130.      135.335
        3          81.       90.224
        4          47.       45.112
        5          16.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =     8.28 p-value=  .781916
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  4 to 27   1.904
  duplicate       number       number 
  spacings       observed     expected
        0          67.       67.668
        1         165.      135.335
        2         120.      135.335
        3          84.       90.224
        4          36.       45.112
        5          18.       18.045
  6 to INF         10.        8.282
 Chisquare with  6 d.o.f. =    10.87 p-value=  .907615
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  5 to 28   1.930
  duplicate       number       number 
  spacings       observed     expected
        0          70.       67.668
        1         141.      135.335
        2         141.      135.335
        3          84.       90.224
        4          37.       45.112
        5          20.       18.045
  6 to INF          7.        8.282
 Chisquare with  6 d.o.f. =     2.85 p-value=  .172915
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  6 to 29   1.970
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         137.      135.335
        2         137.      135.335
        3          93.       90.224
        4          37.       45.112
        5          18.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     1.67 p-value=  .052862
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  7 to 30   1.958
  duplicate       number       number 
  spacings       observed     expected
        0          71.       67.668
        1         147.      135.335
        2         129.      135.335
        3          82.       90.224
        4          44.       45.112
        5          17.       18.045
  6 to INF         10.        8.282
 Chisquare with  6 d.o.f. =     2.66 p-value=  .149846
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  8 to 31   1.904
  duplicate       number       number 
  spacings       observed     expected
        0          74.       67.668
        1         140.      135.335
        2         144.      135.335
        3          85.       90.224
        4          34.       45.112
        5          12.       18.045
  6 to INF         11.        8.282
 Chisquare with  6 d.o.f. =     7.26 p-value=  .702929
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          10megs-random.1  using bits  9 to 32   2.110
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         115.      135.335
        2         144.      135.335
        3          86.       90.224
        4          51.       45.112
        5          26.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     8.17 p-value=  .774251
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
        .935007   .258024   .781916   .907615   .172915
        .052862   .149846   .702929   .774251
  A KSTEST for the 9 p-values yields  .374718

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
           OPERM5 test for file 10megs-random.1
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom= 86.033; p-value= .179428
           OPERM5 test for file 10megs-random.1
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom= 84.425; p-value= .148277
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 31x31 matrices. The leftmost ::      
     :: 31 bits of 31 random integers from the test sequence are used ::      
     :: to form a 31x31 binary matrix over the field {0,1}. The rank  ::      
     :: is determined. That rank can be from 0 to 31, but ranks< 28   ::      
     :: are rare, and their counts are pooled with those for rank 28. ::      
     :: Ranks are found for 40,000 such random matrices and a chisqua-::      
     :: re test is performed on counts for ranks 31,30,29 and <=28.   ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
    Binary rank test for 10megs-random.1
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28       210     211.4   .009511     .010
        29      5235    5134.0  1.986542    1.996
        30     23153   23103.0   .108008    2.104
        31     11402   11551.5  1.935463    4.040
  chisquare= 4.040 for 3 d. of f.; p-value= .764996
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
    Binary rank test for 10megs-random.1
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29       214     211.4   .031533     .032
        30      5193    5134.0   .677792     .709
        31     23039   23103.0   .177552     .887
        32     11554   11551.5   .000531     .887
  chisquare=  .887 for 3 d. of f.; p-value= .344625
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
         Binary Rank Test for 10megs-random.1
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          924       944.3        .436        .436
          r =5        21930     21743.9       1.593       2.029
          r =6        77146     77311.8        .356       2.385
                        p=1-exp(-SUM/2)= .69651
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          906       944.3       1.554       1.554
          r =5        21899     21743.9       1.106       2.660
          r =6        77195     77311.8        .176       2.836
                        p=1-exp(-SUM/2)= .75784
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          916       944.3        .848        .848
          r =5        21770     21743.9        .031        .880
          r =6        77314     77311.8        .000        .880
                        p=1-exp(-SUM/2)= .35583
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          948       944.3        .014        .014
          r =5        21962     21743.9       2.188       2.202
          r =6        77090     77311.8        .636       2.838
                        p=1-exp(-SUM/2)= .75810
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          962       944.3        .332        .332
          r =5        21744     21743.9        .000        .332
          r =6        77294     77311.8        .004        .336
                        p=1-exp(-SUM/2)= .15457
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          959       944.3        .229        .229
          r =5        21776     21743.9        .047        .276
          r =6        77265     77311.8        .028        .305
                        p=1-exp(-SUM/2)= .14123
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          997       944.3       2.941       2.941
          r =5        21765     21743.9        .020       2.961
          r =6        77238     77311.8        .070       3.032
                        p=1-exp(-SUM/2)= .78040
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          874       944.3       5.234       5.234
          r =5        21607     21743.9        .862       6.096
          r =6        77519     77311.8        .555       6.651
                        p=1-exp(-SUM/2)= .96405
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          898       944.3       2.270       2.270
          r =5        21787     21743.9        .085       2.356
          r =6        77315     77311.8        .000       2.356
                        p=1-exp(-SUM/2)= .69208
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          914       944.3        .972        .972
          r =5        21770     21743.9        .031       1.004
          r =6        77316     77311.8        .000       1.004
                        p=1-exp(-SUM/2)= .39464
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          942       944.3        .006        .006
          r =5        21758     21743.9        .009        .015
          r =6        77300     77311.8        .002        .017
                        p=1-exp(-SUM/2)= .00824
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          999       944.3       3.168       3.168
          r =5        21709     21743.9        .056       3.224
          r =6        77292     77311.8        .005       3.230
                        p=1-exp(-SUM/2)= .80106
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          952       944.3        .063        .063
          r =5        21744     21743.9        .000        .063
          r =6        77304     77311.8        .001        .064
                        p=1-exp(-SUM/2)= .03128
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          942       944.3        .006        .006
          r =5        22006     21743.9       3.159       3.165
          r =6        77052     77311.8        .873       4.038
                        p=1-exp(-SUM/2)= .86721
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          960       944.3        .261        .261
          r =5        21722     21743.9        .022        .283
          r =6        77318     77311.8        .000        .284
                        p=1-exp(-SUM/2)= .13218
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          924       944.3        .436        .436
          r =5        21795     21743.9        .120        .557
          r =6        77281     77311.8        .012        .569
                        p=1-exp(-SUM/2)= .24754
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          966       944.3        .499        .499
          r =5        22017     21743.9       3.430       3.929
          r =6        77017     77311.8       1.124       5.053
                        p=1-exp(-SUM/2)= .92006
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          933       944.3        .135        .135
          r =5        21901     21743.9       1.135       1.270
          r =6        77166     77311.8        .275       1.545
                        p=1-exp(-SUM/2)= .53821
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          977       944.3       1.132       1.132
          r =5        21730     21743.9        .009       1.141
          r =6        77293     77311.8        .005       1.146
                        p=1-exp(-SUM/2)= .43609
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          919       944.3        .678        .678
          r =5        21645     21743.9        .450       1.128
          r =6        77436     77311.8        .200       1.327
                        p=1-exp(-SUM/2)= .48502
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          959       944.3        .229        .229
          r =5        21886     21743.9        .929       1.157
          r =6        77155     77311.8        .318       1.475
                        p=1-exp(-SUM/2)= .52180
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1013       944.3       4.998       4.998
          r =5        21890     21743.9        .982       5.980
          r =6        77097     77311.8        .597       6.576
                        p=1-exp(-SUM/2)= .96268
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          920       944.3        .625        .625
          r =5        21942     21743.9       1.805       2.430
          r =6        77138     77311.8        .391       2.821
                        p=1-exp(-SUM/2)= .75597
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          911       944.3       1.174       1.174
          r =5        21863     21743.9        .652       1.827
          r =6        77226     77311.8        .095       1.922
                        p=1-exp(-SUM/2)= .61748
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG 10megs-random.1
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          960       944.3        .261        .261
          r =5        21653     21743.9        .380        .641
          r =6        77387     77311.8        .073        .714
                        p=1-exp(-SUM/2)= .30027
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
     .696510     .757840     .355834     .758100     .154571
     .141235     .780400     .964045     .692078     .394645
     .008243     .801062     .031278     .867212     .132180
     .247539     .920055     .538206     .436093     .485022
     .521805     .962678     .755969     .617484     .300274
   brank test summary for 10megs-random.1
       The KS test for those 25 supposed UNI's yields
                    KS p-value= .128096

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
 tst no  1:  142063 missing words,     .36 sigmas from mean, p-value= .64022
 tst no  2:  141751 missing words,    -.37 sigmas from mean, p-value= .35572
 tst no  3:  142472 missing words,    1.31 sigmas from mean, p-value= .90569
 tst no  4:  142190 missing words,     .66 sigmas from mean, p-value= .74402
 tst no  5:  141572 missing words,    -.79 sigmas from mean, p-value= .21530
 tst no  6:  142018 missing words,     .25 sigmas from mean, p-value= .60022
 tst no  7:  142185 missing words,     .64 sigmas from mean, p-value= .74024
 tst no  8:  141305 missing words,   -1.41 sigmas from mean, p-value= .07898
 tst no  9:  141584 missing words,    -.76 sigmas from mean, p-value= .22359
 tst no 10:  141301 missing words,   -1.42 sigmas from mean, p-value= .07761
 tst no 11:  142204 missing words,     .69 sigmas from mean, p-value= .75443
 tst no 12:  142809 missing words,    2.10 sigmas from mean, p-value= .98223
 tst no 13:  142568 missing words,    1.54 sigmas from mean, p-value= .93809
 tst no 14:  141790 missing words,    -.28 sigmas from mean, p-value= .39020
 tst no 15:  141988 missing words,     .18 sigmas from mean, p-value= .57292
 tst no 16:  142806 missing words,    2.10 sigmas from mean, p-value= .98192
 tst no 17:  142140 missing words,     .54 sigmas from mean, p-value= .70504
 tst no 18:  142175 missing words,     .62 sigmas from mean, p-value= .73261
 tst no 19:  142272 missing words,     .85 sigmas from mean, p-value= .80160
 tst no 20:  142508 missing words,    1.40 sigmas from mean, p-value= .91906

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
 OPSO test for generator 10megs-random.1          
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for 10megs-random.1 using bits 23 to 32        142268  1.237  .8919
    OPSO for 10megs-random.1 using bits 22 to 31        141975   .226  .5896
    OPSO for 10megs-random.1 using bits 21 to 30        142373  1.599  .9451
    OPSO for 10megs-random.1 using bits 20 to 29        142432  1.802  .9643
    OPSO for 10megs-random.1 using bits 19 to 28        141921   .040  .5161
    OPSO for 10megs-random.1 using bits 18 to 27        142005   .330  .6293
    OPSO for 10megs-random.1 using bits 17 to 26        141906  -.011  .4954
    OPSO for 10megs-random.1 using bits 16 to 25        142366  1.575  .9423
    OPSO for 10megs-random.1 using bits 15 to 24        141536 -1.287  .0990
    OPSO for 10megs-random.1 using bits 14 to 23        142028   .409  .6588
    OPSO for 10megs-random.1 using bits 13 to 22        142354  1.533  .9374
    OPSO for 10megs-random.1 using bits 12 to 21        141970   .209  .5829
    OPSO for 10megs-random.1 using bits 11 to 20        142209  1.033  .8493
    OPSO for 10megs-random.1 using bits 10 to 19        142025   .399  .6550
    OPSO for 10megs-random.1 using bits  9 to 18        142165   .882  .8110
    OPSO for 10megs-random.1 using bits  8 to 17        142581  2.316  .9897
    OPSO for 10megs-random.1 using bits  7 to 16        142173   .909  .8184
    OPSO for 10megs-random.1 using bits  6 to 15        142308  1.375  .9154
    OPSO for 10megs-random.1 using bits  5 to 14        142164   .878  .8101
    OPSO for 10megs-random.1 using bits  4 to 13        141958   .168  .5666
    OPSO for 10megs-random.1 using bits  3 to 12        142087   .613  .7299
    OPSO for 10megs-random.1 using bits  2 to 11        141459 -1.553  .0602
    OPSO for 10megs-random.1 using bits  1 to 10        141520 -1.343  .0897
 OQSO test for generator 10megs-random.1          
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for 10megs-random.1 using bits 28 to 32        141256 -2.215  .0134
    OQSO for 10megs-random.1 using bits 27 to 31        141575 -1.133  .1285
    OQSO for 10megs-random.1 using bits 26 to 30        141713  -.666  .2529
    OQSO for 10megs-random.1 using bits 25 to 29        141876  -.113  .4550
    OQSO for 10megs-random.1 using bits 24 to 28        142172   .890  .8134
    OQSO for 10megs-random.1 using bits 23 to 27        141764  -.493  .3111
    OQSO for 10megs-random.1 using bits 22 to 26        142401  1.667  .9522
    OQSO for 10megs-random.1 using bits 21 to 25        141916   .023  .5090
    OQSO for 10megs-random.1 using bits 20 to 24        141771  -.469  .3196
    OQSO for 10megs-random.1 using bits 19 to 23        142189   .948  .8284
    OQSO for 10megs-random.1 using bits 18 to 22        142205  1.002  .8419
    OQSO for 10megs-random.1 using bits 17 to 21        141838  -.242  .4045
    OQSO for 10megs-random.1 using bits 16 to 20        142222  1.060  .8554
    OQSO for 10megs-random.1 using bits 15 to 19        142175   .901  .8161
    OQSO for 10megs-random.1 using bits 14 to 18        142234  1.101  .8645
    OQSO for 10megs-random.1 using bits 13 to 17        141905  -.015  .4941
    OQSO for 10megs-random.1 using bits 12 to 16        141892  -.059  .4766
    OQSO for 10megs-random.1 using bits 11 to 15        142272  1.229  .8905
    OQSO for 10megs-random.1 using bits 10 to 14        142166   .870  .8079
    OQSO for 10megs-random.1 using bits  9 to 13        142277  1.246  .8937
    OQSO for 10megs-random.1 using bits  8 to 12        141831  -.266  .3953
    OQSO for 10megs-random.1 using bits  7 to 11        141811  -.333  .3694
    OQSO for 10megs-random.1 using bits  6 to 10        141517 -1.330  .0918
    OQSO for 10megs-random.1 using bits  5 to  9        141532 -1.279  .1004
    OQSO for 10megs-random.1 using bits  4 to  8        141641  -.910  .1815
    OQSO for 10megs-random.1 using bits  3 to  7        141912   .009  .5036
    OQSO for 10megs-random.1 using bits  2 to  6        141905  -.015  .4941
    OQSO for 10megs-random.1 using bits  1 to  5        142057   .501  .6917
  DNA test for generator 10megs-random.1          
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for 10megs-random.1 using bits 31 to 32        142336  1.259  .8959
     DNA for 10megs-random.1 using bits 30 to 31        141590  -.942  .1731
     DNA for 10megs-random.1 using bits 29 to 30        142149   .707  .7602
     DNA for 10megs-random.1 using bits 28 to 29        142434  1.548  .9392
     DNA for 10megs-random.1 using bits 27 to 28        142407  1.468  .9290
     DNA for 10megs-random.1 using bits 26 to 27        141654  -.753  .2257
     DNA for 10megs-random.1 using bits 25 to 26        141302 -1.792  .0366
     DNA for 10megs-random.1 using bits 24 to 25        142137   .672  .7491
     DNA for 10megs-random.1 using bits 23 to 24        141154 -2.228  .0129
     DNA for 10megs-random.1 using bits 22 to 23        141844  -.193  .4236
     DNA for 10megs-random.1 using bits 21 to 22        142254  1.017  .8454
     DNA for 10megs-random.1 using bits 20 to 21        141964   .161  .5641
     DNA for 10megs-random.1 using bits 19 to 20        141985   .223  .5883
     DNA for 10megs-random.1 using bits 18 to 19        141751  -.467  .3202
     DNA for 10megs-random.1 using bits 17 to 18        142006   .285  .6122
     DNA for 10megs-random.1 using bits 16 to 17        142099   .560  .7121
     DNA for 10megs-random.1 using bits 15 to 16        142044   .397  .6544
     DNA for 10megs-random.1 using bits 14 to 15        141602  -.907  .1823
     DNA for 10megs-random.1 using bits 13 to 14        142336  1.259  .8959
     DNA for 10megs-random.1 using bits 12 to 13        141795  -.337  .3680
     DNA for 10megs-random.1 using bits 11 to 12        142202   .863  .8060
     DNA for 10megs-random.1 using bits 10 to 11        142369  1.356  .9124
     DNA for 10megs-random.1 using bits  9 to 10        141419 -1.446  .0740
     DNA for 10megs-random.1 using bits  8 to  9        141892  -.051  .4796
     DNA for 10megs-random.1 using bits  7 to  8        141818  -.269  .3938
     DNA for 10megs-random.1 using bits  6 to  7        141534 -1.107  .1341
     DNA for 10megs-random.1 using bits  5 to  6        142288  1.117  .8680
     DNA for 10megs-random.1 using bits  4 to  5        142000   .267  .6054
     DNA for 10megs-random.1 using bits  3 to  4        142019   .324  .6268
     DNA for 10megs-random.1 using bits  2 to  3        142300  1.152  .8754
     DNA for 10megs-random.1 using bits  1 to  2        141819  -.266  .3949

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
   Test results for 10megs-random.1
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for 10megs-random.1  2541.19       .582      .719878
 byte stream for 10megs-random.1  2462.99      -.523      .300366

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
           bits  1 to  8  2534.34       .486      .686388
           bits  2 to  9  2505.06       .072      .528502
           bits  3 to 10  2515.74       .223      .588086
           bits  4 to 11  2488.69      -.160      .436464
           bits  5 to 12  2496.05      -.056      .477751
           bits  6 to 13  2450.70      -.697      .242840
           bits  7 to 14  2489.85      -.144      .442934
           bits  8 to 15  2479.52      -.290      .386031
           bits  9 to 16  2448.53      -.728      .233341
           bits 10 to 17  2510.27       .145      .557761
           bits 11 to 18  2512.71       .180      .571340
           bits 12 to 19  2624.55      1.761      .960911
           bits 13 to 20  2550.00       .707      .760246
           bits 14 to 21  2560.71       .859      .804729
           bits 15 to 22  2555.13       .780      .782215
           bits 16 to 23  2460.72      -.555      .289296
           bits 17 to 24  2524.00       .339      .632844
           bits 18 to 25  2417.04     -1.173      .120353
           bits 19 to 26  2601.01      1.429      .923435
           bits 20 to 27  2534.05       .482      .684933
           bits 21 to 28  2439.58      -.855      .196407
           bits 22 to 29  2415.91     -1.189      .117164
           bits 23 to 30  2535.55       .503      .692440
           bits 24 to 31  2410.85     -1.261      .103690
           bits 25 to 32  2396.07     -1.470      .070819

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
           CDPARK: result of ten tests on file 10megs-random.1
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes: 3529    z-score:   .274 p-value: .607947
            Successes: 3535    z-score:   .548 p-value: .708135
            Successes: 3534    z-score:   .502 p-value: .692266
            Successes: 3536    z-score:   .594 p-value: .723613
            Successes: 3495    z-score: -1.279 p-value: .100530
            Successes: 3533    z-score:   .457 p-value: .676028
            Successes: 3541    z-score:   .822 p-value: .794438
            Successes: 3492    z-score: -1.416 p-value: .078457
            Successes: 3530    z-score:   .320 p-value: .625377
            Successes: 3530    z-score:   .320 p-value: .625377

           square size   avg. no.  parked   sample sigma
             100.            3525.500       16.351
            KSTEST for the above 10: p=  .811898

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
              for random integers in the file 10megs-random.1
     Sample no.    d^2     avg     equiv uni            
           5     .9720    .8855     .623524
          10     .6226    .8981     .465127
          15    1.5663    .8953     .792816
          20     .4474    .9625     .362133
          25    1.5155   1.0487     .781965
          30     .9348    .9692     .609165
          35    1.1361   1.0584     .680754
          40     .4045   1.0239     .334059
          45     .3707    .9446     .311029
          50     .9304    .9364     .607463
          55     .5618    .9153     .431400
          60    1.2320    .9503     .710094
          65     .4995   1.0544     .394712
          70     .1932   1.0824     .176493
          75     .7869   1.0406     .546539
          80     .2038    .9890     .185217
          85     .9989    .9966     .633551
          90    1.2565   1.0367     .717131
          95     .0801   1.0260     .077307
         100    1.2724   1.0297     .721618
     MINIMUM DISTANCE TEST for 10megs-random.1
          Result of KS test on 20 transformed mindist^2's:
                                  p-value= .335433

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
               The 3DSPHERES test for file 10megs-random.1
 sample no:  1     r^3=  98.512     p-value= .96251
 sample no:  2     r^3=  18.742     p-value= .46460
 sample no:  3     r^3=  50.225     p-value= .81254
 sample no:  4     r^3=  37.129     p-value= .70993
 sample no:  5     r^3=   1.726     p-value= .05592
 sample no:  6     r^3=  25.299     p-value= .56972
 sample no:  7     r^3=  43.930     p-value= .76877
 sample no:  8     r^3=  31.336     p-value= .64814
 sample no:  9     r^3=  61.090     p-value= .86949
 sample no: 10     r^3=  15.268     p-value= .39885
 sample no: 11     r^3=  49.408     p-value= .80736
 sample no: 12     r^3=  62.441     p-value= .87524
 sample no: 13     r^3= 107.202     p-value= .97194
 sample no: 14     r^3=  29.684     p-value= .62823
 sample no: 15     r^3=   8.155     p-value= .23801
 sample no: 16     r^3=    .879     p-value= .02886
 sample no: 17     r^3=  20.631     p-value= .49726
 sample no: 18     r^3=    .293     p-value= .00971
 sample no: 19     r^3=  43.786     p-value= .76766
 sample no: 20     r^3=  44.461     p-value= .77283
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file 10megs-random.1      p-value= .854520
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
            RESULTS OF SQUEEZE TEST FOR 10megs-random.1
         Table of standardized frequency counts
     ( (obs-exp)/sqrt(exp) )^2
        for j taking values <=6,7,8,...,47,>=48:
     -.1     1.8     -.1     -.3      .1     -.1
     1.0     -.7     -.4    -1.4     -.7    -1.2
    -1.1     -.5     1.5     -.7     -.7      .3
     1.0      .5     1.3      .5     -.2     1.2
      .1    -1.4    -1.1     -.5     1.7      .1
     2.1     -.3    -1.8      .2      .2     1.3
      .7    -1.3      .5     -.7     -.6    -1.0
    -1.1
           Chi-square with 42 degrees of freedom: 39.747
              z-score=  -.246  p-value= .429535
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
                Test no.  1      p-value  .861251
                Test no.  2      p-value  .876386
                Test no.  3      p-value  .157998
                Test no.  4      p-value  .387550
                Test no.  5      p-value  .421802
                Test no.  6      p-value  .038419
                Test no.  7      p-value  .059309
                Test no.  8      p-value  .072855
                Test no.  9      p-value  .211665
                Test no. 10      p-value  .011836
   Results of the OSUM test for 10megs-random.1
        KSTEST on the above 10 p-values:  .977525

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
           The RUNS test for file 10megs-random.1
     Up and down runs in a sample of 10000
_________________________________________________ 
                 Run test for 10megs-random.1:
       runs up; ks test for 10 p's: .488697
     runs down; ks test for 10 p's: .841065
                 Run test for 10megs-random.1:
       runs up; ks test for 10 p's: .285560
     runs down; ks test for 10 p's: .588068

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
                Results of craps test for 10megs-random.1
  No. of wins:  Observed Expected
                                98748    98585.86
                  98748= No. of wins, z-score=  .725 pvalue= .76583
   Analysis of Throws-per-Game:
 Chisq=  22.94 for 20 degrees of freedom, p=  .70807
               Throws Observed Expected  Chisq     Sum
                  1    66566    66666.7    .152     .152
                  2    37705    37654.3    .068     .220
                  3    26951    26954.7    .001     .221
                  4    19438    19313.5    .803    1.024
                  5    13841    13851.4    .008    1.032
                  6     9885     9943.5    .345    1.376
                  7     7043     7145.0   1.457    2.833
                  8     5058     5139.1   1.279    4.112
                  9     3792     3699.9   2.294    6.406
                 10     2638     2666.3    .300    6.707
                 11     1954     1923.3    .489    7.196
                 12     1442     1388.7   2.043    9.238
                 13      965     1003.7   1.493   10.732
                 14      716      726.1    .142   10.873
                 15      525      525.8    .001   10.875
                 16      410      381.2   2.184   13.058
                 17      287      276.5    .396   13.454
                 18      215      200.8   1.000   14.454
                 19      143      146.0    .061   14.515
                 20       94      106.2   1.405   15.920
                 21      332      287.1   7.017   22.936
            SUMMARY  FOR 10megs-random.1
                p-value for no. of wins: .765831
                p-value for throws/game: .708071

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

 Results of DIEHARD battery of tests sent to file 10megs.res     
