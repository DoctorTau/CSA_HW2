#include <stdlib.h>
#include <time.h>
#include <stdio.h>

int MAX_SIZE = 1000000;

extern void GenerateRandomString(char* str, int len);
extern char IsPolidrom(char* str, int len);
extern int ReadFromFile(char* str, char* filename);
extern void WriteToFile(char* str, char* filename);

int main(int argc, char* argv[]) {
    srand(time(NULL));

    char str[MAX_SIZE];
    int len;

    if (argc == 1) {
        len = rand() % 100 + 1;
        GenerateRandomString(str, len);
    } else {
        len = ReadFromFile(str, argv[1]);
    }

    clock_t t;
    t = clock();
    char result = IsPolidrom(str, len);
    t = clock() - t;
    long int time_taken = ((long int)t) * 1000000 / CLOCKS_PER_SEC;

    if (argc == 3) {
        if (result) {
            WriteToFile("YES\n", argv[2]);
        } else {
            WriteToFile("NO\n", argv[2]);
        }
    } else {
        if (result) {
            printf("YES\n %s", str);
        } else {
            printf("NO\n %s", str);
        }
        printf("%s", str);
    }

    printf("\nProgram took %ld miliseconds to execute \n", time_taken);
    return 0;
}