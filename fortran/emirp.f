C
C     PROGRAM TO DISPLAY EMIRPS
C
C     *** TEST IF A NUMBER IS PRIME ***
      LOGICAL FUNCTION PRIME(N)
      INTEGER N
C     DEAL WITH NUMBERS <= 3
      IF (N .LE. 1) GOTO 200
      IF (N .EQ. 2 .OR. N .EQ. 3) GOTO 100
C     CHECK IF DIVISIBLE BY 2 OR 3
      IF (MOD(N,2) .EQ. 0) GOTO 200
      IF (MOD(N,3) .EQ. 0) GOTO 200
C     SEE IF DIVISIBLE BY 5, 7, ..., UP TO APPROX SQRT(N)
 10   DO 20 I=5,999999,2
         IF (I*I .GT. N) GOTO 100
         IF (MOD(N,I) .EQ. 0) GOTO 200
 20   CONTINUE
 100  PRIME = .TRUE.
      RETURN
 200  PRIME = .FALSE.
      RETURN
      END
C
C     *** REVERSE AN INTEGER'S DIGITS ***
      INTEGER FUNCTION REVRSE(N)
      INTEGER N
      INTEGER M,R
C     M IS COPY OF N FROM WHICH WE TAKE DIGITS
C     R IS REVERSED DIGITS
      M = N
      R = 0
C     LOOP UNTIL NO MORE DIGITS
 10   IF (M .LT. 1) GOTO 100
C     TAKE LAST DIGIT FROM M AND APPEND TO R
      R = R * 10
      R = R + MOD(M, 10)
      M = M / 10
      GOTO 10
 100  REVRSE = R
      RETURN
      END
C
C     *** TEST IF AN INTEGER IS AN EMIRP ***
      LOGICAL FUNCTION EMIRP(N)
      INTEGER N
C     EXTERNAL FUNCTIONS
      INTEGER REVRSE
      LOGICAL PRIME
C     R CONTAINS REVERSED DIGITS OF N
      INTEGER R
      R = REVRSE(N)
C     N AND R MUST BOTH BE PRIME AND NOT THE SAME VALUE
      IF (N .EQ. R) GOTO 200
      IF (.NOT. PRIME(N)) GOTO 200
      IF (.NOT. PRIME(R)) GOTO 200
 100  EMIRP = .TRUE.
      RETURN
 200  EMIRP = .FALSE.
      RETURN
      END
C
C     *** DISPLAY AN INTEGER ***
      SUBROUTINE SHOW(N)
      INTEGER N
      WRITE(6,50) N
 50   FORMAT(I10)
      RETURN
      END
C
C     *** SHOW FIRST 20 EMIRPS ***
      SUBROUTINE TEST1
C     EXTERNAL FUNCTION
      LOGICAL EMIRP
C     I IS COUNT OF EMIRPS FOUND
C     N IS NUMBER TO TEST
      INTEGER I,N
      N = 0
      DO 100 I=1,20
 10      N = N + 1
         IF (.NOT. EMIRP(N)) GOTO 10
         CALL SHOW(N)
 100  CONTINUE
      RETURN
      END
C
C     *** SHOW EMIRPS BETWEEN 7,700 AND 8,000 ***
      SUBROUTINE TEST2
C     EXTERNAL FUNCTION
      LOGICAL EMIRP
C     N IS NUMBER TO TEST
      INTEGER N
 10   DO 100 N=7700,8000
         IF (EMIRP(N)) CALL SHOW(N)
 100  CONTINUE
      RETURN
      END
C
C     *** SHOW 10,000TH EMIRP ***
      SUBROUTINE TEST3
C     EXTERNAL FUNCTION
      LOGICAL EMIRP
C     I IS COUNT OF EMIRPS FOUND
C     N IS NUMBER TO TEST
      INTEGER I,N
      N = 0
      DO 100 I=1,10000
 10      N = N + 1
         IF (.NOT. EMIRP(N)) GOTO 10
 100  CONTINUE
      CALL SHOW(N)
      RETURN
      END
C
C     *** MAIN ENTRY POINT ***
      CALL TEST1
      CALL TEST2
      CALL TEST3
      STOP
      END
