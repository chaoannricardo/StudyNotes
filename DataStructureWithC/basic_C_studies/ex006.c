#include <stdlib.h>
#include <stdio.h>

int ex006 (void){
    int sum=0;
    int number;
    int i;
    printf("Please enter an integer: ");
    scanf_s("%d",&number);
    /* increasing */
    for (i=1; i<=number; i++) {
        sum+=i;
        printf("%d",i);
        if (i < number)
            printf("+");
        else
            printf("=");
    }
    printf("%d\n", sum);
    sum=0;
    /* decreasing */
    for (i=number; i>=1 ; i--) {
        sum += i;
        printf("%d", i);
        if (i<=1)
            printf("=");
        else
            printf("+");
    }
    printf("%d\n",sum);
    system("pause");
    return 0;
}
