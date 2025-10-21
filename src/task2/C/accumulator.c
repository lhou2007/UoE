#include "accumulator.h"

int int_accum(int a[10]) {
  int sum = 0,//int c;
  // Add your code here...
  i = 0;
  for (i = 0; i < 10; i++) {
    sum += a[i];
  }
  return sum;//return c;
}
