#include <stdio.h>
#include <ctype.h>
 
void cpuid(unsigned info, unsigned *eax, unsigned *ebx, unsigned *ecx, unsigned *edx)
{
    __asm__(
        "xchg %%ebx, %%edi;" /* 32bit PIC: don't clobber ebx */
        "cpuid;"
        "xchg %%ebx, %%edi;"
        :"=a" (*eax), "=D" (*ebx), "=c" (*ecx), "=d" (*edx)
        :"0" (info)
    );
}
void features(){
  typedef union{
    unsigned int name;
    unsigned char bytes[4];
  } reg;
  //unsigned int eax,ebx,ecx,edx;
  reg eax,ebx,ecx,edx;
  cpuid(1,&eax.name,&ebx.name,&ecx.name,&edx.name);
  //w/lsb=31->msb=0
  //in  ecx:
  /*    unsigned int 
    fma=0x1000,//bit 12=fma
    avx=0x10000000,//bit 28=avx
    // if avx supported; cpuid eax=07h,ecx=0h check bit 5 of ebx
    osxsave=0xc000000,//  bit 27=osxsave
    aes=0x2000000,//bit 25=aes
    sse4_2=0x100000,//bit 20=sse4_2
    sse4_1=0xc0000,//bit 19=sse4_1
    ssse3=0x200,//bit 9=ssse3
    sse3=0x1,//bit 0=sse3
    //edx:
    sse2=0x4000000,//bit 26=sse2
    sse=0x2000000,//bit 25=sse
    fxsave=0x1000000,//bit 24=fxsave(check before any sse stuff)
    mmx=0x800000;//bit 23=mmx
  unsigned int simd[13]={mmx,fxsave,sse,sse2,sse3,ssse3,sse4_1,sse4_2,
  aes,osxsave,avx,fma};*/
  unsigned char flags[12]={0x80,0x1,0x2,0x4,0x1,0x2,0x8,0x16,0x2,0x8,0x10,0x10};
  flags[0]&=edx.bytes[2];
  flags[1]&=edx.bytes[3];
  flags[2]&=edx.bytes[3];
  flags[3]&=edx.bytes[3];
  flags[4]&=ecx.bytes[0];
  flags[5]&=ecx.bytes[1];
  flags[6]&=ecx.bytes[2];
  flags[7]&=ecx.bytes[2];
  flags[8]&=ecx.bytes[3];
  flags[9]&=ecx.bytes[3];
  flags[10]&=ecx.bytes[3];
  flags[11]&=ecx.bytes[1];
  printf("mmx: %hhx, fxsave: %hhx, sse: %hhx, sse2:%hhx\n"
         "sse3: %hhx, ssse3: %hhx, sse4.1: %hhx, sse4.2: %hhx\n"
         "aes: %hhx, osxsave: %hhx, avx: %hhx, fma: %hhx\n",flags[0],
         flags[1],flags[2],flags[3],flags[4],flags[5],flags[6],flags[7],
         flags[8],flags[9],flags[10],flags[11]);
}

void print_cpuid()
{
  unsigned int eax, ebx, ecx, edx;
  int i;
 
  for (i = 0; i < 6; ++i)
  {
    cpuid(i, &eax, &ebx, &ecx, &edx);
    printf("eax=%i: %#010x %#010x %#010x %#010x\n", i, eax, ebx, ecx, edx);
  }
}
int main(){
  print_cpuid();
  features();
  return 0;
}
