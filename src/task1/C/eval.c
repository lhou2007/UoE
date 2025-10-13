#include "adder.h"
#include <stdio.h>

int main() {
  int a, b;
  scanf("%d %d", &a, &b);
  int result = int_add(a, b);
  printf("%d\n", result);
  return 0;
}
