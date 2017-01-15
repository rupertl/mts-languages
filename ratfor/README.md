## Files in this directory

* `hello.r` - Hello World example
* `emirp.r` - Emirp primes

## Running FORTRAN programs in MTS

See [RATFOR & FLECS - Introduction](http://try-mts.com/ratfor-flecs-introduction/) for background on the language and how to run it on MTS. As an example, to compile `hello.r` using the RATFOR preprocessor you'd use the command:

```
$run *ratfor scards=hello.r spunch=-hello.f
```
