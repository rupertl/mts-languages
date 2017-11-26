************************************************************
* Program to encode a plain-text message in MESSAGE using
* a Caesar cipher with offset KEY, then decode it again.
************************************************************
CAESAR   START 0                  Program at relative address 0
         USING CAESAR,12          R12 will contain program addr
         LR    12,15              Load R12 with absolute addr
*
* Encode the plain-text message to ENC
         MVC   WORK,MESSAGE       Copy message to WORK
         L     0,KEY              Set key
         CALL  ROT                Encode the message
         MVC   ENC,WORK           Copy encoded message to ENC
*
* Decode the encoded message to DEC
         L     0,KEY              Set the key
         LNR   0,0                Negate the key for decoding
         CALL  ROT                Decode the message
         MVC   DEC,WORK           Copy decoded message to DEC
*
* Print results and exit
         SPRINT MESSAGE           Print the original message
         SPRINT ENC               Print the decoded message
         SPRINT DEC               Print the encoded message
         SYSTEM                   Exit program
*
* ROT subroutines implements Caesar cipher message letter rotation
*
* Parameters:
* R0 - Key for cipher. 1 to 25 to encode, -1 to -25 to decode
* WORK - Buffer containing message to encode/decode of length MSGLEN
*        Will be overwritten with encoded/decoded message
* Return values:
* None
*
         ENTRY ROT                Subroutine entry for ROT
ROT      ENTER 12,SA=RSAVE        Use R12 for base address
         TR    WORK,OFFSETS       Translate letters into offsets
         L     1,=F'0'            Loop start value
         L     2,=F'1'            Loop increment
         LA    3,L'MESSAGE-1      Loop final value
LOOP     IC    4,WORK(1)          Get message byte at loop index
         C     4,MAXOFF           Is it an offset?
         BH    STORE              If no, don't change it
         LA    10,FLAT            Load base of flat letter array
         AR    10,0               Add the key displacement
         IC    4,0(4,10)          Fetch into R4 FLAT+KEY+OFFSET
STORE    STC   4,WORK(1)          Store char back into work
         BXLE  1,2,LOOP           Loop if index <= final
         EXIT
*
* Inputs to program
*
MESSAGE  DC    C'THE FIVE BOXING WIZARDS JUMP QUICKLY!'
KEY      DC    F'7'
*
* Working buffers
*
ENC      DS    CL(L'MESSAGE)
DEC      DS    CL(L'MESSAGE)
WORK     DS    CL(L'MESSAGE)
RSAVE    DS    18F                Save area
*
* Constants and tables
*
* Offset table. Translates 'A' into 0, 'B' 1 etc up to
* Z = 25. All other characters translate to themselves.
OFFSETS  DC    256AL1(*-OFFSETS)
         ORG   OFFSETS+C'A'
         DC    X'000102030405060708'
         ORG   OFFSETS+C'J'
         DC    X'090A0B0C0D0E0F1011'
         ORG   OFFSETS+C'S'
         DC    X'1213141516171819'
         ORG
MAXOFF   DC    F'25'
* Flat index table. Flat[0] gives 'A' etc.
* A pointer to the start of FLAT can be shited
* forwards or backwards to give a rotated alphabet,
* hence FLAT0 before FLAT and FLAT1 afterwards.
FLAT0    DC    C'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
FLAT     DC    C'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
FLAT1    DC    C'ABCDEFGHIJKLMNOPQRSTUVWXYZ'
*
         END   CAESAR             End of code
