#include <stdio.h>

int ReadFromFile(char* str, char* filename) {
    FILE* file = fopen(filename, "r");
    if (file == NULL) {
        printf("Error opening file");
        exit(1);
    }
    int i = 0;
    char c;
    while ((c = fgetc(file)) != EOF) {
        str[i] = c;
        i++;
    }
    str[i] = '\0';
    fclose(file);
    return i;
}