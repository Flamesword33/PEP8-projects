LDA 0, i
STA num1, d
STA num2, d
STA num3, d
STA temp, d

DECI num1, d 
DECI num2, d

LDX 0, i ;used to count number of times shifted

;; multiply (num1, num2)
;; multiplies two numbers by asmetrical shift and addition 

multiply: ADDX 1, i
          LDA num1, d
          ASRA
          
          STA num1, d ;store to prevent infinite loop
          BRC m2, i
          CPA 0, i   
          BRLE done, i 
          BR multiply, i         

;;m2 
;;inner multiply, useses the index register to 
;;reconstruct the other number and add it to itself
m2:      STX temp, d
         SUBX 1, i           ;ensures the 2^x system works
         LDA num2, d
         CPX 0, i
         BREQ done2, i
         

loop:    ASLA
         SUBX 1, i
         CPX 0, i
         BRLE done2, i
         BR loop, i 

done2:   LDX temp, d
         ADDA num3, d
         STA num3, d
         BR multiply, i

done:    DECO num3, d
         STOP

num1:     .BLOCK 2
num2:     .BLOCK 2
num3:     .BLOCK 2
temp:     .BLOCK 2
.END