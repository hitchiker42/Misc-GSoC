#include <x86intrin.h>
#include <stdio.h>
long silly_loop(){
  int i,n = 1000000000;
  long ans=0;
  for(i=0;i<n;i++){
    ans+=i;
    ans-=i/2;
  }
  return ans;
}
double silly_loop_fp(){
  float i,n=1000000000.0;
  double ans=0.0;
  for(i=0.0;i<n;i+=1.0){
    ans+=i;
  }
  return ans;
}
double silly_loop_inc(){
  double i,n=10000000.0;
  double ans=0.0;
  for(i=0.0;i<n;i+=0.1){
    ans+=1;
  } 
  return ans;
}
double silly_loop_simd(){
  double n=1000000000.0,i;
  __m128d ans=_mm_setr_pd(0.0,1.0);
  __m128d inc=_mm_setr_pd(5.0,5.0);
  for(i=0;i<n;i+=10){
    ans=_mm_add_pd(ans,inc);
  }
  return ans[0]+ans[1];
}

int main(){
  double x = silly_loop_simd();
  printf("%lf\n",x);
}
