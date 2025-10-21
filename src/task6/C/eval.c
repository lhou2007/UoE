#include "multiplier.h"
#include <stdio.h>

int main() {
  uint32_t a, b, result;
  scanf("%d %d", &a, &b);
  result = fp_mult(a, b);
  printf("%d\n", result);
  return 0;
}
