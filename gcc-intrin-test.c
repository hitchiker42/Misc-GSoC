#include <x86intrin.h>
#include <stdlib.h>
/*typedef struct {
  float* vals;
  int M;//rows
  int N;//columns
} matrix;
void v4sf_dot (float* A,float* B,int len,int bstep){
  int i;
  v4sf m,n,l;
  float ans=0;
  for(i=0;i<len;i+=8){
    m=__builtin_ia32_loadaps(*(A+i));
    n={*(B+(i*bstep)),*(B+((i+1)*bstep)),*(B+((i+2)*bstep)),*(B+((i+3)*bstep))};
    l={*(B+((i+4)*bstep)),*(B+((i+5)*bstep)),*(B+((i+6)*bstep)),*(B+((i+7)*bstep))};
    

void v4sf_matrix_multiply (matrix A,matrix B,matrix C){
  //assert N%4=0,M%4=0,L%4=0
  int M=A.M;//also C.M
  int N=A.N;//also B.M
  int L=B.N;//also C.N
  int i,j,k;
  for (i=0;i<M;i++){//loop over rows of A
    for(j=0;j<N;j+=4){//loop over columns of A/rows of B
    for(k=0;k<L;k++){*/
    
void test(){
  v4sf a,b,c,d;
  a={1,2,3,4};
  b={5,6,7,8};
  
