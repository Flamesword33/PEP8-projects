;;EXCHANGE(LOC1 LOC2 SIZE VECTOR)

;;initialize loc1 loc2 size and vector 
DECI loc1, d
DECI loc2, d

LDA 5, i
STA size, d

LDX 0, i
LDA 1, i
STA vector, x

ADDX 2, i
ADDA 1, i
STA vector, x

ADDX 2, i
ADDA 1, i
STA vector, x

ADDX 2, i
ADDA 1, i
STA vector, x

ADDX 2, i
ADDA 1, i
STA vector, x
;;-----------------
;;CODE STARTS
;;NOTE IF STATEMENT USES AND LIKE CRAZY THEREFORE 
;;CAN USE A CONSTANT DONE IF THE STATEMENTS PROVE 
;;FALSE AT ANY POINT 

; if(loc1 >= 0 
LDA loc1, d
CPA 0, i
BRLT done, i
; && loc1 < size
LDA loc1, d
CPA size, d
BRGE done, i
; && loc2 >= 0 
LDA loc2, d
CPA 0, i
BRLT done, i
; && loc2 < size
LDA loc2, d
CPA size, d
BRGE done, i
;int temp = vector[loc1]
         LDX loc1, d
         ASLX
         LDA vector, x
         STA temp, d
;vector[loc1] = vector[loc2]
         LDX loc2, d
         ASLX
         LDA vector, x
         LDX loc1, d
         ASLX
         STA vector, x
;vector[loc2] = temp
         LDA temp, d
         LDX loc2, d
         ASLX
         STA vector, x

done:    STOP
;DATA
loc1:    .BLOCK 2
loc2:    .BLOCK 2
size:    .BLOCK 2
vector:  .BLOCK 40
temp:    .BLOCK 2
.END




































