/* Lonnie Bissmeyer
 * CSC 225
 * Driver for lab 6 program
*/

#include <stdio.h>
#include <stdlib.h>
#include "stack.h"

int main(void)
{
   char mode;
   int data, error, printMode = 0, popped ;

   printf("\nWeclome to the stack program.\n\n");

   while(mode != 'x')
   {
		printf("Enter option: ");
		scanf(" %c", &mode);

		if(mode == 'x')
		{
			printf("Goodbye!\n");						
		}

      if(mode == 'u')
      {
			printf("What number? ");
			scanf("%d", &data);			

         error = push(data);
			
	 		if(error == 1)
	 		{
				printf("Overflow!!!\n");
            printf("Stack: ");
            printStack(printMode);
				printf("\n\n");
			}
			else
			{
				printf("Stack: ");
				printStack(printMode);
				printf("\n\n");							
			}
		}

		if(mode == 'o')
		{
			error = pop(&popped);
			
			if(error == 1)
			{
				printf("Underflow!!!\n");
            printf("Stack: ");
            printStack(printMode);
            printf("\n\n");
			}
         else
         {
            printf("Popped %d\n", popped);
            printf("Stack: ");
            printStack(printMode);
            printf("\n\n");
         }
		}
      
      if(mode == 'h')
      {
         printMode = 1;
         printf("Stack: ");
         printStack(printMode);
         printf("\n\n");
      }
      
      if(mode == 'd')
      {
         printMode = 0;
         printf("Stack: ");
         printStack(printMode);
         printf("\n\n");
      }
      
      if(mode == 'c')
      {
         printMode = 2;
         printf("Stack: ");
         printStack(printMode);
         printf("\n\n");
      }
	}
   
	return 0;
}
