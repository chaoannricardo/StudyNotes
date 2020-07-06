#include <stdio.h>
#include <stdlib.h>
#include <conio.h>

int ex009(void){
    int i;
    char choice;

    char newspaper[5][20] = {{"1.AAAA"},
                             {"2.BBBB"},
                             {"3.CCCC"},
                             {"4.DDDD"},
                             {"5.No need of that."}};
    for(i=0; i<5; i++)
    {
        printf("%s", newspaper[i]);
        printf("\n");
    }
    printf("Please enter your choice");
    choice=getche();
    printf("\n");
    choice=choice-'0';

    if(choice>=0 && choice<4)
    {
        printf("%s", newspaper[choice-1]);
        printf("Thanks for your subscription");
    } else if (choice == 5){
        printf("Thanks you!!!");
    } else{
        printf("You've entered a wrong number.");
    }
    system("pause");
    return 0;
}