#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "bplusTree.h"

int main()
{
    // Initialize the B+ tree
    BPTree *bPTree = createBPTree();

    printf("      _____      __        _____              \n");
    printf("     | __  |  __|  |__    |_   _| ___  ___  ___  \n");
    printf("     | __ -| |__    __|     | |  | |  | -_|| -_| \n");
    printf("     |_____|    |__|        |_|  |_|  |___||___| \n");

    int option;
    do
    {
        printf("\nPlease provide the queries with respective keys:\n");
        printf("\tPress 1: Insertion\n");
        printf("\tPress 2: Search\n");
        printf("\tPress 3: Print Tree\n");
        printf("\tPress 4: Delete Key In Tree\n");
        printf("\tPress 5: taking input from given txt file\n");
        printf("\tPress 6: ABORT!\n");
        scanf("%d", &option);

        switch (option)
        {
        case 1:
        {
            int rollNo;
            int age, marks;
            char name[100];

            printf("Please provide the rollNo: ");
            scanf("%d", &rollNo);

            printf("\nWhat's the Name, Age and Marks acquired?: ");
            scanf("%s %d %d", name, &age, &marks);

            char fileName[100];
            sprintf(fileName, "DBFiles/%d.txt", rollNo);
            FILE *filePtr = fopen(fileName, "w");
            fprintf(filePtr, "%s %d %d\n", name, age, marks);
            fclose(filePtr);

            insert(bPTree, rollNo, filePtr);

            printf("Insertion of roll No: %d Successful\n", rollNo);
            break;
        }
        case 2:
        {
            int rollNo;
            printf("What's the RollNo to Search? ");
            scanf("%d", &rollNo);

            search(bPTree, rollNo);
            break;
        }
        case 3:
        {

            printf("\nHere is your File Structure:\n");
            display(bPTree->root, 0);
            printf("\n");
            break;
        }
        case 4:
        {
            printf("Showing you the Tree, Choose a key from here:\n");
            display(bPTree->root, 0);

            int tmp;
            printf("Enter a key to delete: ");
            scanf("%d", &tmp);

            removeKey(bPTree->root, tmp);

            // Displaying
            display(bPTree->root, 0);
            break;
        }
        case 5:
        {
            printf("Taking input from given input.txt file\n");
            // taking input from txt file
            FILE *inputFile = fopen("input.txt", "r");
            if (inputFile == NULL)
            {
                printf("Failed to open input file.\n");
                return 1;
            }

            char line[100];
            while (fgets(line, sizeof(line), inputFile) != NULL)
            {
                int rollNo, age, marks;
                char name[100];

                // Parse the line to extract the data
                sscanf(line, "%d,%[^,],%d,%d", &rollNo, name, &age, &marks);

                // Create a file name based on the rollNo
                char fileName[100];
                sprintf(fileName, "DBFiles/%d.txt", rollNo);

                // Open the file for writing
                FILE *filePtr = fopen(fileName, "w");
                if (filePtr == NULL)
                {
                    printf("Failed to open file for rollNo %d.\n", rollNo);
                    continue;
                }

                // Write the data to the file
                fprintf(filePtr, "%s %d %d\n", name, age, marks);

                // Insert the key into the B+ tree
                insert(bPTree, rollNo, filePtr);

                // Close the file
                fclose(filePtr);
            }

            // Close the input file
            fclose(inputFile);
            printf("input.txt file is successfully read\n");
            break;
        }
        default:
            option = 6;
            break;
        }
    } while (option != 6);

    return 0;
}
