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
;; bonus: (ran out of time) 
;;       1. add an abs to keep average working with negitives
;;       2. create a divide function that works for all numbers                    


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
LDA tot, d
ASRA
ASRA
ASRA     ;2^3 = 8
BRC carry, i
back:    STA tot, d
STRO average, d
DECO tot, d
STOP

carry:   ADDA 1, i
         BR back, i

;DATA
;----
num:     .BLOCK 2
var:     .BLOCK 2
tot:     .BLOCK 2
prompt:  .ASCII "Please enter up to 8 numbers one at a time to be averaged. \n\x00"
int:     .ASCII "Interger \x00"
average: .ASCII "Average: \x00"

.END
