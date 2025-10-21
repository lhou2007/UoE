#include "accumulator.h"
#include <stdio.h>

int main() {
  int a[10];
  for (int i = 0; i < 10; i++) {
    scanf("%d", &a[i]);
  }
  int result = int_accum(a);
  printf("%d\n", result);
  return 0;
}
