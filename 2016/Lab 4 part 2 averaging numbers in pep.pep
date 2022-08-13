;; Enter eight intergers 
;;
;; by Nathan Pelletier
;; Oct 11 ,2016
;; 
;; Please use the terminal I/O when using this program
;; Prints out which number the user is on and the average of all numbers 
;; when the user is done, rounded to the nearest decimal 
;; 3.5 = 4, 3.4 = 3

;; a few parts to this one:
;;       1. interface (includes 8 reserved numbers)
;;       2. a way to keep track of which number we are on
;;       3. a way to find the total sum given
;;       4. an average function that rounds correctly 
;; bonus: 
;;(ran out of time)1. add an abs to keep 
;;               average working with negitives
;;       2. design a universal divide function  

;;still need to fix up the divide                    


;;CODE STARTS
;;----------------------------------
LDA 1, i                   
STA num, d                   
STRO prompt, d   ;asks for input

loop:    STRO int, d      ;Integer
         DECO num, d      ;counting number
         CHARO ':', i     
         DECI var, d      ;the eight numbers the user will input
         LDA tot, d
         ADDA var, d         ;tot = tot + var
         STA tot, d          

         LDA num, d       ;num++
         ADDA 1, i        
         STA num, d

         SUBA 8, i        ;round about compairson of accumulator to eight

;should be negitive if 1-8 = -7 and the program incements early
BRLE loop, i    ;meaning that 8 - 8 = 0 still has one loop left 

;;Average function
;;----------------
;; divides denominator into factors of two and then divides numerator using
;; same perameters
  
LDA 1, i
STA var, d       ;reuses var as a counting variable
LDA num, d
SUBA 1, i        ;left at one higher than eight
STA num, d

average: ASRA 
         BRC divide, i    ;second loop to divide total
         LDA var, d       ;var++
         ADDA 1, i
         STA var, d
         LDA num, d       ;check if done     
         BRGT average, i

STOP

divide:  LDX var, d        ;need to decrement without affecting var
         LDA tot, d
         ASRA
         SUBX 1, i

         BRC carry, i        ;checks for a carry bit and sets car

return:  CPX 0, i
         BRGT divide, i      ;checks if var is still good and loops back in
         ADDA ave, d
         STA ave, d          ;adds all divisions of tot
         BR average, i       ;done dividing, continue dividing divisor
         
carry:   LDA 1, i
         STA car, d
         BR return, i

;DATA
;----
car:     .BLOCK 2
num:     .BLOCK 2
var:     .BLOCK 2
tot:     .BLOCK 2
ave:     .BLOCK 2
prompt:  .ASCII "Please enter up to 8 numbers one at a time to be averaged. \n\x00"
int:     .ASCII "Interger \x00"

.END
