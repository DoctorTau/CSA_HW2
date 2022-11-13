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

    char result = IsPolidrom(str, len);
    if (result) {
        printf("YES\n", str);
    } else {
        printf("NO\n", str);
    }

    if (argc == 3) {
        if (result) {
            WriteToFile("YES", argv[2]);
        } else {
            WriteToFile("NO", argv[2]);
        }
    } else {
        printf("%s", str);
    }

    return 0;
}