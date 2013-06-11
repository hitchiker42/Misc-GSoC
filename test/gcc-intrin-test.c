#include <x86intrin.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>
typedef float v4sf __attribute__ ((vector_size (16)));
typedef float v4si __attribute__ ((vector_size (16)));
#define builtin __builtin_ia32;
typedef struct {
  float* val;
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
    n=__builtin_ia32_mulps(m,n);
    v4sf m=__builtin_ia32_loadups(A+i+4);
    l=__builtin_ia32_mulps(m,l);
    m=__builtin_ia32_haddps(n,l);
    ans+=m[0]+m[1]+m[2]+m[3];
  }
  return ans;
}

matrix make_matrix_seq(int start,int end,int M,int N){
  float* mat=malloc(N*M*sizeof(float));
  int i,j,k=0;
  for (i=0;i<M;i++){
    for (j=0;j<N;j++){
      mat[i*N+j]=(start+k++)%end;
    }
  }
}

void v4sf_matrix_multiply (matrix A,matrix B,matrix C){
  assert(A.N%4==0 && A.M%4==0 && B.N%4==0 && B.M==A.N);
  assert(C.M==A.M && C.N==B.N);
  int i,j,k;
  for (i=0;i<A.M;i++){//loop over rows of A
    for(j=0;j<B.N;j++){//loop over columns B
      C.val[i*B.N+j]=v4sf_dot(A.val+(i*A.M),B.val+j,A.M,B.N);
    }
  }
}
    
v4sf test(float a1,float a2,float a3,float a4,float* b1234){
  v4sf a={a1,a2,a3,a4};
  v4sf b=__builtin_ia32_loadups(b1234);
  v4sf c={9.,10.,11.,12.};
  v4sf d={13.,14.,15.,16.};
  a=__builtin_ia32_mulps(a,b);
  b=__builtin_ia32_mulps(a,b);
  c=__builtin_ia32_mulps(b,c);
  d=__builtin_ia32_mulps(c,d);
  return d;
}
void main(){
  float x[4]={1,2,3,4};
  v4sf y=test(5,6,7,8,x);
  printf("%f,%f,%f,%f\n",y[0],y[1],y[2],y[3]);
}
void mat_mult (matrix A,matrix B,matrix C){
  int i,j,k;
  assert(A.N==B.M && C.M==A.M && C.N==B.N);
  for (i=0;i<A.M;i++){
    for (j=0;j<B.N;j++){
      for (k=0;k<A.N/*A.N==B.M*/;k++){
        C.val[i*A.M+j]+=A.val[(i*A.N)+k]*B.val[(k*B.N)+j];
      }
    }
  }
}
void mat_mult_v4sf (matrix A,matrix B,matrix C){
  int i,j,k;
  v4sf x,y,z;
  assert(A.N==B.M && C.M==A.M && C.N==B.N);
  assert(A.N%4==0 && B.N%4==0 && A.M%4==0);
  for (i=0;i<A.M;i++){
    for (j=0;j<B.N;j++){
      for(k=0;k<A.N;k+=4){
        v4sf x=__builtin_ia32_loadups((A.val+(i*A.N)+k));
        v4sf y={*(B.val+(k*B.N)+j),*(B.val+((k+1)*B.N)+j),
                *(B.val+((k+2)*B.N)+j),*(B.val+((k+3)*B.N)+j)};
        v4sf z=__builtin_ia32_mulps(x,y);
        C.val[i*A.M+j]+=(z[0]+z[1]+z[2]+z[3]);
      }
    }
  }
}
int compare(){
  v4sf a={1,2,3,4},b={2,1,3,4};
  v4si c=__builtin_ia32_cmpeqps   (a,b) ;
  v4si d=__builtin_ia32_cmpltps   (a,b); 
  v4si e=__builtin_ia32_cmpleps   (a,b); 
  v4si f=__builtin_ia32_cmpgtps   (a,b); 
  v4si g=__builtin_ia32_cmpgeps   (a,b); 
  v4si h=__builtin_ia32_cmpunordps(a,b); 
  v4si i=__builtin_ia32_cmpneqps  (a,b); 
  v4si k=__builtin_ia32_cmpnltps  (a,b); 
  v4si j=__builtin_ia32_cmpnleps  (a,b); 
  v4si l=__builtin_ia32_cmpngtps  (a,b); 
  v4si m=__builtin_ia32_cmpngeps  (a,b); 
  v4si n=__builtin_ia32_cmpordps  (a,b); 
  v4si o=__builtin_ia32_cmpeqss   (a,b); 
  v4si p=__builtin_ia32_cmpltss   (a,b); 
  v4si q=__builtin_ia32_cmpless   (a,b); 
  v4si r=__builtin_ia32_cmpunordss(a,b); 
  v4si s=__builtin_ia32_cmpneqss  (a,b); 
  int t=__builtin_ia32_cmpnlts   (a,b); 
  v4si u=__builtin_ia32_cmpnless  (a,b); 
  v4si v=__builtin_ia32_cmpordss  (a,b);  
  return 5;
}

