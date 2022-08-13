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
         LDA 0, i
         STA i, s
         
loop:        LDA i, s
             CPA num, s
             BRGT done_for, i 
         
             DECO i, s           ;System.out.print(i + " ")
             STRO str2, d
         
             LDA i, s 
             ADDA 1, i
             STA i, s
         
             BR loop, i

done_for:ADDSP 4, i ;dealloc #i #num
         RET0

.END