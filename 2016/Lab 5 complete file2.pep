;;Java translation of list elements
;;by Nathan Pelletier
;;Started on October 22
;;Finished on November 7
;;
;;Asks user for how large there list will be and then it asks the user
;;to fill there list with numbers. Then asks user to rearange said set of 
;;numbers using the commands L(rotates numbers left), 
;;R(rotates numbers right), E(exchanges elements in list) and Q
;;(to exit said program).

;;Using pre-existing functions to divide work initially 
;;My work list to do is:
;;       set up intital commenting (22)
;;       copy code to java (22)
;;       gain firm grasp of what program does in java (22)
;;       Global variables vs local variables (22)
;;       initialize inVect: (23)
;;               subdivde inVect into easy tasks (22)
;;               finish up code for inVect(23)
;;       prinVect: (23)
;;       rotLeft: (24)
;;       rotRight: (24)
;;       exchange: (24)
;;       main:     (30)
;;       Set up stack pointer for local variables in each case (2)
;;       set up heap correctly(1)
;;       general bug fixes (30)
;;       (because a program this big is bound to have some good ones)
;;       fixed mains use of perameters vs local variables(ugg) (7)

;;NOTE: don't start using local variables until the classes are done
;;only tested classes are to be put in this file.

;;FINAL NOTE: NATHAN YOU DON'T HAVE TO TACKEL A PROBLEM AS A WHOLE, SUBDIVIDE
;;UNTIL IT IS MANAGEABLE, EVEN THE DIVISIONS YOU PLACED HERE CAN BE BROKEN UP

CALL main, i
STOP
;;GLOBAL VARIABLES
;;================
MAXLEN:  .EQUATE 20

;;JUMP TABLE (for switch in main)
;;===============================
switch:  .ADDRSS caseE       ;e
         .ADDRSS default       ;f
         .ADDRSS default       ;g
         .ADDRSS default       ;h
         .ADDRSS default       ;i
         .ADDRSS default       ;j
         .ADDRSS default       ;k
         .ADDRSS caseL       ;l
         .ADDRSS default       ;m
         .ADDRSS default       ;n
         .ADDRSS default       ;o
         .ADDRSS default       ;p
         .ADDRSS caseQ       ;q
         .ADDRSS caseR       ;r

;;new
;;===
;;A = # of bytes required 
;;X = will have start of allocated bytes
new:     LDX heapPtr, d
         ADDA heapPtr, d
         STA heapPtr, d
         RET0


;;inVect(size, vector)
;;======
;;local variables
inCount: .EQUATE 0;#2d
size1:   .EQUATE 4
vector1: .EQUATE 6

; for (inCount = 0; inCount < size; 
inVect:  SUBSP 2, i ;alloc #inCount
         LDA 0, i
         STA inCount, s
loop1:   CPA size1, s
         BRGE done1, i
;System.out.print("\["\ + (inCount + 1) + "\] :"\);
         STRO brct1, d

         LDA inCount, s
         ADDA 1, i
         STA inCount, s ;if I could use accumulator or index register 
         DECO inCount, s ;directly I would but instead I have to 
         SUBA 1, i ;affect and fix memory.
         STA inCount, s

         STRO brct2, d
;vector[inCount] = input.nextInt();
         LDX inCount, s ;use index register to index into memory
         ASLX ;times number in index by two to acsess memory correctly
         DECI vector1, sxf
;inCount++)
         LDA inCount, s
         ADDA 1, i
         STA inCount, s
         BR loop1, i

done1:   ADDSP 2, i ;dealloc #inCount
         RET0


;;prinVect(size, vector)
;;========
;;local variables
counter: .EQUATE 0 ;#2d
size2:   .EQUATE 4
vector2: .EQUATE 6

;int counter 
prinVect:SUBSP 2, i ;alloc #counter
         LDA 0, i
         STA counter, s

;for (counter = 0; counter < size;
         LDX 0, i
         STX counter, s
loop2:   LDX counter, s 
         CPX size2, s
         BRGE done2, i

;System.out.print(vector[counter] + "\ "\);
         ASLX ;multiply by 2 to find correct memory
         DECO vector2, sxf
         STRO space, d

;counter++)
         LDX counter, s
         ADDX 1, i
         STX counter, s
         BR loop2, i
;System.out.println();

done2: STRO enter, d
       ADDSP 2, i;dealloc #counter
       RET0
 

;;rotLeft(size, vector)
;;=======
;;local variables
lFirst:  .EQUATE 0;#2d
lCount:  .EQUATE 2;#2d
size3:   .EQUATE 6
vector3: .EQUATE 8

;int lFirst int lCount 
rotLeft: SUBSP 4, i ;alloc #lCount #lFirst
         LDA 0,i
         STA lFirst, s
         STA lCount, s

;lFirst = vector[0];
         LDX 0, i 
         LDA vector3, sxf
         STA lFirst, s

;for (lCount = 0; lCount < size - 1;

         LDX 0, i
         STX lCount, s

loop3:   LDA lCount, s
         SUBA size3, s ;compairs to size - 1
         ADDA 1, i 
         BRGE done3, i

;vector[lCount] = vector[lCount + 1];
         LDX lCount, s
         ADDX 1, i
         ASLX
         LDA vector3, sxf
         LDX lCount, s
         ASLX
         STA vector3, sxf
;lCount++)
         LDX lCount, s
         ADDX 1, i
         STX lCount, s
         BR loop3, i

;vector[size - 1] = lFirst;

done3:   LDX size3, s
         SUBX 1, i
         ASLX
         LDA lFirst, s
         STA vector3, sxf
         ADDSP 4, i ;dealloc #lFirst #lCount
         RET0


;;rotRight(size, vector)
;;========
rLast:  .EQUATE 0;#2d
rCount:  .EQUATE 2;#2d
size4:   .EQUATE 6
vector4: .EQUATE 8

;int rLast int rCount 
rotRight:SUBSP 4, i ;alloc #rCount #rLast
         LDA 0,i
         STA rLast, s
         STA rCount, s

;rLast = vector[size - 1];
         LDX size4, s
         SUBX 1, i
         ASLX
         LDA vector4, sxf
         STA rLast, s

;for (rCount = size - 1; rCount > 0;
         LDA size4, s
         SUBA 1, i
         STA rCount, s

loop4:   LDX rCount, s
         CPX 0, i
         BRLE done4, i

;vector[rCount] = vector[rCount - 1];
         LDX rCount, s
         SUBX 1, i
         ASLX
         LDA vector4, sxf
         LDX rCount, s
         ASLX
         STA vector4, sxf

;rCount--)
         LDX rCount, s
         SUBX 1, i
         STX rCount, s
         BR loop4, i

;vector[0] = rLast;

done4:   LDX 0, i
         ASLX
         LDA rLast, s
         STA vector4, sxf
         ADDSP 4, i ;dealloc #rLast #rCount
         RET0


;;exchange(size, vector, loc1, loc2)
;;========
;;local variables
temp:    .EQUATE 0;#2d
size5:   .EQUATE 4
vector5: .EQUATE 6
loc1:    .EQUATE 8
loc2:    .EQUATE 10

;;DEV NOTE, IF STATEMENT USES && LIKE CRAZY THEREFORE 
;;CAN USE A CONSTANT DONE IF THE STATEMENTS PROVE 
;;FALSE AT ANY POINT 

; if(loc1 >= 0 
exchange:SUBSP 2, i; alloc #temp
         LDA loc1, s 
         CPA 0, i
         BRLT done5, i
; && loc1 < size
         LDA loc1, s
         CPA size5, s
         BRGE done5, i
; && loc2 >= 0 
         LDA loc2, s
         CPA 0, i
         BRLT done5, i
; && loc2 < size
         LDA loc2, s
         CPA size5, s
         BRGE done5, i
;int temp = vector[loc1]
         LDX loc1, s
         ASLX
         LDA vector5, sxf
         STA temp, s
;vector[loc1] = vector[loc2]
         LDX loc2, s
         ASLX
         LDA vector5, sxf
         LDX loc1, s
         ASLX
         STA vector5, sxf
;vector[loc2] = temp
         LDA temp, s
         LDX loc2, s
         ASLX
         STA vector5, sxf

done5:   ADDSP 2, i ;dealloc #temp
         RET0


;;main
;;====
;;local variables
size:    .EQUATE 0 ;#2d
vector:  .EQUATE 2 ;#2h 
;num1:     .EQUATE 4 
;num2:     .EQUATE 6 
;command:  .EQUATE 8 
;donFlg:   .EQUATE 10

;public static void main(String[] args) int[] vector;
main:    SUBSP 4, i ;alloc #vector #size 
         LDA 0, i 
         STA heap, d
;int size;
         LDA 0, i
         STA size, s
;System.out.print("\How big is your vector? "\);
         STRO prompt1, d
;size = input.nextInt();
         DECI size, s
;if{
         ;size > 0 &&
         LDA size, s
         CPA 0, i
         BRLE else0, i
         ;size <= MAXLEN
         LDA size, s
         CPA MAXLEN, i
         BRGT else0, i
         ;vector = new int[size] 
         LDA size, s
         ASLA ;correct for memory size
         CALL new, i 
         STX vector, s
;;this line of code creates the heap end pointer         
         
         ;inVect(size, vector)
         size0:  .EQUATE 0 ;#2d
         vector0:.EQUATE 2 ;#2h
     
         SUBSP 4, i ;alloc #vector0 #size0
         LDA 4, s ;size on stack (to many variables already)
         STA size0, s
         LDA 6, s ;vector on stack
         STA vector0, s
         CALL inVect, i
         ADDSP 4, i ;dealloc #size0 #vector0
         BR doneIf0, i
;}//if

;else{
         ;System.out.print("\That size is not valid. It must \")
else0:   STRO error1, d         
         
         ;System.out.print("be positive and less than \")
         STRO error2, d
         ;System.out.println(MAXLEN)
         DECO MAXLEN, i
         ;return;
         ADDSP 4, i ;dealloc #size #vector
         RET0
;}//else 

;prinVect(size, vector
;size0:  .EQUATE 0
;vector0:.EQUATE 2
doneIf0: SUBSP 4, i ;alloc #vector0 #size0
         LDA 4, s ;size on stack (to many variables already)
         STA size0, s
         LDA 6, s ;vector on stack
         STA vector0, s
         CALL prinVect, i
         ADDSP 4, i ;dealloc #size0 #vector0
;char command
command: .EQUATE 0 ;#2d
num1:    .EQUATE 2 ;#2d
num2:    .EQUATE 4 ;#2d
donFlg:  .EQUATE 6 ;#2d

         SUBSP 8, i ;alloc #donFlg #num2 #num1 #command 
         LDA 0, i                ;clearing upper register
         STA command, s           ;looking back this does nothing
;int num1, num2
         STA num1, s
         STA num2, s
;boolean doneFlag = false
         STA donFlg, s       ;false if 0, True if != 0 
;while (!doneFlag){
while0:          LDA donFlg, s
                 CPA 0, i 
                 BRNE dneWhil, i          
         ;System.out.print("Enter command. L = left R = right\")
                 STRO prompt2, d
         ;System.out.print(" E = exchange Q = quit \")
                 STRO prompt3, d
         ;command = input.next().charAt(0)
                 LDA 0, i
bad_char:        CHARI command, s
         ;switch(command){
                 LDBYTEX command, s
                 CPX 0x0A, i    ;;0A is enter in hex
                 BREQ bad_char, i  ;fixes enter glitch
                 CPX ' ', i
                 BREQ bad_char, i ;fixes space glitch

;;needs to take only capitols and then subtract by E
;;check to see if negitive or bigger than R 
;;multiply by two to make the memory line up

                 CPX 'R', i
                 BRGT cap, i
capdne:          SUBX 'E', i
                 CPX 0, i
                 BRLT default, i ;anything negitive was lower than E 
                 ASLX 
                 BR switch, x

cap:             SUBX 0x20, i ;a becomes A
                 CPX 'R', i
                 BRGT default, i
                 BR capdne, i
                

                 ;case \'L\':     ;;using only uppercase,
                                  ;;to avoid menomic error
                 ;case \'l\':     ;;or doubling of code
                                  ;;in switch table

                          ;rotLeft(size, vector):
;size0:  .EQUATE 0
;vector0:.EQUATE 0
caseL:                      SUBSP 4, i ;alloc #vector0 #size0
                            LDA 12, s ;size on stack
                            STA size0, s
                            LDA 14, s ;vector on stack
                            STA vector0, s
                            CALL rotLeft, i
                            ADDSP 4, i;dealloc #size0 #vector0
                          ;break
                            BR break, i 
                 ;case \'R\':
                 ;case \'r\':
                    
                          ;rotRight(size, vector);
caseR:                       SUBSP 4, i ;alloc #vector0 #size0
                             LDA 12, s ;size on stack
                             STA size0, s
                             LDA 14, s ;vector on stack
                             STA vector0, s
                             CALL rotRight, i
                             ADDSP 4, i ;dealloc #size0 #vector0
                          ;break;
                             BR break, i
                 ;case \'E\':
                 ;case \'e\':
                   
                          ;System.out.print(\"Exchange which 2\");
caseE:                       STRO prompt4, d   
                          ;System.out.println(\" locations? \");
                             STRO prompt5, d
                          ;num1 = input.nextInt();
                             DECI num1, s
                          ;num2 = input.nextInt();
                             DECI num2, s
                          ;exchange(num1, num2, size, vector);
;size0:  .EQUATE 0
;vector0:.EQUATE 2
num1_0:  .EQUATE 4;#2d
num2_0:  .EQUATE 6;#2d
                             SUBSP 8, i ;alloc #num2_0 #num1_0 #vector0 #size0
                             LDA 16, s ;size on stack 
                             STA size0, s
                             LDA 18, s ;vector on stack
                             STA vector0, s
                             LDA 10, s ;num1 on stack
                             STA num1_0, s
                             LDA 12, s ;num2 on stack
                             STA num2_0, s
                             CALL exchange, i
                             ADDSP 8, i ;dealloc #size0 #vector0 #num1_0 #num2_0
                          ;break;
                             BR break, i

                 ;case \'Q\':                
                 ;case \'q\':
                   
                         ;System.out.println(\"Bye bye\");
caseQ:                       STRO endmsg, d 
                        ;doneFlag = true;
                             LDA 1, i
                             STA donFlg, s
                        ;break;
                             BR while0, i
                 ;default:
                    
                       ;System.out.println("Try Again\");
default:                    STRO prompt6, d
         ;}//switch

         ;prinVect(size, vector);
;size0:  .EQUATE 0
;vector0:.EQUATE 0
break:           SUBSP 4, i ;alloc #vector0 #size0
                 LDA 12, s ;size on stack
                 STA size0, s
                 LDA 14, s ;vector on stack
                 STA vector0, s
                 CALL prinVect, i
                 ADDSP 4, i ;dealloc #size0 #vector0
                 BR while0, i
;}//while
    
;}//main
dneWhil: ADDSP 12, i;dealloc #command #num1 #num2 #donFlg #size #vector
         RET0
         

;;DATA
;;====
;;main
prompt1: .ASCII "How big is your vector? \x00"
error1:  .ASCII "That size is not valid. It must \x00"
error2:  .ASCII "be positive and less than \x00"
prompt2: .ASCII "Enter command. L = left R = right\x00"
prompt3:  .ASCII " E = exchange Q = quit \x00"
prompt4: .ASCII "Exchange which 2\x00"
prompt5: .ASCII " locations? \n\x00"
endmsg:  .ASCII "Bye bye\x00"
prompt6: .ASCII "Try Again\n\x00"

;;inVect
brct1: .ASCII "[\x00" 
brct2: .ASCII "] :\x00"

;;prinVect
space: .ASCII " \x00"
enter: .ASCII "\n\x00"

;;new
heapPtr: .ADDRSS heap
heap:  .BLOCK 1
.END