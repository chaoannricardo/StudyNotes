#include <stdio.h>
#include <stdlib.h>

void fun(int, int);

int ex010(void)
{
    int a, b;
    a=10;
    b=15;
    printf("Outside the function: \na=%d, \tb=%d\n", a, b);
    printf("The memory address: a=%d, b=%d\n", &a, &b );
    fun(a,b);
    printf("==========================================\n");
    printf("After calling the function: \na=%d, \tb=%d\n", a, b);
    system("pause");
    return 0;
}

void fun(int a, int b){
    printf("=========================================\n");
    printf("Inside the function\n");
    printf("Entered parameters: a=%d, b=%d\n", a, b);
    printf("The memory address of a=%d, b=%d\n", &a, &b);
    /* Reset the variables */
    a=20;
    b=30;
    printf("Parameter after changed by the function is a=%d, b=%d\n", a, b);
}