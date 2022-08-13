;;Translation of Java If example
;;from slides into assembly
BR main, i


;Global Data 
num: .WORD 0
prompt: .ASCII "Please enter an interger: \x00"
posMsg: .ASCII "That interger is positive\x00"
negMsg: .ASCII "That interger is negitive\x00"
zeroMsg: .ASCII "That interger is zero\x00"

main: STRO prompt, d
DECI num, d

;num > 0
LDA num, d
CPA 0, i
BRLE elif, i

;if was true
STRO posMsg, d
BR doneIf, i

elif: LDA num, d
CPA 0, i
BRGE else, i

STRO negMsg, d
BR doneIf, i

else: STRO zeroMsg, d

doneIf: STOP


.END