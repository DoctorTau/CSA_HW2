#include <time.h>
#include <stdio.h>
#include <stdlib.h>

void GenerateRandomString(char* str, int len) {
    srand(time(NULL));
    for (int i = 0; i < len; i++) {
        str[i] = rand() % 26 + 'a';
    }
    str[len] = '\0';
}