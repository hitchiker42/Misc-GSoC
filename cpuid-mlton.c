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
    sse4_2=0x100000,//bit 20=sse4_2
    sse4_1=0xc0000,//bit 19=sse4_1
    ssse3=0x200,//bit 9=ssse3
    sse3=0x1,//bit 0=sse3
    //edx:
    sse2=0x4000000,//bit 26=sse2
    sse=0x2000000,//bit 25=sse
    mmx=0x800000;//bit 23=mmx
  unsigned int simd[13]={mmx,fxsave,sse,sse2,sse3,ssse3,sse4_1,sse4_2,
  aes,osxsave,avx,fma};*/
  unsigned char flags[11]={0x80,0x2,0x4,0x1,0x2,0x8,0x16,0x8,0x10,0x10};
  flags[0]&=edx.bytes[2];
  flags[1]&=edx.bytes[3];
  flags[2]&=edx.bytes[3];
  flags[3]&=ecx.bytes[0];
  flags[4]&=ecx.bytes[1];
  flags[5]&=ecx.bytes[2];
  flags[6]&=ecx.bytes[2];
  flags[7]&=ecx.bytes[3];
  flags[8]&=ecx.bytes[3];
  flags[9]&=ecx.bytes[1];
  if(flags[0]){printf("MMX=1\n");}else{printf("MMX=0\n");}
  if(flags[1]){printf("SSE=1\n");}else{printf("SSE=0\n");}
  if(flags[2]){printf("SSE2=1\n");}else{printf("SSE2=0\n");}
  if(flags[3]){printf("SSE3=1\n");}else{printf("SSE3=0\n");}
  if(flags[4]){printf("SSSE3=1\n");}else{printf("SSSE3=0\n");}
  if(flags[5]){printf("SSE4.1=1\n");}else{printf("SSE4.1=0\n");}
  if(flags[6]){printf("SSE4.2=1\n");}else{printf("SSE4.2=0\n");}
  if(flags[7]){
    if(flags[8]){printf("AVX=1\n");
      if(flags[9]){printf("FMA=1\n");}
    } else {printf("FMA=0\n");}
  } else{printf("AVX=0\n");printf("FMA=0\n");}
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
  features();
  return 0;
}
