#include "divider.h"
#include <stdio.h>

int main() {

  int a, b, result;

  // feel free to change a and b to test
  a = 17;
  b = 5;

  // call function with a and b and store the result
  result = int_divide(a, b);

  // print result
  printf("a: %d\n", a);
  printf("b: %d\n", b);
  printf("a / b = %d\n", result);

  return 0;
}
