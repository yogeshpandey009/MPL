# MPL
is a compiler that uses LEX and YACC and reads all types of Matrix operations and then performs Lexical Analysis, Syntactic Analysis, Semantic Analysis, Code generation & Optimization. Thus the final code is generated in C language.
commands to execute
```sh
$ lex matrix.l
$ yacc –d matrix.y
$ cc lex.yy.c y.tab.c
$ ./a.out<input.txt
```

generated logs
```
Declaration Syntax Accepted
Declaration Syntax Accepted
Declaration Syntax Accepted
Multiple Declaration of C not Allowed
Declaration Syntax Accepted
Declaration Syntax Accepted
Undefined Variable D found
Operation Syntax Accepted
Semantically Correct
Operation Syntax Accepted
Semantically Correct
Operation Syntax Accepted
Semantically Correct
Operation Syntax Accepted
Order of Matrices of A and B do not match for addition
Calculation syntax Accepted
Semantically Correct
Calculation syntax Accepted
Semantically Correct
Calculation syntax Accepted
Semantically Correct
Operation Syntax Accepted
Semantically Correct
Operation Syntax Accepted
```

Note to Myself:
need to change variable names, fix formating and  add comments
