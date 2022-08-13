;;Translation of java for loop
;;We'll do it with a call to main
;;verses a branch, to see the difference

CALL main
STOP

;;Print numbers from 0 up to user's number (nothing
;;if user's number is negative)

;;GLOBAL DATA 
str1: .ASCII "Please enter an interger: \x00" 
str2: .ASCII " \x00"

;set up locals
num: .EQUATE 0 ;#2d
i: .EQUATE 2 ;#2d


main:    SUBSP 4, i ;alloc #i #num dont want to overwrite CALL
         STRO str1, d
         
         ;num = input.nextInt()
         DECI num, s
         
         ;for (i = 0; i <= num; i++)
         LDX 0, i
         
loop:        CPX num, s
             BRGT done_for, i 
                 
             STX i, s
             DECO i, s           ;System.out.print(i + " ")
             STRO str2, d
          
             ADDX 1, i
         
             BR loop, i

done_for:STX i, s
         ADDSP 4, i ;dealloc #i #num
         RET0

.END