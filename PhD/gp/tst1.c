/* 
 * Random number generation test
 */

typedef unsigned long RandType;

RandType  r = 260158;

#define BIT64  0x80000000
#define BIT63  0x40000000
#define BIT5   0x00000000
#define BIT2   0x00000000

RandType rnd(void)
{
  int      b;
  RandType m1, m2, m3, m4, m5;
  m1 = r & BIT64;  
  m1 >>= 31;
  m2 = r & BIT63;
  m2 >>= 30;
  m3 = r & 0x00001000;
  m3 >>= 4;
  m4 = r & BIT2;
  m4 >>= 1;
  b = m1^m2^m3^m4^m5;
  r <<= 1;
  printf("m1=%ld, m2=%d, m3=%d, m4=%d, b=%d r=%d\n", m1, m2, m3, m4, b, r);


}

int main(int argc, char ** argv) 
{
  rnd();
}
