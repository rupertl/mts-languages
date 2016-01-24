## Files in this directory

* `hello.fl` - Hello World example

## Running FORTRAN programs in MTS

See [RATFOR & FLECS - Introduction](http://try-mts.com/ratfor-flecs-introduction/) for background on the language and how to run it on MTS. As an example, to compile `hello.fl` using the FLX preprocessor you'd use the command:

```
$run UNSP:FLX PAR=SOURCE=hello.fl,P=*SINK*,FTNSOURCE,LOAD=-load
```
