%{
    #define EXIT_OK 0
    #define EXIT_FAIL 1

    // global variables
    int identifiers = 0;
    int lines = 0;
%}
letter [a-zA-Z]
letter_ {letter}|_
digit [0-9]

%%
\n {}
[\t\r ]+ {}
int {return (TYPE);}
char {return (TYPE);}
float {return (TYPE);}
if {return (IF);}
else {return (ElSE);}
while {return (WHILE);}
return {return (RETURN);}
\. {return (DOT);}
; {return (SEMI);}
, {return (COMMA);}
<= {return (LE);}
< {return (LT);}
>= {return (GE);}
> {return (GT);}
!= {return (NE);}
== {return (EQ);}
= {return (ASSIGN);}
+ {return (PLUS);}
- {return (MINUS);}
* {return (MUL);}
\/ {return (DIV);}
&& {return (AND);}
|| {return (OR);}
! {return (NOT);}
\( {return (LP);}
\) {return (RP);}
\[ {return (LB);}
\] {return (RB);}
\{ {return (LC);}
\} {return (RC);}
{digit}*\.{digit}* {return (FLOAT);}
{digit}* {return (INT);}
{letter_}({letter_}|{digit})* {return (ID);} 
\'{letter}\' {return (CHAR);}

. { /* a final rule that matches when seeing any character but new line */ }
<<EOF>> { printf("There are %d occurrences of valid identifiers\n", identifiers); yyterminate(); }

%%
int main(int argc, char **argv){
    char *file_path;
    if(argc < 2){
        fprintf(stderr, "Usage: %s <file_path>\n", argv[0]);
        return EXIT_FAIL;
    } else if(argc == 2){
        file_path = argv[1];
        if(!(yyin = fopen(file_path, "r"))){
            perror(argv[1]);
            return EXIT_FAIL;
        }
        yylex();
        return EXIT_OK;
    } else{
        fputs("Too many arguments! Expected: 2.\n", stderr);
        return EXIT_FAIL;
    }
}

