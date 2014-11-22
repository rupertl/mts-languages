## Files in this directory

* `hello.bas` - Hello World example
* `narcis1.bas` - Generate first 25 narcissistic numbers
* `narcis2.bas` - Optimised version of the above

## Running BASIC programs in MTS

See [BASIC - Introduction](http://try-mts.com/basic-introduction) for
background on the language and how to run it on MTS.

## How to transfer these files from your host OS into MTS

Use the
[emulated card reader](http://try-mts.com/submitting-batch-jobs-from-the-reader/)
for a quick way to copy files from your host OS into MTS. To execute them
on BASIC, use `/include` from within the language, eg for hello.bas:

```
run *basic
: /open HELLO
: /include hello.bas
: /run
: /save
```

