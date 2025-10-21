#include "fp_func.h"
#include <stdio.h>

int main() {

  uint32_t a, b, result;

  // feel free to change a and b to test
  a = 0b00111111000000000000000000000000;
  b = 0b00111110100000000000000000000000;

  // call function with a and b and store the result
  result = fp_func(a, b);

  // print result
  printf("a: 0x%X\n", a);
  printf("b: 0x%X\n", b);
  printf("a^2 + b^2 = 0x%X\n", result);

  return 0;
}
