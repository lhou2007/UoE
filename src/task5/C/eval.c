#include "comparator.h"
#include <stdio.h>

int main() {
  uint32_t a, b;
  scanf("%d %d", &a, &b);
  bool result = fp_is_greater(a, b);
  printf("%d\n", result);
  return 0;
}
