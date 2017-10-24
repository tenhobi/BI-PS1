#include <stdio.h>

int main(void) {
    int number;

    if (scanf("%d", &number) != 1) {
        printf("Wrong input.\n");
        return 0;
    } 

    printf("%d\n", number * number);

    return 0;
}
