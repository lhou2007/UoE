#include "comparator.h"
#include <stdio.h>

int main() {

  uint32_t a, b;

  // feel free to change a and b to test
  a = 0b00111111000000000000000000000000;
  b = 0b00111110100000000000000000000000;

  // call function with a and b and store the result
  bool result = fp_is_greater(a, b);

  // print result
  printf("a: 0x%X\n", a);
  printf("b: 0x%X\n", b);
  printf("a > b = %d\n", result);

  return 0;
}
