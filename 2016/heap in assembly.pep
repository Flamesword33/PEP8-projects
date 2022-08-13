;;Make 3 arrays with size 5 on the heap

;;Specifically:
;;Asks user for values of the first 2 arrays
;;in main method

;;Write a sumArys method that
;;makes a 3rd array that contains the element-sum of 
;;the other 2 arrays

CALL main, i
STOP

;-----------------
;new
; Pre: A must contain the # bytes we want
; Post: X will have address where our bytes are located
;
; heapPtr will move along
;
new:     LDX heapPtr, d
         ADDA heapPtr, d
         STA heapPtr, d
         RET0

;----------------
;sumArys

;----------------
;main

;local variables
SIZE:   .EQUATE 5
array1: .EQUATE 0 ;#2h
index:  .EQUATE 2 ;#2d

main:    SUBSP 4, i ;alloc #index #array1 

;;get space on heap for array
LDA SIZE, i      ;set up a acc for call to new
ASLA
CALL new, i
STX array1, s ;store address of array onto stack

LDX 0, i
STX index, s

loop:    ASLX
         DECI array1, sxf
         
         LDX index, s
         ADDX 1, i
         STX index, s
         
         CPX SIZE, i
         BRLT loop, i

ADDSP 4, i ;dealloc #array1 #index
;----------------
;heap
heapPtr: .ADDRSS heap 
heap:    .BLOCK 1 ;no code after this
.END