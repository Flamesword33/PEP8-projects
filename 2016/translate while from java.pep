;;While loop in java translation 
;;
;Thinking of main as global context
BR main, i

;Data
num: .WORD 0
space: .ASCII " \x00"

;Program
main: LDA 100, i
STA num, d

;while loop
loop: LDA num, d ;num !=0 cond
CPA 0, i
BREQ done_whi, i

DECO num, d ;print num
STRO space, d;print " "
LDA num, d ;num = num - 2
SUBA 2, i
STA num, d
BR loop, i

done_whi: STOP

.END