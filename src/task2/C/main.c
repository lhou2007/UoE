#include "accumulator.h"
#include <stdio.h>

int main() {

  int result;

  // feel free to change a to test
  int a[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};

  // call function with a and store the result
  result = int_accum(a);

  // print result
  printf("a: [ ");
  for (int i = 0; i < 10; i++) {
    printf("%d ", a[i]);
  }
  printf("]\n");
  printf("Sum of elements in a: %d\n", result);

  return 0;
}
