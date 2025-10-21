#include "fp_func.h"
#include <stdio.h>

int main() {
  uint32_t a, b, result;
  scanf("%d %d", &a, &b);
  result = fp_func(a, b);
  printf("%d\n", result);
  return 0;
}
