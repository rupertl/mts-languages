;; Checks if n is prime using a simple division test
(DEFUN PRIME-P (N)
  (COND
   ;; Deal with numbers <= 3
   ((LESS N 2) NIL)
   ((LESS N 4) T)
   ;; Check if divisible by 2 or 3
   ((EQUAL (REMAIN N 2) 0) NIL)
   ((EQUAL (REMAIN N 3) 0) NIL)
   ;; See if divisible by 5, 7, ..., up to approx sqrt(n)
   (T (PROG (I RESULT)
            (SETQ I 5)
A           (SETQ RESULT (COND ((GREATER (TIMES I I) N) 'PRIME)
                               ((EQUAL (REMAIN N I) 0) 'NOT-PRIME)
                               (T (SETQ I (ADD I 2)) NIL)))
            (COND ((NOT RESULT) (GO A)))
            (EQ RESULT 'PRIME)))))


;; Return a number that has the reversed digits in n
(DEFUN REVERSE-DIGITS (N)
  (PROG (REVERSED)
        (SETQ REVERSED 0)
        ;; Take last digit from n and append to reversed
        (PROG ()
B             (SETQ REVERSED (TIMES REVERSED 10))
              (SETQ REVERSED (ADD REVERSED (REMAIN N 10)))
              (SETQ N (IDIVIDE N 10))
              (COND ((GREATER N 0) (GO B))))
        ;; CAR needed to evaluate REVERSED otherwise PROG will return
        ;; the symbol REVERSED
        (CAR REVERSED)))


;; Check if a number is an emirp, ie both it and its reversed digits
;; are prime.
(DEFUN EMIRP-P (N)
  (PROG (REVERSED)
        (SETQ REVERSED (REVERSE-DIGITS N))
        (AND (NOT (EQUAL N REVERSED)) (PRIME-P N) (PRIME-P REVERSED))))


;; Return the 10,000th emirp
(DEFUN EMIRP-10K ()
  (PROG (N COUNT LAST)
        (SETQ N 0)
        (SETQ COUNT 0)
        (SETQ LAST 0)
C       (COND ((EMIRP-P N)
               (SETQ COUNT (ADD COUNT 1)) (SETQ LAST N)))
        (SETQ N (ADD N 1))
        (COND ((LESS COUNT 10000) (GO C)))
        (CAR LAST)))


;; Compile all the forms
(COMPILE PRIME-P)
(COMPILE REVERSE-DIGITS)
(COMPILE EMIRP-P)
(COMPILE EMIRP-10K)


;; Execute the test
(EMIRP-10K)
(STOP)
