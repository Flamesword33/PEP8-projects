;;inVec translation

;Initialize variables
LDA 5, i
STA size, d
LDA 0, i
STA inCount, d

;;---------------------
;;CODE STARTS HERE

; for (inCount = 0; inCount < size;
LDA 0, i
STA inCount, d
loop:    CPA size, d
         BRGE done, i
;System.out.print("\["\ + (inCount + 1) + "\] :"\);
         STRO brct1, d

         LDA inCount, d
         ADDA 1, i
         STA inCount, d ;if I could use accumulator or index register 
         DECO inCount, d ;directly I would but instead I have to 
         SUBA 1, i       ;affect and fix memory.
         STA inCount, d

         STRO brct2, d
;vector[inCount] = input.nextInt();
         LDX inCount, d ;use index register to index into memory
         ASLX  ;times number in index by two to acsess memory correctly
         DECI vector, x
         
;inCount++)
         LDA inCount, d
         ADDA 1, i
         STA inCount, d
         
         BR loop, i

done:    STOP
;Data
size:    .BLOCK 2
vector:  .BLOCK 40
inCount: .BLOCK 2
brct1:   .ASCII "[\x00" 
brct2:   .ASCII "] :\x00"
.END