#include <stdlib.h>
#include <stdio.h>

int ex008(void){
    int number;
    int sum=0;
    /* do while loop starts */
    do
    {
        printf("Enter 0 to exit, please enter a number.");
        scanf_s("%d",&number);
        sum+=number;
        printf("The result for now is %d\n", number);
    }while(number!=0);
    system("pause");
    return 0;
}