%{
    #include "lex.yy.c"
    void yyerror(const char*);
%}
%token INT FLOAT CHAR ID
%token TYPE STRUCT IF ELSE WHILE RETURN DOT SEMI COMMA ASSIGN
%token LT LE GT GE NE EQ PLUS MINUS MUL DIV AND OR NOT LP RP LB RB LC RC     
%%

%%
void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}
int main() {
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
        yyparse();
    } else{
        fputs("Too many arguments! Expected: 2.\n", stderr);
    }
}