#include "extractor.h"
#include <stdio.h>

int main() {
  uint32_t a;
  scanf("%d", &a);
  uint32_t mantissa = get_mantissa(a);
  uint32_t exponent = get_exponent(a);
  printf("%d\n", mantissa);
  printf("%d\n", exponent);
  return 0;
}