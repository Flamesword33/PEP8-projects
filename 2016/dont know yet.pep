       BR main, i 
init: .WORD 0 ;set up starting value 
numTimes: .EQUATE 12 ;number of 
                   ;multiples to print 
main: LDA 0, i  ;run time initialization of variable that changes
      STA init, d

      LDX 1, i ;index reg will count 
               ;up to numTimes 
      LDA init, d 
loop: ADDA 5, i ;acc tracks multiples 
      STA init, d 
      DECO init, d ;print a multiple 
      CHARO ' ', i 
      ADDX 1, i 
      CPX numTimes, i 
      BRLE loop, i 
      STOP 
.END