;; AUCSC 250
;; 28 Sept 2016
;;
;; Program to print a square of stars, with size
;; specified by user

;Input size
begin: STRO prompt, d
DECI sqr_size, d

;Make sure it was positive
LDA sqr_size, d
BRLE badInput, i ;Error if negitive or zero

;;build square
;use index regiser to track line number
LDX sqr_size, d

loop: CHARO '*', i ;print star 
CHARO ' ', i
CHARO ' ', i
SUBA 1, i ;decriment acc
BRGT loop, i 

CHARO '\n', i ;Move to new line
LDA sqr_size, d ;reset line position to size
SUBX 1, i ;Decrement line number
BRGT loop, i ;go to print next line

STOP

badInput: STRO badPromp, d
BR begin, i



;data
prompt: .ASCII "Please enter a positive interger: \x00"
sqr_size: .WORD 0
badPromp: .ASCII "That number is negitive or zero. Try again.\n\x00"
.END