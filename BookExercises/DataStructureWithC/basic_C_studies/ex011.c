#include <stdlib.h>
#include <stdio.h>

void fun_number2(int*, int*);
int main(void){
    int a,b;
    a=10;
    b=15;
    printf("Outside the function:\na=%d, \tb=%d\n", a, b);
    printf("Memory address of \na=%d, \tb=%d\n", &a, &b);

    fun_number2(&a, &b);
}

void fun_number2(int *a, int *b)
{
    printf("===========================================\n");
    printf("Inside the function\n");
    printf("Entered parameters: a=%d, \tb=%d\n", *a, *b);

    printf("Memory address inside the function: a=%d, b=%d", a, b);
    *a=20;
    *b=30;
    printf("After changing the value, memory address turn out to be a=%d, b=%d", *a, *b);
}
