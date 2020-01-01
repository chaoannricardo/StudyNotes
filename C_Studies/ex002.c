#include <stdio.h>
int main(void){
    int Val=123;
    printf("formatted string output.");
    /* d: 輸出10進位整數 */
    printf("Val=%d\n",Val);
    /* i: 輸出10進位整數 */
    printf("%%iVal%i\n",Val);
    /* o: 輸出8進位數 */
    printf("%%oVal=%o\n",Val);
    /* u: 輸出10進位無號數 */
    printf("%%uVal=%u\n",Val);
    /* x: 輸出16進位無號數 */
    printf("%%xVal=%x\n",Val);
}