         BR      main        ;method 
sum:     .WORD   0x0000      ;word variable
num1:    .BLOCK 2            ;varible 1
num2:    .BLOCK 2            ;varible 2
num3:    .BLOCK 2            ;varible 3

negMsg:  CHARO   0x0045 ,i   ;varible 4 
         BR      finish      ;stops loop

main:    LDA     sum ,d      ;Loads A from memory to sum

         DECI    num1 ,d     ;decimal input required for first varible
         ADDA    num1 ,d     ;adds num1 to others designated with an A

         DECI    num2 ,d
         ADDA    num2 ,d
         DECI    num3 ,d
         ADDA    num3 ,d

         BRLT    negMsg      ;preforms if less than 0
         STA     sum ,d      ;stores A to sum
         DECO    sum ,d      ;prints sum
         
finish:  STOP                     ;end of method

         .END