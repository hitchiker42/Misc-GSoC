#include <math.h>
void addss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]+arg2[i];
  }
}/*
(defun c-scalar (name op)
  (insert (format 
"\nvoid %s(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]%sarg2[i];
  }
}\n" name op)))*/
void subss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]-arg2[i];
  }
}
(c-scalar "andnss" "&!")
void maxss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]>arg2[i]?arg1[i]:sarg2[i];
  }
}
void sqrtss(float* arg1,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=sqrt(arg1[i]);
  }
}
void rcpss(float* arg1,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=1/arg1[i];
  }
}
void minss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]<arg2[i]?arg1[i]:sarg2[i];
  }
}
void andnss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]&!arg2[i];
  }
}

void orss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]|arg2[i];
  }
}

void xorss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]^arg2[i];
  }
}

void andss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]&arg2[i];
  }
}

void divss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]/arg2[i];
  }
}

void mulss(float* arg1,float* arg2,float* retval){
  int i;
  for (i=0,i<4,i++){
    retval[i]=arg1[i]*arg2[i];
  }
}
