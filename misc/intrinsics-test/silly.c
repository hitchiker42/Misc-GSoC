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
int main(){
  long x = silly_loop();
  printf("%ld\n",x);
}
