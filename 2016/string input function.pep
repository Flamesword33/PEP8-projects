;; STRI
;; by Nathan Pelletier
;;
;; Creates a string input function which stops when the user is done inputing

;; String input
;;--------------
;idea 1
LDX 0, i                     ;loads 0 into index to change spot saved in memory
input: CHARI word, x   
LDBYTEA word, x
CPA 10, i                    ;checks if you are done typing (10 is 0A for next line)
BREQ done, i      
ADDX 1, i                    ;keeps track of memory 
BR input, i 


done: STOP


; DATA
;------
word:    .BLOCK 40


.END