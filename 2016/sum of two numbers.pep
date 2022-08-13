;;Program asks for two integers and prints their sum
;;
;;By AUCSC 250
;;27 Sept 2016
;;
;;For OS:  PEP/8
;;
;;Notes:  will give error message if sum out of range
;;        DECI is used, which allows number that are
;;          too big to be entered, without telling anyone
;;

;Get two integers
STRO getInput, d ;Prompt to user
DECI int1, d ;Get first number
DECI int2, d ;Get second number

;Add the integers
LDA int1, d ;Get the first integer
ADDA int2, d ;Add 2nd integer

;Print the result as long as no overflow
BRV overflow, i ;don't print if overflow 
STA sum, d ;Store answer
STRO sumOf, d ;Start message
DECO int1, d
STRO and, d
DECO int2, d
STRO is, d
DECO sum, d
CHARO '.', i ;Someone wanted a period at the end 

STOP

;overflow stuff
overflow: STRO overMSG, d ;Just print error message

STOP

;Data
int1: .WORD 0
int2: .WORD 0
sum: .WORD 0
getInput: .ASCII "Please enter two integers.\x00"
sumOf: .ASCII "The sum of \x00"
and: .ASCII " and \x00"
is: .ASCII " is \x00"
overMSG: .ASCII "The sum is TOO big.\x00"

.END