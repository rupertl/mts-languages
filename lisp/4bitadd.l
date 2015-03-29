;; 4 bit adder using MTS LISP

;; Logical exclusive-or gate
(DEFUN XOR (A B)
  (OR (AND A (NOT B))
      (AND B (NOT A))))

;; Half adder for two bits A B - returns (result . carry-bit)
(DEFUN HALF-ADDER (A B)
  (CONS (XOR A B) (AND A B)))

;; Full adder for two bits A B - returns (result . carry-bit)
(DEFUN ADDER (A B C0)
  (PROG (S1 S2)
        (SETQ S1 (HALF-ADDER C0 A))
        (SETQ S2 (HALF-ADDER (CAR S1) B))
        (CONS (CAR S2) (OR (CDR S1) (CDR S2)))))

;; Get the bit at position N (0-indexed) from list L
(DEFUN BIT (L N)
  (CAR (NTH L (ADD1 N))))

;; Four-bit adder. A, B are bit lists
;; Returns (BIT-LIST-RESULT . OVERFLOW)
(DEFUN ADDER-4 (A B)
  (PROG (X1 X2 X3 X4)
        (SETQ X1 (ADDER (BIT A 3) (BIT B 3) NIL))
        (SETQ X2 (ADDER (BIT A 2) (BIT B 2) (CDR X1)))
        (SETQ X3 (ADDER (BIT A 1) (BIT B 1) (CDR X2)))
        (SETQ X4 (ADDER (BIT A 0) (BIT B 0) (CDR X3)))
        (CONS (MAPCAR 'CAR (LIST X4 X3 X2 X1)) (CDR X4))))


;; Convert decimal number X to binary list, eg 5 to (t nil t)
(DEFUN DEC-BIN (X)
  (PROG (BIT)
        (SETQ BIT (NOT (ZERO (LAND X 1))))  
        (COND ((LESS X 2) (LIST BIT))
              (T (APPEND (DEC-BIN (SHIFT X -1)) BIT)))))
  
;; Pad binary list L to length N by adding NILs in front
(DEFUN PAD (N L)
  (COND ((LESS (LENGTH L) N) 
         (REPEAT '(SETQ L (CONS NIL L)) (SUB N (LENGTH L))))
        (T L)))

;; Test the 4 bit adder with two numbers
(DEFUN TEST-ADDER-4 (A B)
  (PROG (AB BB RES)
        (SETQ AB (PAD 4 (DEC-BIN A)))
        (SETQ BB (PAD 4 (DEC-BIN B)))
        (SETQ RES (ADDER-4 AB BB))
        (PRIN1 AB) (PRIN1 '+) (PRIN1 BB)
        (PRIN1 '=) (PRIN1 (CAR RES))
        (PRIN1 'carry)  (PRIN1 (CDR RES))
        (TERPRI)))

(TEST-ADDER-4 3 2)
(STOP)
