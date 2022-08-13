;;PRINVECT

;;USES SIZE AND VECTOR
;;counter

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

;int counter
LDA 0, i
STA counter, d

;for (counter = 0; counter < size;
LDX 0, i
STX counter, d
loop:    LDX counter, d
         CPX size, d
         BRGE done, i

;System.out.print(vector[counter] + "\ "\);
         ASLX ;multiply by 2 to find correct memory
         DECO vector, x
         STRO space, d

;counter++)
         LDX counter, d
         ADDX 1, i
         STX counter, d
         BR loop, i
;System.out.println();

done:    STRO enter, d
STOP
;;----------------
;;DATA 
size:    .BLOCK 2
vector:  .BLOCK 40
counter: .BLOCK 2
space:   .ASCII " \x00"
enter:   .ASCII "\n\x00"
.END
