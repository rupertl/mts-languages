100 rem UM BASIC program to print the first 25 narcissistic decimal numbers 
110 let c = 0                /* Count of narcissistic numbers found 
120 *
130 rem Start of loop to find and print narcissistic numbers
140 for n = 0 to 10000000    /* Number to check for narcissism
150 if c >= 25 then: stop    /* End after 25 numbers
160 *
170 let nn = nts(n)          /* Number as a string
180 let d = len(nn)          /* Number of digits
190 let x = n                /* Copy of number from which we will extract digits
200 let y = 0                /* Result of calculating narcissistic number
210 * 
220 rem Start of loop to calculate narcissistic number
230 for i = 1 to d           /* For each digit
240 let x1 = int(x/10)       /* Get all but last digit of x
250 let x0 = x - (10 * x1)   /* Get last digit of x
260 let y = y + (x0 ** d)    /* Accumulate digit ** num digits
270 let x = x1               /* Shift off last digit from x
280 next i 
290 *
300 if int(y) <> n then 400  /* Not a narcissistic number, jump to next
310 print n                  /* Print narcissistic number
320 let c = c + 1            /* Increase count found
330 *
400 next n                   /* Try next number
410 *
500 stop                     /* Fall through if could not find enough numbers
