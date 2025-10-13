#include<stdio.h>
#include "divider.h"

int main(){
    int a,b;
    scanf("%d %d", &a, &b);
    int result = int_divide(a,b);
    printf("%d\n", result);
    return 0;
}