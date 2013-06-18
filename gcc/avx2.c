#include <x86intrin.h>
#include <stdio.h>
typedef int v8si __attribute__ ((__vector_size__ (32)));
v8si add(int* a,int* b){
  v8si x = {a[0],a[1],a[2],a[3],a[4],a[5],a[6],a[7]};
  v8si y = {b[0],b[1],b[2],b[3],b[4],b[5],b[6],b[7]};
  return __builtin_ia32_paddd256(x,y);
}
void main(){
  int a[8]={1,2,3,4,5,6,7,8};
  int b[8]={9,10,11,12,13,14,15,16};
  v8si x = add(a,b);
  printf("|%d|%d|%d|%d|%d|%d|%d|%d|/n",x[0],x[1],x[2],x[3],x[4],x[5],x[6],x[7]);
}
