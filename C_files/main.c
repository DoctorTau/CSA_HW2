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
    clock_t t;
    int len, amount_of_tests = 1;
    char *inputFile = NULL, *outputFile = NULL;

    switch (argc) {
        case 3:
            if (argv[1][0] == '-' && argv[1][1] == 'r') {
                amount_of_tests = atoi(argv[2]);
            } else {
                inputFile = argv[1];
                outputFile = argv[2];
            }
            break;
        case 2:
            inputFile = argv[1];
            break;
        case 1:
            len = rand() % MAX_SIZE + 1;
            GenerateRandomString(str, len);
            break;

        default:
            break;
    }

    if (inputFile != NULL) {
        len = ReadFromFile(str, argv[1]);
    }

    t = clock();
    for (int i = 0; i < amount_of_tests; i++) {
        IsPolidrom(str, len);
    }
    char result = IsPolidrom(str, len);
    t = clock() - t;
    long int time_taken = ((long int)t) * 1000000 / CLOCKS_PER_SEC;

    if (outputFile != NULL) {
        if (result) {
            WriteToFile("YES\n", outputFile);
        } else {
            WriteToFile("NO\n", outputFile);
        }
    } else {
        if (result) {
            printf("YES\n");
        } else {
            printf("NO\n");
        }
    }

    printf("\nProgram took %ld miliseconds to execute \n", time_taken);
    return 0;
}