;;Recursion in Pep/8
;;
;Write a subroutine sumN, which 
;sums up the intergers form 0 to N

CALL main, i
STOP

;;==========================
;sumN(N) --> sum form 0 to N
;

;local variables
temp1:   .EQUATE 0 ;#2d
;stack access
n1:      .EQUATE 4
retVal1: .EQUATE 6

sumN:    SUBSP 2, i ;#temp1

         LDA n1, s           ;no need to compair to zero as flag will be set 
         BRLE else, i 
         
         ;n > 0
         LDA n1, s
         SUBA 1, i ; n-1 should go on stack

         ;set up stack for recursive call
         n2:     .EQUATE 0;#2d 
         retVal2:.EQUATE 2;#2d
         SUBSP 4, i ;#retVal2 #n2
         
         STA n2, s ;n-1
         CALL sumN, i
         LDA retVal2, s ;answer         

         ADDSP 4, i;#n2 #retVal2

         ADDA n1, s
         STA retVal1, s
         BR endIf, i

else:    LDA 0, i
         STA retVal1, s
         
endIf:   ADDSP 2, i ;#temp1
         RET0        ;always returns the return address which was set up by call, to keep info you should set up a varible prior to CALL

;===========================
;main
;puts ret value, parm, ret address 

n0:      .EQUATE 0;#2d
retVal0: .EQUATE 2;#2d

main:    SUBSP 4, i ;#retVal0 #n0
         LDA 3, i
         STA n0, s 
         
         CALL sumN, i
         DECO retVal0, s 
         ADDSP 4, i ;#n0 #retVal0
         RET0


.END