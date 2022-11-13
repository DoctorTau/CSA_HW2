#include <stdio.h>

void WriteToFile(char* str, char* filename) {
    FILE* file = fopen(filename, "w");
    if (file == NULL) {
        printf("Error opening file");
        exit(1);
    }
    fprintf(file, "%s", str);
    fclose(file);
}