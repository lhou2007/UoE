#include "adder.h"
#include <stdio.h>

int main() {

  int a0, a1, result;

  // feel free to change a0 and a1 to test
  a0 = 100;
  a1 = 2;

  // call function with a0 and a1 and store the result
  result = int_add(a0, a1);

  // print result
  printf("a0: %d\n", a0);
  printf("a1: %d\n", a1);
  printf("a0 + a1 = %d\n", result);

  return 0;
}
