#include <x86intrin.h>
#include <stdlib.h>
#include <stdio.h>
typedef float v4sf __attribute__ ((vector_size (16)));
#define builtin __builtin_ia32;
typedef struct {
  float* vals;
  int M;//rows
  int N;//columns
} matrix;
float v4sf_dot (float* A,float* B,int len,int bstep){
  int i;
  v4sf m;
  float ans=0;
  for(i=0;i<len;i+=8){
    m=__builtin_ia32_loadups(A+i);
    v4sf n={*(B+i*bstep),*(B+(i+1)*bstep),*(B+(i+2)*bstep),*(B+(i+3)*bstep)};
    v4sf l={*(B+(i+4)*bstep),*(B+(i+5)*bstep),*(B+(i+6)*bstep),*(B+(i+7)*bstep)};
    n=__builtin_ia32_mulss(m,n);
    m=__builtin_ia32_loadups(A+i+4);
    l=__builtin_ia32_mulss(m,l);
    m=__builtin_ia32_haddps(n,l);
    ans+=m[0]+m[1]+m[2]+m[3];
  }
  return ans;
}

    
  /*
void v4sf_matrix_multiply (matrix A,matrix B,matrix C){
  //assert N%4=0,M%4=0,L%4=0
  int M=A.M;//also C.M
  int N=A.N;//also B.M
  int L=B.N;//also C.N
  int i,j,k;
  for (i=0;i<M;i++){//loop over rows of A
    for(j=0;j<N;j+=4){//loop over columns of A/rows of B
    for(k=0;k<L;k++){*/
    
v4sf test(float a1,float a2,float a3,float a4,float* b1234){
  v4sf a={a1,a2,a3,a4};
  v4sf b=__builtin_ia32_loadups(b1234);
  v4sf c={9.,10.,11.,12.};
  v4sf d={13.,14.,15.,16.};
  v4sf e={0,0,0,0};
  a=__builtin_ia32_mulss(a,b);
  b=__builtin_ia32_mulss(a,b);
  c=__builtin_ia32_mulss(b,c);
  e=__builtin_ia32_mulss(c,d);
  return e;
}
void main(){
  float x[4]={1,2,3,4};
  v4sf y=test(5,6,7,8,x);
  printf("%f,%f,%f,%f",y[0],y[1],y[2],y[3]);
}
