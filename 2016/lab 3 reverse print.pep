;; Reverse print
;; by Nathan Pelletier
;;
;; Takes a user input string and returns a string with a mirrored version of all letters
;; present, the program stops at the first non-letter hit
;;
;; 3 parts to design: 
;;       a user interface which asks for a word to be reversed
;;       a specialized string input which stops at the first non-letter read
;;       a string or character output which reverses the print order
;; Bonus ideas:
;;       for reusability, make it work with spaces

         STRO prompt, d

;; String input
;;--------------
         LDA 0, i                 ;checks innital value to see if it is a letter
         CHARI word, d            ;loads 0 into index, loads letter into accumulator for compairsons
         LDBYTEA word, d          
         CPA 'A', i               ;checks for lower than A in hex
         BRLT error1, i
         CPA 'z', i               ;checks for greater than z in hex
         BRGT error1, i
         CPA 'Z', i
         BRGT check1, i           ;checks for greater than Z and less than a (see below check)
         
         
loop1:   LDX 1, i                     ;loads 0 into index to change spot saved in memory
input:   CHARI word, x   
         LDBYTEA word, x
         
         CPA 32, i                    ; checks for a space
         BREQ return, i
         CPA 65, i                    ;checks if letter is lower than A in hex
         BRLT loop2, i 
         CPA 122, i                   ;checks if letter is greater than z in hex
         BRGT loop2, i
         CPA 90, i                    ;checks if letter is greater than Z and prforms second check if 
         BRGT check2, i               ;to find if less than a
     
return:  ADDX 1, i                    ;both keeps track of memory and 
         CPX 40,i                     ;stops when it hits 40
         BRLT input, i 
         BR error2, i

;; STRING OUTPUT
;;---------------
loop2:   SUBX 1, i                ;starts on an invalid character
         CHARO word, x 
         CPX 0, i                 ;compairs the index to zero so the accumulator can be used
         BRNE loop2, i            
         BR done, i               

;; Checks to see if greater than or equal to a
;;---------------------------------------------
check1:  CPA 96, i
         BRGT loop1, i
         BR error1, i              

check2:  CPA 96, i
         BRGT return, i
         BR loop2, i

;; ERROR MESSAGES
;;----------------
error1:  STRO errorMsg, d
done:    STOP

error2:  STRO errorMs2, d
         STOP

; DATA
;------
prompt:  .ASCII "Please enter a word to be reversed: \x00" 
errorMsg:.ASCII "ERROR \nYou entered an incorrect character.\x00"
errorMs2:.ASCII "ERROR \nYou went over the letter count of 40 letters. \x00"
word:    .BLOCK 40

.END