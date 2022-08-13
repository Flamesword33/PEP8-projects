;;Program that starts with an array on the heap 

;;has a function that increments an array by 10

;;Main will call this function, after getting a size 
;;from the user
CALL main, i
STOP

;;=================================================
;;new
;; preconditions: A must have # bytes required 
;; postconditions: X will have start of allocated bytes

new:     LDX heapPtr, d ;Location of alloc
         ADDA heapPtr, d ;New loc of free space
         STA heapPtr, d
         RET0


;;=================================================
;;incArr(array, incAmt, arrSize)
;;       increments every entry in array by 
;;       the incAmt.
;;       arrSize tells us how big the array is
array2:   .EQUATE 6
incAmt2:  .EQUATE 4
arrSize2: .EQUATE 2

;loop through each element of the array 
;incrementing each as we go
incArr:  LDX 0, i
while:   CPX arrSize2, s
         BRGE doneWhil, i
         
;increment array to new position
         ASLX ;2 byte ingergers
         LDA array2, sxf
         ADDA incAmt2, s
         STA array2, sxf

;increment index reg and loop again
         ASRX ; resore index number
         ADDX 1, i
         BR while, i
doneWhil:RET0
;;================================================
;;main

;local variables
INC:     .EQUATE 10
inSize:  .EQUATE 0; #2d
arrAdr:  .EQUATE 2; #2h

main:    SUBSP 4, i ;#arrAdr #inSize
;GET SIZE FROM USER 
         DECI inSize, s

         ;get room for array
         LDA inSize, s
         ASLA ; 2 bytes per int
         CALL new, i
         ;x has address of our array
         ;need to store address on the stack
         STX arrAdr, s

;already on stack
arrAdr1: .EQUATE 8
inSize1: .EQUATE 6
;new on stack 
array:   .EQUATE 4; #2h
incAmt:  .EQUATE 2; #2d
arrSize: .EQUATE 0; #2d

         SUBSP 6, i ;#array #incAmt #arrSize
         ;pushes array
         LDA arrAdr1, s
         STA array, s 
         ;push incAmt
         LDA INC, i
         STA incAmt, s
         ;push arrSize
         LDA inSize1, s
         STA arrSize, s
;CALL INCARR
         CALL incArr, i 
         ;pop parameters
         ADDSP 6, i ;#arrSize #incAmt #array
         NOP0
         ADDSP 4, i ;#inSize #arrAdr
         RET0
         
         
;;================================================
;;heap

;;=================================================
;;data
heapPtr: .ADDRSS heap
heap:    .BLOCK 1
.END