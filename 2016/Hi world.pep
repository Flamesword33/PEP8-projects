;Prints hi world 
;look up chart for word reservation
;        0004 1
;        0007 2
;        000A 3
; therefore 001C 9
;MY HYPOTHOSIS WAS CORRECT!!!

CHARO 0x001C ,d
CHARO 0x001D ,d
CHARO 0x001E ,d
CHARO 0x001F ,d
CHARO 0x0020 ,d
CHARO 0x0021 ,d
CHARO 0x0022 ,d
CHARO 0x0023 ,d
CHARO 0x0024 ,d

STOP
.ASCII "Hi World!"
.END