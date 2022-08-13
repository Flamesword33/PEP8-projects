         BR main, i 
;;------------------------------------
;;sumDo
;;Asks for 2 intergers in stack and gives a sum to stack

;;Local offsets for stack variables for sumDo
num1:    .EQUATE 0
num2:    .EQUATE 2
sum:     .EQUATE 4

sumDo:   SUBSP 6, i                   ;local Perameter Space
         DECI num1, s                 ;num1 = userNumbers.nextInt()
         DECI num2, s                 ;num2 = userNumbers.nextInt()

;sum = num1 + num2
         LDA num1, s
         ADDA num2, s
         STA sum, s

         ADDSP 6, i                  ;release local perameters
         RET0                        ;puts return address
;;----------------------------------------------------

;;main
;;
;;simple call to print the answer from the method sumDo

main:    STRO message, d
         CALL sumDo 
         DECO -4, s

         STOP

;;Global data
;;-----------
message: .ASCII "Sum: \x00"

.END