;;ROTLEFT

;;USES  SIZE VECTOR
;lFirst lCount

;;initialize size and vector 
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

;int lFirst int lCount
LDA 0,i
STA lFirst, d
STA lCount, d

;lFirst = vector[0];
LDX 0, i 
LDA vector, x
STA lFirst, d

;for (lCount = 0; lCount < size - 1;

LDX 0, i
STX lCount, d

loop:    LDA lCount, d
         SUBA size, d  ;compairs to size - 1
         ADDA 1, i     
         BRGE done, i

;vector[lCount] = vector[lCount + 1];
         LDX lCount, d
         ADDX 1, i
         ASLX
         LDA vector, x
         LDX lCount, d
         ASLX
         STA vector, x
         
;lCount++)
         LDA lCount, d
         ADDA 1, i
         STA lCount, d
         BR loop, i

;vector[size - 1] = lFirst;

done:    LDX size, d
         SUBX 1, i
         ASLX
         LDA lFirst, d
         STA vector, x
STOP

;;-----
;;DATA

size:    .BLOCK 2
vector:  .BLOCK 40
lFirst:  .BLOCK 2
lCount:  .BLOCK 2
.END


