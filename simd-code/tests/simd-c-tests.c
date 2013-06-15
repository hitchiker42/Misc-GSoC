
#include <x86intrin.h>
#include <stdio.h>
#include <sys/time.h>
#define v4sf __v4sf
#define timer(_start,now)   gettimeofday(&now,NULL);                    \
  printf("Time since start: %d.%d\n",(now.tv_sec - _start.tv_sec),      \
         (now.tv_usec - _start.tv_usec));
double silly_loop_vector(float stop){
  double x=0;
  float i=0.,j=1.,k=2.,l=3.;
  while(l<stop){
    v4sf a={i,j,k,l};
    v4sf b={i,j,k,l};
    a=__builtin_ia32_addps(a,b);
    x+=a[0]+a[1]+a[2]+a[3];
    i+=4.;j+=4.;k+=4.;l+=4.;
  }
}
double silly_loop(float stop){
  double x=0.;
  float i;
  for(i=0;i<stop;i++){
    x+=i;
    x+=i;
  }
}
void main(){
  struct timeval start={0,0};
  struct timeval now={0,0};
  gettimeofday(&start,NULL);
  printf("Silly Loop with SMID\n");
  silly_loop_vector(10000000.);
  timer(start,now);
  printf("Silly Loop without SMID\n");
  silly_loop(10000000.);
  timer(start,now);
}
