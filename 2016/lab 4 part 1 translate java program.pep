;; Translate adding magnitude from java
;; by Nathan Pelletier
;; Oct 11, 2016
;;
;; Takes a number and loops x times, asking for numbers until 
;; the number of numbers entered equals x. It then will find the 
;; abs(#) value of the numbers entered and return the sum of the numbers.

;; Steps to take:
;;       Translate code to Assembly
;;               User interface(having problems setting variables)
;;               for loop to add numbers
;;               absVal
;;               ensure data is stored correctly
;;               use stack pointer to store local variable for absVal

 

BR main, i

;;GLOBAL VARIBLES
;;-------------------------------------------------------------
x: .EQUATE 0

;;absVal
;;-----------------------------------------------------------
;;takes a number inputed by user and ensures it is positive
;;returns a positive number

absVal:  SUBSP 2, i          ;make room for local varibles
         STA x, s           ; absVal(int x) ;;loaded inNum to accumulator
                            ; and now using STA to local varible
         CPA 0, i
         BRGE return, i      ;if(x < 0)
         ;x = -x
         ;------
         LDA x, s
         NEGA
         STA x, s
return:  ADDSP 2, i       ;decrement to ensure next pass is in same place  

         RET0 

;;main
;;-------------------------------------------------------
;;Initializes totNum, inNum, sum. Takes an initial number to 
;; tell the program how many times to run.
;;
main:    STRO prompt, d      ;??? initialize totNum, inNum, sum, i ??? 
                             ;not sure if java would do anything here
         DECI totNum, d  ;totNum
         
;; for(i = 1; i <= totNum; i++)
;;--------------------------------------------------------
         LDA 1, i
         STA i, d
loop:            LDA i, d    ;need for second pass
                 CPA totNum, d    
                 BRGT done, i     
         
                 STRO prompt2, d
                 DECO i, d
                 CHARO ':', i
                 CHARO ' ' , i  
                                       
                 DECI inNum, d    
                 LDA inNum, d     ;ensures inNum is in accumulator 
                                  ;when the next function needs it
                 CALL absVal      ;branching to absVal and returning
                                  ;a positive inNum

                 ;sum = sum + absVal(inNum);
                 LDA sum, d       
                 ADDA -4, s        
                 STA sum, d
                 
                 ;i++
                 LDA i, d
                 ADDA 1, i        
                 STA i, d
                 BR loop, i
                 ; incriment through inNum
                 ;sum = sum + absVal(inNum);
done:    STRO answer, d
         DECO sum, d
STOP

;DATA
totNum:  .BLOCK 2
inNum:   .BLOCK 2
sum:     .BLOCK 2
i:       .BLOCK 2
prompt:  .ASCII "How many numbers will you enter? \x00"
prompt2: .ASCII "Please enter number \x00"
answer:  .ASCII "The sum of the magnitudes is: \x00"

.END
         