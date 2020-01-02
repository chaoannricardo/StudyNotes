#include <stdio.h>
#include <stdlib.h>
int ex005(void){
    char ch;
    scanf_s("%c", &ch);
    switch (ch)
    {
        case '1':
            printf("Keep Going!!!");
            break;
        case '2':
            printf("Still got some space to imporove!!!");
            break;
        case '3':
            printf("Too bad!!!");
            break;
        default:
            printf("error\n");
            break;
    }
    system("pause");
    return 0;
}
