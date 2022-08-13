04 00 0E       ;branch to get user input
00 00          ;x (03)
00 00          ;y (05)
00 00          ;user input (07)
45 52 52 4F 52 ;ERROR (09)

31 00 07       ;get user input (0E)
C1 00 07       ;load user input (11)
B1 00 03       ;compair user input to x (14)

10 00 1E       ;branch if user input > x to load 0, store y, 'enter' (17)
08 00 48       ;branch if user input < x to print error (1A)

00             ;x is equal to user input (1D)

C0 00 00       ;load 0 (1E)
E1 00 05       ;store to y (21)
50 00 0D       ;charo "enter" ,d (24)
C1 00 03       ;load x (27)
70 00 01       ;x++ (2A)
E1 00 03       ;store x (2D)

50 00 2A       ;charo '*' ,d (30)
C1 00 05       ;load y (33)
70 00 01       ;y++ (36)
E1 00 05       ;store y (39)
C1 00 03       ;load x (3C)
B1 00 05       ;compair x to y (3F)
10 00 30       ;branch if x > y to '*', load y, y++ (42)

0A 00 11       ;branch if x = y to load user input (45)

41 00 09       ;print error (48)

zz