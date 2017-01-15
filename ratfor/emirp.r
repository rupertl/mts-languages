######################################################################
# Ratfor program to display emirps
######################################################################

######### Test if a number is prime #########
logical function prime(n)
    integer n  # Number to test

    # Deal with numbers <= 3
    if (n < 1) goto 200
    if (n == 2 | n == 3) goto 100

    # Check if divisible by 2 or 3
    if (mod(n,2) == 0) goto 200
    if (mod(n,3) == 0) goto 200
      
    # See if divisible by 5, 7, ..., up to approx sqrt(n)
    for (i = 5; i < 1000000; i = i + 2) {  
        if (I*I > n) goto 100
        if (mod(n,i) == 0) goto 200
    }

 100  prime = .true.
      return
 200  prime = .false.
      return
end

######### Reverse an integer's digits #########
integer function revrse(n)
    integer n  # Number to reverse
    integer m  # Copy of n from which we take digits
    integer r  # Reversed digits
    m = n
    r = 0
    while (m >= 1) {
        # Take last digit from m and append to r
        r = r * 10
        r = r + mod(m, 10)
        m = m / 10
    }
    revrse = r
    return
end

######### Test if an integer is an emirp #########
logical function emirp(n)
    integer n       # Number to test
    integer revrse  # External function
    logical prime   # External function
    integer r       # Reversed digits of n
    r = revrse(n)
    emirp = .false.
    # n and r must both be prime and not the same value
    if (n .ne. r & prime(n) & prime(r)) {
        emirp = .true.
    }
    return
end

######### Display an integer #########
subroutine show(n)
    integer n
    write(6,50) n
50  format(i10)
    return
end

######### Show first 20 emirps #########
subroutine test1
    logical emirp   # External function
    integer i       # Count of emirps found
    integer n       # Number to test
    n = 0
    for (i = 1; i <= 20; i = i + 1) {
        repeat {
            n = n + 1
        } until (emirp(n))
        call show(n)
    }
    return
end

######### Show emirps between 7,700 and 8,000 #########
subroutine test2
    logical emirp   # External function
    integer n       # Number to test
    for (n = 7700; n <= 8000; n = n + 1) {
        if (emirp(n)) {
            call show(n)
        }
    }
    return
end

######### Show 10,000th emirp #########
subroutine test3
    logical emirp   # External function
    integer i       # Count of emirps found
    integer n       # Number to test
    n = 0
    for (i = 1; i <= 10000; i = i + 1) {
        repeat {
            n = n + 1
        } until (emirp(n))
    }
    call show(n)
    return
end

######### Main entry point #########
call test1
call test2
call test3
stop
end
