## Files in this directory

* `hello.pl1` - Hello World example

## Running PL/I programs in MTS

See [PL/I - Introduction](http://try-mts.com/pli-introduction/) for background on the language and how to run it on MTS. As an example, to run `hello.pl1` you'd use the commands:

```
# $destroy -load
# $run *pl1f scards=hello.pl1 spunch=-load
# $run -load+*pl1lib
```
