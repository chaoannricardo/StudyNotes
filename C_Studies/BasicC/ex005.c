#include <stdio.h>
#include <stdlib.h>
int main(void){
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
    }
}
