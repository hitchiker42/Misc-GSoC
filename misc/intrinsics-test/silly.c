#include <x86intrin.h>
int silly_loop(){
  int i,n = 1000000,ans=0;
  for(i=0;i<n;i++){
    ans+=i;
  }
  return ans;
}

int silly_loop_vec(){
  int i,n=1000000,ans=0;
}
