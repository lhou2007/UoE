#include "extractor.h"
#include <stdio.h>

int main() {

  uint32_t a, mantissa, exponent;

  // feel free to change a to test
  a = 0b00111110000000000000000000000000;

  // call get_mantissa and get_exponent with a
  mantissa = get_mantissa(a);
  exponent = get_exponent(a);

  // print mantissa and exponent
  printf("a: 0x%X\n", a);
  printf("mantissa: %d\n", mantissa);
  printf("exponent: %d\n", exponent);

  return 0;
}
