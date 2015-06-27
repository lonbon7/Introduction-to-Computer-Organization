/* Lonnie Bissmeyer
 *
 * CSC 225
 * Lab 6
*/

#include <stdio.h>
#include <stdlib.h>

int stack[10];
int top = 0;

int push(int value)
{
   if(top == 10)
   {
      return 1;
   }

   stack[top] = value;
   top++;

   return 0;
}    

int pop(int *value)
{
   if(top == 0)
   {
      return 1;
   }
   
   *value = stack[top];
   top--;

   return 0;
}

void printStack(int mode)
{
   int i;

   if(mode == 0)
   {
      for(i = 0; i < top; i++)
      {
         printf("%d ", stack[i]);
      }
   }

   if(mode == 1)
   {
      for(i = 0; i < top; i++)
      {
         printf("%x ", stack[i]);
      }
   }

   if(mode == 2)
   {
      for(i = 0; i < top; i++)
      {
         printf("%c ", stack[i]);
      }
   }
}
