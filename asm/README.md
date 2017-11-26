## Files in this directory

* `hello.asm` - Hello World example
* `caesar.asm` - Caesar cipher encoder and decoder

## Running assembly language programs in MTS

See [Assembly Language - Introduction](http://try-mts.com/assembly-introduction/) for background on the language and how to run it on MTS. As an example, to run `hello.asm` you'd use the commands:

```
# $run *asmg scards=hello.asm spunch=-load sercom=*sink* par=test
# run -load
```

