;;ROTRIGHT(SIZE, VECTOR)

;;rLast rCount

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

;int rLast int rCount
LDA 0,i
STA rLast, d
STA rCount, d

;rLast = vector[size - 1];
LDX size, d
SUBX 1, i
ASLX
LDA vector, x
STA rLast, d

;for (rCount = size - 1; rCount > 0;
LDA size, d
SUBA 1, i
STA rCount, d

loop:    LDX rCount, d
         CPA 0, i
         BRLE done, i

;vector[rCount] = vector[rCount - 1];
         LDX rCount, d
         SUBX 1, i
         ASLX
         LDA vector, x
         LDX rCount, d
         ASLX
         STA vector, x

;rCount--)
         LDA rCount, d
         SUBA 1, i
         STA rCount, d
         BR loop, i

;vector[0] = rLast;

done: LDX 0, i
ASLX
LDA rLast, d
STA vector, x
STOP

;;-----
;;DATA

size: .BLOCK 2
vector: .BLOCK 40
rLast: .BLOCK 2
rCount: .BLOCK 2
.END
