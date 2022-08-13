;;Java switch translation
;;by Nathan Pelletier
;;Oct 14, 2016

CALL main, i
STOP

;---------------
;GLOBAL DATA
prompt:  .ASCII "Please enter 0, 1, 2, or 3: \x00"
msg0: .ASCII "You entered a 0\x00"
msg1: .ASCII "You entered a 1\x00"
msg2: .ASCII "You entered a 2\x00"
msg3: .ASCII "You entered a 3\x00"
msgd: .ASCII "That was a dive off the deep end "
      .ASCII "without knowing how to swim.\x00"
;-----------------
;Jump table (for switch)
switch:  .ADDRSS case0
         .ADDRSS case1
         .ADDRSS case2
         .ADDRSS case3

;------------------
;main()

;local variable:
;input
input: .EQUATE 0 ;#2d

main:    SUBSP 2, i ;#input on the stack

         ;Get the input
         STRO prompt, d
         DECI input, s   

         ;get ready to switch
         LDX input, s

         ;take care of defaults, with compairsons
         CPX 3, i            ;upper boundary
         BRGT default, i 
         CPX 0, i            ;lower boundary
         BRLT default, i         

         ASLX                ;multiply by 2 beacuse addresses are two bytes long
         BR switch, x ;switch to appropriate case    

         ;set up jump table
case0:   STRO msg0, d
         BR doneS, i
         
case1:   STRO msg1, d
         BR doneS, i

case2:   STRO msg2, d
         BR doneS, i

case3:   STRO msg3, d
         BR doneS, i

default:  STRO msgd, d
         
doneS:   ADDSP 2, i ;#input
RET0

.END