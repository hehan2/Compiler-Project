%{
    #include "syntax.tab.h"
    #include "stdlib.h"
    int count = 0;
%}

letter [a-zA-Z]
letter_ {letter}|_
digit [0-9]

%%
"int"|"float"|"char" { return TYPE; }
"struct" { return STRUCT; }
"if" { return IF; }
"else" { return ELSE; }
"while" { return WHILE; }
"return" { return RETURN; }
"." { return DOT; }
";" { return SEMI; }
"," { return COMMA; }
"=" { return ASSIGN; }
"<" { return LT; }
"<=" { return LE; }
">" { return GT; }
">=" { return GE; }
"!=" { return NE; }
"==" { return EQ; }
"+" { return PLUS; }
"-" { return MINUS; }
"*" { return MUL; }
"/" { return DIV; }
"&&" { return AND; }
"||" { return OR; }
"!" { return NOT; }
"(" { return LP; }
")" { return RP; }
"[" { return LB; }
"]" { return RB; }
"{" { return LC; }
"}" { return RC; }
{digit}*\.{digit}* {return (FLOAT);}
{digit}* {return (INT);}
{letter_}({letter_}|{digit})* {return (ID);} 
\'{letter}\' {return (CHAR);}
" " {}
"\n"|"\t"|"\r" {}
<<EOF>> { return END; }
. { printf("unkown lemex: %s\n", yytext); }
%%