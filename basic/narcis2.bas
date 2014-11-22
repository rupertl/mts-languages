100 rem UM BASIC program to print the first 25 narcissistic decimal numbers 
110 rem Second, faster version
120 *
130 let c = 0                /* Count of narcissistic numbers found 
140 dim p(9, 9)              /* p(x, y) will contain x ** y
150 gosub 600                /* Precompute p
160 *
170 rem Start of loop to find and print narcissistic numbers
180 for n = 0 to 10000000    /* Number to check for narcissism
190 if c >= 25 then: stop    /* End after 25 numbers
200 *
210 gosub 700                /* Get number of digits in d
220 let x = n                /* Copy of number from which we will extract digits
230 let y = 0                /* Result of calculating narcissistic number
240 * 
250 rem Start of loop to calculate narcissistic number 
260 for i = 1 to d           /* For each digit
270 let x1 = int(x/10)       /* Get all but last digit of x
280 let x0 = x - (10 * x1)   /* Get last digit of x
290 let y = y + p(x0, d)     /* Accumulate digit ** num digits
300 if y > n then 400        /* Bail out if too big already
310 let x = x1               /* Shift off last digit from x
320 next i                   /* Loop for next digit
330 *
340 if y <> n then 400       /* Not a narcissistic number, jump to next
350 print n                  /* Print narcissistic number
360 let c = c + 1            /* Increase count found
370 *
400 next n                   /* Try next number
410 *
500 stop                     /* Fall through if could not find enough numbers
510 *
520 *
599 rem Subroutine to populate p(a, b) with a ** b
600 for a = 0 to 9           /* Digit
610 p(a, 0) = 0              /* a ** 0 = 0
620 p(a, 1) = a              /* a ** 1 = a
630 for b = 2 to 9           /* Power to raise to 
640 p(a, b) = p(a, b-1) * a  /* Calc next power in series
650 next b                   /* Loop power
660 next a                   /* Loop digit
670 return
698 *
699 rem Subroutine to get number of digits in n
700 if n >= 1000000 then 800
710 if n >= 100000  then 810
720 if n >= 10000   then 820
730 if n >= 1000    then 830
740 if n >= 100     then 840
750 if n >= 10      then 850
760 goto 860
800 let d = 7
801 return
810 let d = 6
811 return
820 let d = 5
821 return
830 let d = 4
831 return
840 let d = 3
841 return
850 let d = 2
851 return
860 let d = 1
861 return
