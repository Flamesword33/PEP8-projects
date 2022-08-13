LDA      0x0011 ,d           ;A <- first number
ADDA     0x0013 ,d           ;Add the two numbers
ORA      0x0015 ,d           ;Convert sum to character
STBYTEA  0x0010 ,d           ;Store the character
CHARO    0x0010 ,d           ;Output the character
STOP
.BLOCK   1                   ;Character to output
.WORD    9                   ;Decimal 5
.WORD    5                   ;Decimal 3
                             ;ex 5 + 3 = 8
.WORD    0x0030              ;Mask for ASCII char
.END
