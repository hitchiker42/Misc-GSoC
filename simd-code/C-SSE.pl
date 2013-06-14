use 5.16.0;
open(my $file,">","C-SSE.c") || die "can't open > C-SSE.c $!";
print $file <<END;
#include <x86intrin.h>
#include <stdlib.h>
#ifdef _XMMINTRIN_H_INCLUDED
typedef float v4sf __attribute__ ((__vector_size__ (16)));
END
for my $i ("addps","subps","mulps","divps") {
    print $file <<END;
float* ${i}(float *arg1,float* arg2,float* retval){
  v4sf x = __builtin_ia32_loadups(arg1);
  v4sf y = __builtin_ia32_loadups(arg2);
  __builtin_ia32_storeups(retval,__builtin_ia32_${i}(x,y));
  return retval;
}
END
};
print $file "#endif\n";
