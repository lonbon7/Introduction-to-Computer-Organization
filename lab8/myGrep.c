/* Lonnie Bissmeyer
 * CSC 225 Lab8
 * 3/8/13
*/

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "myGrep.h"

#define MAX 100

int main(int argc, char *argv[])
{
   FILE *file = fopen(argv[1], "r");

   if(argc != 3)
   {
      printf("myGrep: improper number of arguments\n");
      printf("Usage: ./a.out <filename> <word>\n");
      
      return 1;
   }
   
   printf("%s %s %s\n", argv[0], argv[1], argv[2]);     
   
   openFile(file);

	fopen(argv[1], "r");

	linkedList(file, argv[2]);
   
   return 0;
}

void openFile(FILE *file)
{  
   char *str, *largest;   
   int line_count = 0, numChar;
   
   str = (char *)malloc(MAX * sizeof(char));
   largest = (char *)malloc(MAX * sizeof(char));   
   
   while(( fgets(str, MAX, file)) != NULL)
   {
      if(line_count == 0)
      {          
         strcpy(largest, str);         
      }      
      
      if(strlen(str) > strlen(largest))
      {        
         strcpy(largest, str);         
      }
      
      line_count++;
   }

   numChar = strlen(largest);
   
   printf("longest line: %s\n", largest);
   printf("num chars: %d\n", numChar + 1);
   printf("num lines: %d\n", line_count);

	fclose(file);
}  
   
void linkedList(FILE *file, char *strArg)
{   
	int line = 0, word, i, total = 0;
	char *str, *newStr, *result, *tok;
	Line *temp, *head = NULL, *tail, *cursor;
  
	str = (char *)malloc(MAX * sizeof(char));
	newStr = (char *)malloc(MAX * sizeof(char));

	while((result = fgets(str, MAX, file)) != NULL)
	{     
		word = 0;

		for(i = 0; i < MAX; i++)
		{         
			if(str[i] == '\n')
			{
				str[i] = '\0';
				break;
			}
		}
		
		strcpy(newStr, str);      
		tok = strtok(str, " ,.()\"");
     
		while(tok != NULL)
		{        
			if(strcmp(tok, strArg) == 0)
			{            
            temp = (Line*)malloc(sizeof(Line));
            temp -> next = NULL;
            if(head == NULL)
            {
               head = temp;
               tail = temp;
            }
            else
            {
               tail -> next = temp;
               tail = temp;
            }
            
				total++;
				temp -> lineNum = line;
				temp -> wordNum = word;
				strcpy(temp -> line, newStr);
			}
			
			tok = strtok(NULL, " ,.()\"");
			word++;        
		}      
		line++;
     	}
  
   fclose(file);
  
   printf("total occurrences of word: %d\n", total);   
   cursor = head;
    
   while(cursor  != NULL)
   {      
      printf("line %d; word %d; %s\n", cursor -> lineNum, cursor -> wordNum, cursor -> line);
      cursor = cursor -> next;     
   }
}
