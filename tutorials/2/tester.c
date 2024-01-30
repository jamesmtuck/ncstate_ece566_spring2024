#include <stdio.h>

extern "C" {
int fun(int a, int b, int c, int d, int e, int f, int g, int h);
}

int main() {
  printf("Called fun(0,1,2,3,4,5,6,7,8)=%d!",fun(0,1,2,3,4,5,6,7));
  return 0;
}
