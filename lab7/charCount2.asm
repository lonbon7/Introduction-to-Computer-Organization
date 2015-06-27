;  Lonnie Bissmeyer
;  CSC 225 Lab7

                     .ORIG x3300
   
                     ; Callee setup. GOOD.
                     
CHARCOUNT ADD R6, R6, #-2   ; Make room on stack for return value. GOOD.               
                     STR R7, R6, #0    ; Save return address from R7 onto the stack. GOOD.
                     ADD R6, R6, #-1   ; Make room on stack for dynamic link. GOOD.
                     STR R5, R6 #0     ;  Save R5 on the stack. GOOD.
                     ADD R6, R6, #-1   ; Make room on stack for local variables.GOOD.
                     AND R5, R5, #0
                     ADD R5, R6, #0    ; Set R5. R5 and R6 point to the same spot. GOOD.
                     
                     ; Checking for null character. GOOD.
                     
                     LDR R1, R6, #4    ; Load the first argument to the function in R1. GOOD.
                     LDR R1, R1, #0    ; Pointer so do it twice. GOOD; R1 now contains the first character I type.                    
                     AND R0, R0, #0    ; Clear R0. GOOD.
                     ADD R0, R0, R1    ; Add first argument to zero. Zero should be in R0 if null character is in R1. GOOD.
                     BRz BASE_CASE  ; Branch if null-character found. GOOD
                     
                     ; Checking to see if character matches. GOOD
                     
                     NOT R3, R1     ; Negate argument 1. GOOD.
                     ADD R3, R3, #1    ; GOOD.
                     ADD R3, R3, R1    ; Check for equality. GOOD.
                     BRz MATCH      ; GOOD
                     
                     ; If not match and not null, then prep for calling function again.
                     
                      LDR R1, R6, #4    ; Load R1 with the str* argument, the first argument. GOOD.
                     ADD R1, R1, #1    ; Increment the string pointer.  GOOD.               
                     
                     ; Caller setup.
                     
                     LDR R2, R6, #5    ; Loads the second argument into R2. GOOD.
                     ADD R6, R6, #-1   ; Makes room for argument 2. GOOD.
                     STR R2, R6, #0    ; Pushes argument 2. GOOD.
                     ADD R6, R6, #-1   ; Makes room for argument 1. GOOD.
                     STR R1, R6, #0    ; Pushes argument 1. GOOD.
                     JSR   CHARCOUNT   ; Transfers control to function. GOOD.

                     ; Caller teardown.
                     
                     ADD R6, R6, #3    ; Pops return value and arguments.
                     
                     BRnzp  TEARDOWN    ; Goes to the end of the function.      
                     
                     ; Puts one into the result and recurses.
                     
MATCH          LDR R1, R6, #4    ; Load R1 with the str* argument, the first argument. GOOD.
                     ADD R1, R1, #1    ; Increment the string pointer. GOOD.
                     
                     ; Caller setup.
                     
                     LDR R2, R6, #5    ; Loads the second argument into R2. GOOD.
                     ADD R6, R6, #-1   ; Makes room for argument 2. GOOD. 
                     STR R2, R6, #0    ; Pushes argument 2. GOOD.
                     ADD R6, R6, #-1   ; Makes room for argument 1. GOOD.
                     STR R1, R6, #0    ; Pushes argument 1. GOOD.
                     JSR   CHARCOUNT   ; Transfers control to function. GOOD.
                     
                     ; Caller teardown.
                     
                     AND R0, R0, #0    ;    Initializes R0 for use. GOOD.
                     ADD R0, R0, #1    ;     1 is the return value. GOOD.
                     STR R0, R6, #0    ; Puts 1 into result. GOOD.
                     ADD R6, R6, #3    ; Pops return value and arguments. GOOD.
                     BRnzp  TEARDOWN    ; Goes to the end of the function. GOOD.
                     
                     ; Puts zero into return value.
                     
BASE_CASE  STR R0, R6, #0    ; Stores zero into result. GOOD.                
                     
                     ; Callee teardown.
                     
TEARDOWN  LDR R0, R6, #0      ; Puts result into R0. GOOD.
                     STR R0, R6, #3    ; Stores result in return value. GOOD. 
                     ADD R6, R6, #1    ; Pop local variable. GOOD.
                     LDR R5, R6, #0    ; Restore dynamic link. GOOD.
                     ADD R6, R6, #1    ; Pop dynamic link. R6 now points at return address. GOOD.
                     LDR R7, R6, #0    ; Restore return address. GOOD.
                     ADD R6, R6, #1    ; R6 now points to return value. GOOD.                  
                     RET ; GOOD.
                     
                     .END
                     