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
           Results for lfsr_32.bin    
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  1 to 24   2.086
  duplicate       number       number 
  spacings       observed     expected
        0          62.       67.668
        1         131.      135.335
        2         138.      135.335
        3          89.       90.224
        4          47.       45.112
        5          21.       18.045
  6 to INF         12.        8.282
 Chisquare with  6 d.o.f. =     2.91 p-value=  .180562
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  2 to 25   2.036
  duplicate       number       number 
  spacings       observed     expected
        0          73.       67.668
        1         123.      135.335
        2         137.      135.335
        3          94.       90.224
        4          44.       45.112
        5          16.       18.045
  6 to INF         13.        8.282
 Chisquare with  6 d.o.f. =     4.67 p-value=  .413238
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  3 to 26   2.010
  duplicate       number       number 
  spacings       observed     expected
        0          70.       67.668
        1         131.      135.335
        2         136.      135.335
        3          89.       90.224
        4          49.       45.112
        5          15.       18.045
  6 to INF         10.        8.282
 Chisquare with  6 d.o.f. =     1.44 p-value=  .036902
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  4 to 27   2.030
  duplicate       number       number 
  spacings       observed     expected
        0          66.       67.668
        1         126.      135.335
        2         142.      135.335
        3          93.       90.224
        4          51.       45.112
        5          14.       18.045
  6 to INF          8.        8.282
 Chisquare with  6 d.o.f. =     2.78 p-value=  .164507
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  5 to 28   1.968
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         137.      135.335
        2         133.      135.335
        3          91.       90.224
        4          47.       45.112
        5          19.       18.045
  6 to INF          4.        8.282
 Chisquare with  6 d.o.f. =     2.44 p-value=  .124555
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  6 to 29   1.888
  duplicate       number       number 
  spacings       observed     expected
        0          75.       67.668
        1         152.      135.335
        2         124.      135.335
        3          89.       90.224
        4          35.       45.112
        5          16.       18.045
  6 to INF          9.        8.282
 Chisquare with  6 d.o.f. =     6.37 p-value=  .617280
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  7 to 30   2.008
  duplicate       number       number 
  spacings       observed     expected
        0          63.       67.668
        1         147.      135.335
        2         128.      135.335
        3          96.       90.224
        4          36.       45.112
        5          17.       18.045
  6 to INF         13.        8.282
 Chisquare with  6 d.o.f. =     6.68 p-value=  .648904
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  8 to 31   1.972
  duplicate       number       number 
  spacings       observed     expected
        0          67.       67.668
        1         140.      135.335
        2         133.      135.335
        3          86.       90.224
        4          56.       45.112
        5          13.       18.045
  6 to INF          5.        8.282
 Chisquare with  6 d.o.f. =     5.74 p-value=  .547552
  :::::::::::::::::::::::::::::::::::::::::
                   For a sample of size 500:     mean   
          lfsr_32.bin      using bits  9 to 32   1.994
  duplicate       number       number 
  spacings       observed     expected
        0          69.       67.668
        1         141.      135.335
        2         121.      135.335
        3         103.       90.224
        4          38.       45.112
        5          21.       18.045
  6 to INF          7.        8.282
 Chisquare with  6 d.o.f. =     5.39 p-value=  .505715
  :::::::::::::::::::::::::::::::::::::::::
   The 9 p-values were
        .180562   .413238   .036902   .164507   .124555
        .617280   .648904   .547552   .505715
  A KSTEST for the 9 p-values yields  .785416

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
           OPERM5 test for file lfsr_32.bin    
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom= 71.894; p-value= .018416
           OPERM5 test for file lfsr_32.bin    
     For a sample of 1,000,000 consecutive 5-tuples,
 chisquare for 99 degrees of freedom= 70.640; p-value= .013955
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
     :: This is the BINARY RANK TEST for 31x31 matrices. The leftmost ::      
     :: 31 bits of 31 random integers from the test sequence are used ::      
     :: to form a 31x31 binary matrix over the field {0,1}. The rank  ::      
     :: is determined. That rank can be from 0 to 31, but ranks< 28   ::      
     :: are rare, and their counts are pooled with those for rank 28. ::      
     :: Ranks are found for 40,000 such random matrices and a chisqua-::      
     :: re test is performed on counts for ranks 31,30,29 and <=28.   ::      
     :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::      
    Binary rank test for lfsr_32.bin    
         Rank test for 31x31 binary matrices:
        rows from leftmost 31 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        28       187     211.4  2.820192    2.820
        29        20    5134.0********** 5096.909
        30     19928   23103.0436.346039 5533.255
        31     19865   11551.5**********11516.351
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
    Binary rank test for lfsr_32.bin    
         Rank test for 32x32 binary matrices:
        rows from leftmost 32 bits of each 32-bit integer
      rank   observed  expected (o-e)^2/e  sum
        29       312     211.4 47.851814   47.852
        30         0    5134.0********** 5181.862
        31         1   23103.0**********28282.910
        32     39687   11551.5**********96811.094
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
         Binary Rank Test for lfsr_32.bin    
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  1 to  8
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          973       944.3        .872        .872
          r =5        21579     21743.9       1.251       2.123
          r =6        77448     77311.8        .240       2.363
                        p=1-exp(-SUM/2)= .69313
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  2 to  9
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1032       944.3       8.145       8.145
          r =5        21439     21743.9       4.275      12.420
          r =6        77529     77311.8        .610      13.030
                        p=1-exp(-SUM/2)= .99852
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  3 to 10
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1019       944.3       5.909       5.909
          r =5        21600     21743.9        .952       6.861
          r =6        77381     77311.8        .062       6.923
                        p=1-exp(-SUM/2)= .96862
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  4 to 11
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          960       944.3        .261        .261
          r =5        21580     21743.9       1.235       1.496
          r =6        77460     77311.8        .284       1.780
                        p=1-exp(-SUM/2)= .58945
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  5 to 12
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          995       944.3       2.722       2.722
          r =5        21526     21743.9       2.184       4.906
          r =6        77479     77311.8        .362       5.267
                        p=1-exp(-SUM/2)= .92818
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  6 to 13
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          949       944.3        .023        .023
          r =5        21669     21743.9        .258        .281
          r =6        77382     77311.8        .064        .345
                        p=1-exp(-SUM/2)= .15849
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  7 to 14
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          939       944.3        .030        .030
          r =5        21446     21743.9       4.081       4.111
          r =6        77615     77311.8       1.189       5.300
                        p=1-exp(-SUM/2)= .92935
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  8 to 15
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          953       944.3        .080        .080
          r =5        21623     21743.9        .672        .752
          r =6        77424     77311.8        .163        .915
                        p=1-exp(-SUM/2)= .36719
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits  9 to 16
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1011       944.3       4.711       4.711
          r =5        21461     21743.9       3.681       8.392
          r =6        77528     77311.8        .605       8.996
                        p=1-exp(-SUM/2)= .98887
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 10 to 17
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1004       944.3       3.774       3.774
          r =5        21435     21743.9       4.388       8.162
          r =6        77561     77311.8        .803       8.966
                        p=1-exp(-SUM/2)= .98870
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 11 to 18
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          953       944.3        .080        .080
          r =5        21537     21743.9       1.969       2.049
          r =6        77510     77311.8        .508       2.557
                        p=1-exp(-SUM/2)= .72154
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 12 to 19
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1003       944.3       3.649       3.649
          r =5        21423     21743.9       4.736       8.385
          r =6        77574     77311.8        .889       9.274
                        p=1-exp(-SUM/2)= .99031
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 13 to 20
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1009       944.3       4.433       4.433
          r =5        21643     21743.9        .468       4.901
          r =6        77348     77311.8        .017       4.918
                        p=1-exp(-SUM/2)= .91448
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 14 to 21
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          962       944.3        .332        .332
          r =5        21675     21743.9        .218        .550
          r =6        77363     77311.8        .034        .584
                        p=1-exp(-SUM/2)= .25321
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 15 to 22
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          995       944.3       2.722       2.722
          r =5        21662     21743.9        .308       3.030
          r =6        77343     77311.8        .013       3.043
                        p=1-exp(-SUM/2)= .78162
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 16 to 23
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          985       944.3       1.754       1.754
          r =5        21654     21743.9        .372       2.126
          r =6        77361     77311.8        .031       2.157
                        p=1-exp(-SUM/2)= .65991
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 17 to 24
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          970       944.3        .699        .699
          r =5        21729     21743.9        .010        .710
          r =6        77301     77311.8        .002        .711
                        p=1-exp(-SUM/2)= .29921
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 18 to 25
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          952       944.3        .063        .063
          r =5        21749     21743.9        .001        .064
          r =6        77299     77311.8        .002        .066
                        p=1-exp(-SUM/2)= .03250
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 19 to 26
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1048       944.3      11.388      11.388
          r =5        21534     21743.9       2.026      13.414
          r =6        77418     77311.8        .146      13.560
                        p=1-exp(-SUM/2)= .99886
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 20 to 27
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1026       944.3       7.068       7.068
          r =5        21612     21743.9        .800       7.869
          r =6        77362     77311.8        .033       7.901
                        p=1-exp(-SUM/2)= .98076
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 21 to 28
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          964       944.3        .411        .411
          r =5        21676     21743.9        .212        .623
          r =6        77360     77311.8        .030        .653
                        p=1-exp(-SUM/2)= .27856
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 22 to 29
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          971       944.3        .755        .755
          r =5        21601     21743.9        .939       1.694
          r =6        77428     77311.8        .175       1.869
                        p=1-exp(-SUM/2)= .60715
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 23 to 30
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4         1037       944.3       9.100       9.100
          r =5        21629     21743.9        .607       9.707
          r =6        77334     77311.8        .006       9.713
                        p=1-exp(-SUM/2)= .99222
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 24 to 31
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          962       944.3        .332        .332
          r =5        21492     21743.9       2.918       3.250
          r =6        77546     77311.8        .709       3.959
                        p=1-exp(-SUM/2)= .86189
        Rank of a 6x8 binary matrix,
     rows formed from eight bits of the RNG lfsr_32.bin    
     b-rank test for bits 25 to 32
                     OBSERVED   EXPECTED     (O-E)^2/E      SUM
          r<=4          882       944.3       4.110       4.110
          r =5        21732     21743.9        .007       4.117
          r =6        77386     77311.8        .071       4.188
                        p=1-exp(-SUM/2)= .87681
   TEST SUMMARY, 25 tests on 100,000 random 6x8 matrices
 These should be 25 uniform [0,1] random variables:
     .693134     .998519     .968622     .589446     .928180
     .158493     .929355     .367193     .988871     .988699
     .721538     .990313     .914479     .253212     .781621
     .659909     .299212     .032502     .998864     .980756
     .278558     .607147     .992224     .861889     .876813
   brank test summary for lfsr_32.bin    
       The KS test for those 25 supposed UNI's yields
                    KS p-value= .999997

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
 tst no  1:  141660 missing words,    -.58 sigmas from mean, p-value= .28010
 tst no  2:  141139 missing words,   -1.80 sigmas from mean, p-value= .03594
 tst no  3:  142204 missing words,     .69 sigmas from mean, p-value= .75443
 tst no  4:  141174 missing words,   -1.72 sigmas from mean, p-value= .04289
 tst no  5:  141526 missing words,    -.90 sigmas from mean, p-value= .18523
 tst no  6:  141548 missing words,    -.84 sigmas from mean, p-value= .19927
 tst no  7:  141478 missing words,   -1.01 sigmas from mean, p-value= .15678
 tst no  8:  142784 missing words,    2.04 sigmas from mean, p-value= .97950
 tst no  9:  141718 missing words,    -.45 sigmas from mean, p-value= .32743
 tst no 10:  142384 missing words,    1.11 sigmas from mean, p-value= .86629
 tst no 11:  141775 missing words,    -.31 sigmas from mean, p-value= .37682
 tst no 12:  142329 missing words,     .98 sigmas from mean, p-value= .83659
 tst no 13:  142345 missing words,    1.02 sigmas from mean, p-value= .84564
 tst no 14:  142914 missing words,    2.35 sigmas from mean, p-value= .99055
 tst no 15:  141289 missing words,   -1.45 sigmas from mean, p-value= .07362
 tst no 16:  142193 missing words,     .66 sigmas from mean, p-value= .74627
 tst no 17:  141946 missing words,     .09 sigmas from mean, p-value= .53414
 tst no 18:  142312 missing words,     .94 sigmas from mean, p-value= .82660
 tst no 19:  142246 missing words,     .79 sigmas from mean, p-value= .78425
 tst no 20:  141618 missing words,    -.68 sigmas from mean, p-value= .24804

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
 OPSO test for generator lfsr_32.bin              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OPSO for lfsr_32.bin     using bits 23 to 32        917050******* 1.0000
    OPSO for lfsr_32.bin     using bits 22 to 31        917048******* 1.0000
    OPSO for lfsr_32.bin     using bits 21 to 30        917062******* 1.0000
    OPSO for lfsr_32.bin     using bits 20 to 29        917064******* 1.0000
    OPSO for lfsr_32.bin     using bits 19 to 28        917063******* 1.0000
    OPSO for lfsr_32.bin     using bits 18 to 27        917064******* 1.0000
    OPSO for lfsr_32.bin     using bits 17 to 26        917072******* 1.0000
    OPSO for lfsr_32.bin     using bits 16 to 25        917061******* 1.0000
    OPSO for lfsr_32.bin     using bits 15 to 24        917054******* 1.0000
    OPSO for lfsr_32.bin     using bits 14 to 23        917059******* 1.0000
    OPSO for lfsr_32.bin     using bits 13 to 22        917063******* 1.0000
    OPSO for lfsr_32.bin     using bits 12 to 21        917062******* 1.0000
    OPSO for lfsr_32.bin     using bits 11 to 20        917048******* 1.0000
    OPSO for lfsr_32.bin     using bits 10 to 19        917041******* 1.0000
    OPSO for lfsr_32.bin     using bits  9 to 18        917050******* 1.0000
    OPSO for lfsr_32.bin     using bits  8 to 17        917050******* 1.0000
    OPSO for lfsr_32.bin     using bits  7 to 16        917049******* 1.0000
    OPSO for lfsr_32.bin     using bits  6 to 15        917044******* 1.0000
    OPSO for lfsr_32.bin     using bits  5 to 14        917052******* 1.0000
    OPSO for lfsr_32.bin     using bits  4 to 13        917067******* 1.0000
    OPSO for lfsr_32.bin     using bits  3 to 12        917063******* 1.0000
    OPSO for lfsr_32.bin     using bits  2 to 11        917063******* 1.0000
    OPSO for lfsr_32.bin     using bits  1 to 10        917067******* 1.0000
 OQSO test for generator lfsr_32.bin              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
    OQSO for lfsr_32.bin     using bits 28 to 32        141597 -1.059  .1449
    OQSO for lfsr_32.bin     using bits 27 to 31        142336  1.446  .9260
    OQSO for lfsr_32.bin     using bits 26 to 30        141964   .185  .5735
    OQSO for lfsr_32.bin     using bits 25 to 29        141250 -2.235  .0127
    OQSO for lfsr_32.bin     using bits 24 to 28        142293  1.301  .9033
    OQSO for lfsr_32.bin     using bits 23 to 27        142182   .924  .8223
    OQSO for lfsr_32.bin     using bits 22 to 26        141956   .158  .5629
    OQSO for lfsr_32.bin     using bits 21 to 25        141870  -.133  .4470
    OQSO for lfsr_32.bin     using bits 20 to 24        141791  -.401  .3442
    OQSO for lfsr_32.bin     using bits 19 to 23        142205  1.002  .8419
    OQSO for lfsr_32.bin     using bits 18 to 22        142225  1.070  .8577
    OQSO for lfsr_32.bin     using bits 17 to 21        141646  -.893  .1860
    OQSO for lfsr_32.bin     using bits 16 to 20        141445 -1.574  .0577
    OQSO for lfsr_32.bin     using bits 15 to 19        141693  -.733  .2317
    OQSO for lfsr_32.bin     using bits 14 to 18        141791  -.401  .3442
    OQSO for lfsr_32.bin     using bits 13 to 17        141816  -.316  .3759
    OQSO for lfsr_32.bin     using bits 12 to 16        141686  -.757  .2245
    OQSO for lfsr_32.bin     using bits 11 to 15        142200   .985  .8378
    OQSO for lfsr_32.bin     using bits 10 to 14        141829  -.272  .3927
    OQSO for lfsr_32.bin     using bits  9 to 13        142033   .419  .6625
    OQSO for lfsr_32.bin     using bits  8 to 12        141695  -.727  .2338
    OQSO for lfsr_32.bin     using bits  7 to 11        141488 -1.428  .0766
    OQSO for lfsr_32.bin     using bits  6 to 10        141982   .246  .5973
    OQSO for lfsr_32.bin     using bits  5 to  9        141665  -.828  .2038
    OQSO for lfsr_32.bin     using bits  4 to  8        142030   .409  .6588
    OQSO for lfsr_32.bin     using bits  3 to  7        142102   .653  .7432
    OQSO for lfsr_32.bin     using bits  2 to  6        141883  -.089  .4644
    OQSO for lfsr_32.bin     using bits  1 to  5        141517 -1.330  .0918
  DNA test for generator lfsr_32.bin              
  Output: No. missing words (mw), equiv normal variate (z), p-value (p)
                                                           mw     z     p
     DNA for lfsr_32.bin     using bits 31 to 32        141598  -.918  .1792
     DNA for lfsr_32.bin     using bits 30 to 31        141557 -1.039  .1493
     DNA for lfsr_32.bin     using bits 29 to 30        142383  1.397  .9188
     DNA for lfsr_32.bin     using bits 28 to 29        142156   .728  .7666
     DNA for lfsr_32.bin     using bits 27 to 28        142617  2.088  .9816
     DNA for lfsr_32.bin     using bits 26 to 27        141979   .206  .5814
     DNA for lfsr_32.bin     using bits 25 to 26        141642  -.789  .2152
     DNA for lfsr_32.bin     using bits 24 to 25        141549 -1.063  .1439
     DNA for lfsr_32.bin     using bits 23 to 24        142191   .831  .7970
     DNA for lfsr_32.bin     using bits 22 to 23        141910   .002  .5008
     DNA for lfsr_32.bin     using bits 21 to 22        142362  1.335  .9091
     DNA for lfsr_32.bin     using bits 20 to 21        141622  -.848  .1983
     DNA for lfsr_32.bin     using bits 19 to 20        141821  -.261  .3972
     DNA for lfsr_32.bin     using bits 18 to 19        141905  -.013  .4949
     DNA for lfsr_32.bin     using bits 17 to 18        141996   .256  .6009
     DNA for lfsr_32.bin     using bits 16 to 17        141794  -.340  .3669
     DNA for lfsr_32.bin     using bits 15 to 16        141336 -1.691  .0454
     DNA for lfsr_32.bin     using bits 14 to 15        142027   .347  .6357
     DNA for lfsr_32.bin     using bits 13 to 14        141944   .102  .5407
     DNA for lfsr_32.bin     using bits 12 to 13        142075   .489  .6875
     DNA for lfsr_32.bin     using bits 11 to 12        140993 -2.703  .0034
     DNA for lfsr_32.bin     using bits 10 to 11        141919   .029  .5114
     DNA for lfsr_32.bin     using bits  9 to 10        141657  -.744  .2283
     DNA for lfsr_32.bin     using bits  8 to  9        142346  1.288  .9011
     DNA for lfsr_32.bin     using bits  7 to  8        141672  -.700  .2419
     DNA for lfsr_32.bin     using bits  6 to  7        141388 -1.538  .0620
     DNA for lfsr_32.bin     using bits  5 to  6        141878  -.092  .4632
     DNA for lfsr_32.bin     using bits  4 to  5        142277  1.085  .8609
     DNA for lfsr_32.bin     using bits  3 to  4        141604  -.901  .1839
     DNA for lfsr_32.bin     using bits  2 to  3        141669  -.709  .2392
     DNA for lfsr_32.bin     using bits  1 to  2        141569 -1.004  .1577

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
   Test results for lfsr_32.bin    
 Chi-square with 5^5-5^4=2500 d.of f. for sample size:2560000
                               chisquare  equiv normal  p-value
  Results fo COUNT-THE-1's in successive bytes:
 byte stream for lfsr_32.bin     11361.54    125.321     1.000000
 byte stream for lfsr_32.bin     11554.59    128.051     1.000000

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
           bits  1 to  8  2591.55      1.295      .902281
           bits  2 to  9  2507.74       .110      .543603
           bits  3 to 10  2453.05      -.664      .253359
           bits  4 to 11  2643.84      2.034      .979031
           bits  5 to 12  2561.58       .871      .808090
           bits  6 to 13  2842.33      4.841      .999999
           bits  7 to 14  2706.31      2.918      .998237
           bits  8 to 15  2804.83      4.311      .999992
           bits  9 to 16  2574.46      1.053      .853847
           bits 10 to 17  2693.25      2.733      .996862
           bits 11 to 18  2761.76      3.702      .999893
           bits 12 to 19  2621.51      1.718      .957139
           bits 13 to 20  2692.88      2.728      .996811
           bits 14 to 21  2757.52      3.642      .999865
           bits 15 to 22  2597.16      1.374      .915290
           bits 16 to 23  2598.20      1.389      .917557
           bits 17 to 24  2477.22      -.322      .373656
           bits 18 to 25  2601.82      1.440      .925056
           bits 19 to 26  2608.99      1.541      .938379
           bits 20 to 27  2681.40      2.565      .994846
           bits 21 to 28  2715.31      3.045      .998836
           bits 22 to 29  2533.27       .470      .681001
           bits 23 to 30  2650.45      2.128      .983321
           bits 24 to 31  2766.87      3.774      .999920
           bits 25 to 32  2711.23      2.987      .998593

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
           CDPARK: result of ten tests on file lfsr_32.bin    
            Of 12,000 tries, the average no. of successes
                 should be 3523 with sigma=21.9
            Successes: 3494    z-score: -1.324 p-value: .092718
            Successes: 3540    z-score:   .776 p-value: .781201
            Successes: 3514    z-score:  -.411 p-value: .340551
            Successes: 3467    z-score: -2.557 p-value: .005278
            Successes: 3478    z-score: -2.055 p-value: .019949
            Successes: 3502    z-score:  -.959 p-value: .168804
            Successes: 3541    z-score:   .822 p-value: .794438
            Successes: 3522    z-score:  -.046 p-value: .481790
            Successes: 3506    z-score:  -.776 p-value: .218799
            Successes: 3501    z-score: -1.005 p-value: .157553

           square size   avg. no.  parked   sample sigma
             100.            3506.500       22.754
            KSTEST for the above 10: p=  .968496

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
              for random integers in the file lfsr_32.bin    
     Sample no.    d^2     avg     equiv uni            
           5     .0001    .0021     .000120
          10     .0006    .0015     .000635
          15     .0021    .0020     .002100
          20     .0019    .0020     .001939
          25     .0006    .0018     .000580
          30     .0142    .0030     .014188
          35     .0003    .0026     .000302
          40     .0009    .0024     .000952
          45     .0002    .0025     .000224
          50     .0006    .0026     .000632
          55     .0009    .0025     .000945
          60     .0153    .0026     .015222
          65     .0002    .0025     .000240
          70     .0584    .0033     .057017
          75     .0091    .0032     .009153
          80     .0007    .0031     .000725
          85     .0001    .0029     .000058
          90     .0012    .0031     .001231
          95     .0000    .0033     .000011
         100     .0006    .0032     .000590
     MINIMUM DISTANCE TEST for lfsr_32.bin    
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
               The 3DSPHERES test for file lfsr_32.bin    
 sample no:  1     r^3=  28.142     p-value= .60861
 sample no:  2     r^3=   1.001     p-value= .03280
 sample no:  3     r^3=  17.474     p-value= .44148
 sample no:  4     r^3=  60.305     p-value= .86603
 sample no:  5     r^3=   3.998     p-value= .12477
 sample no:  6     r^3=  30.525     p-value= .63851
 sample no:  7     r^3=    .874     p-value= .02870
 sample no:  8     r^3=  21.156     p-value= .50599
 sample no:  9     r^3=  90.443     p-value= .95094
 sample no: 10     r^3= 117.180     p-value= .97988
 sample no: 11     r^3=  20.780     p-value= .49976
 sample no: 12     r^3=   1.601     p-value= .05197
 sample no: 13     r^3=   4.850     p-value= .14928
 sample no: 14     r^3=   4.517     p-value= .13977
 sample no: 15     r^3=  28.351     p-value= .61134
 sample no: 16     r^3=  46.587     p-value= .78837
 sample no: 17     r^3=  16.242     p-value= .41807
 sample no: 18     r^3=  35.065     p-value= .68927
 sample no: 19     r^3=   8.956     p-value= .25810
 sample no: 20     r^3=    .179     p-value= .00596
  A KS test is applied to those 20 p-values.
---------------------------------------------------------
       3DSPHERES test for file lfsr_32.bin          p-value= .684407
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
            RESULTS OF SQUEEZE TEST FOR lfsr_32.bin    
         Table of standardized frequency counts
     ( (obs-exp)/sqrt(exp) )^2
        for j taking values <=6,7,8,...,47,>=48:
     -.8     -.3     1.1    -1.1     -.4      .8
     1.8      .9     -.3      .7      .5     -.6
      .2      .6     -.9      .0     -.1     -.9
      .2      .1     -.9     1.6     -.7      .6
    -1.2     -.5     1.8     -.9      .5      .8
      .8     -.8      .0    -1.8     1.2    -1.4
     -.9     -.4     1.3     -.1     1.6    -1.0
    -1.1
           Chi-square with 42 degrees of freedom: 37.269
              z-score=  -.516  p-value= .321273
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
                Test no.  1      p-value  .692218
                Test no.  2      p-value  .231208
                Test no.  3      p-value  .492401
                Test no.  4      p-value  .303045
                Test no.  5      p-value  .345245
                Test no.  6      p-value  .368841
                Test no.  7      p-value  .122864
                Test no.  8      p-value  .956868
                Test no.  9      p-value  .646093
                Test no. 10      p-value  .193895
   Results of the OSUM test for lfsr_32.bin    
        KSTEST on the above 10 p-values:  .380410

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
           The RUNS test for file lfsr_32.bin    
     Up and down runs in a sample of 10000
_________________________________________________ 
                 Run test for lfsr_32.bin    :
       runs up; ks test for 10 p's: .453286
     runs down; ks test for 10 p's: .221529
                 Run test for lfsr_32.bin    :
       runs up; ks test for 10 p's: .469476
     runs down; ks test for 10 p's: .013767

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
                Results of craps test for lfsr_32.bin    
  No. of wins:  Observed Expected
                                99104    98585.86
                  99104= No. of wins, z-score= 2.317 pvalue= .98976
   Analysis of Throws-per-Game:
 Chisq=  19.98 for 20 degrees of freedom, p=  .54102
               Throws Observed Expected  Chisq     Sum
                  1    67208    66666.7   4.396    4.396
                  2    37422    37654.3   1.433    5.829
                  3    26991    26954.7    .049    5.878
                  4    19311    19313.5    .000    5.878
                  5    13683    13851.4   2.048    7.926
                  6     9994     9943.5    .256    8.182
                  7     7021     7145.0   2.153   10.335
                  8     5011     5139.1   3.192   13.526
                  9     3668     3699.9    .274   13.801
                 10     2671     2666.3    .008   13.809
                 11     1980     1923.3   1.670   15.479
                 12     1405     1388.7    .190   15.669
                 13     1016     1003.7    .150   15.820
                 14      691      726.1   1.701   17.520
                 15      538      525.8    .281   17.802
                 16      368      381.2    .454   18.255
                 17      278      276.5    .008   18.263
                 18      190      200.8    .584   18.847
                 19      156      146.0    .687   19.534
                 20      113      106.2    .433   19.968
                 21      285      287.1    .016   19.983
            SUMMARY  FOR lfsr_32.bin    
                p-value for no. of wins: .989760
                p-value for throws/game: .541025

$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$$

 Results of DIEHARD battery of tests sent to file lfsr_32.res    
