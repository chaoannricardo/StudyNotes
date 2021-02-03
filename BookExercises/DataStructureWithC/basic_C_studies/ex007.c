#include <stdio.h>
#include <stdlib.h>
int ex007(void){
    int product=1;
    int i=1;
    while (i<6){
        product=i*product;
        printf("i=%d", i);
        printf("\tproduct=%d\n", product);
        i++;
    }
    printf("\nThe result is %d", product);
    printf("\n");
    system("pause");
    return 0;

}