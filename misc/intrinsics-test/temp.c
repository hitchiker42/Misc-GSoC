#include <x86intrin.h>
__m128i intel(){
  const int a[4]={10,20,30,40};
  const int b[4]={50,60,70,80};
  __m128i c = _mm_loadu_si128((__m128i*)a);
  __m128i d = _mm_loadu_si128((__m128i*)b);
  __m128i e = _mm_add_epi32(c,d);
  return e;
  /*  __m128i x = _mm_set_epi32(1,2,3,4);
  __m128i y = _mm_set_epi32(5,6,7,8);
  __m128i z = _mm_add_epi32(x,y);*/
}
__v4si gcc(){
  __v4si x = {1,2,3,4};
  __v4si y = {5,6,7,8};
  __v4si z = _mm_add_epi32(x,y);
  return z;
}
