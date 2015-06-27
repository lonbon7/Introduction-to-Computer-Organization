; Lonnie Bissmeyer
; CSC 225 Lab7 3/3/13
; charCount function

   .ORIG x3300
   
   ; Setup and bookkeeping of function call.
   
RECURSE     ADD R6, R6, #-2   ; Make room on stack for return value.                
                     STR R7, R6, #0    ; Save return address from R7 onto the stack.
                     ADD R6, R6, #-1   ; Make room on stack for dynamic link.
                     STR R5, R6 #0     ;  Save R5 on the stack.
                     ADD R6, R6, #-1   ; Make room on stack for local variables.
                     LDR R5, R6, #0    ; Set R5. R5 and R6 point to the same spot.
                  
                     ; Main stuff for function.           
                  
                     LDR R1, R6, #4    ; Load the first argument to the function in R1.                                   
                     LDR R2, R6, #5    ; Load the second argument to the function in R2.                 
                     AND R0, R1, xFFFF ; Check to see if argument is zero (null).
                     BRz BASE_CASE  ; End the recursion if zero-check successful.
                     
                     ; Not null character.
                     
                     NOT R1, R1  ; Negate the first argument.
                     ADD R1, R1, #1 ;
                     ADD R3, R1, R2  ; Check for character equality.
                     BRz MATCH   ; Increment count and recurse if matching characters.
                     
                     ; No match.
                     
                     ADD R4, R4, #1    ; Increment times recursed.
                     JSR RECURSE    ; Recurse back through the function.
                     
BASE_CASE STR R3, R6, #3   ; Write return value.
                     ADD R6, R6, #1  ; Pop local variable.
                     LDR R5, R6, #0    ; Restore dynamic link.
                     ADD R6, R6, #1 ; Pop dynamic link.
                     LDR R7, R6, #0    ; Restore return address.
                     ADD R6, R6, #4 ; Pop the rest of the function's activation record.
                     RET    ;  End the recursion.
                     
MATCH         STR R3, R6, #0  ; Stores result in stack.
                    ADD R4, R4, #1  ; Increments times recursed.
                   JSR RECURSE
                  
                   .END
   

