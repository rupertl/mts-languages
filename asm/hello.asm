* Hello world program in System/360 assembly language
HELLO    START 0                  PROGRAM AT RELATIVE ADDRESS 0
         USING HELLO,12           R12 WILL CONTAIN PROGRAM ADDR
         LR    12,15              LOAD R12 WITH ABSOLUTE ADDR
         L     3,RUNS             LOAD R3 WITH NUMBER OF RUNS
LOOP     SPRINT 'Hello, world!'   PRINT THE MESSAGE
         S     3,DECR             DECREMENT R3
         BP    LOOP               IF R3 POSITIVE, LOOP AGAIN
         SYSTEM                   EXIT PROGRAM
RUNS     DC    F'5'               NUMBER OF RUNS TO MAKE
DECR     DC    F'1'               DECREMENT FOR LOOP
         END   HELLO              END OF CODE
