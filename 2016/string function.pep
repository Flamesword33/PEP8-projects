;; AUCSC 250 
;; 30 Sept 2016
;;
;; Code for STRO assumming we don't have STRO
;;

LDX 0, i                     ;start counter in index
next_chr: LDBYTEA somth, x   ;loads letter into accumulator
BREQ done, i                 ;checks and stops if charo is zero

CHARO somth, x               ;print single char
ADDX 1, i                    ;increment through letters
BR next_chr, i               ;while loop

done: STOP


; Data for testing
;-----------------
small: .ASCII "A\x00"
nothing: .ASCII "\x00"
somth: .ASCII "ZZZZZ\x00"
big: .ASCII "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz!@#$%^&*(()(:\x00"

.END