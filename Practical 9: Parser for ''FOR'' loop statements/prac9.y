%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(const char *s);
int yylex(void);
%}

%token FOR LPARSEN RPARSEN LBRACE RBRACE SEMICOLON ASSIGN IDENTIFIER NUMBER LT GT PLUS INC DEC STRING

%%

program:
        for_loop
        ;

for_loop:
        FOR LPARSEN initialization SEMICOLON condition SEMICOLON update RPARSEN statement
        {
                printf("Valid FOR loop structure\n");
        }
        ;

initialization:
        IDENTIFIER ASSIGN NUMBER
        | /* empty */
        ;

condition:
        IDENTIFIER LT NUMBER
        | IDENTIFIER GT NUMBER
        | IDENTIFIER
        | /* empty */
        ;

update:
        IDENTIFIER ASSIGN IDENTIFIER
        | IDENTIFIER ASSIGN NUMBER
        | IDENTIFIER ASSIGN IDENTIFIER PLUS NUMBER
        | IDENTIFIER ASSIGN IDENTIFIER PLUS IDENTIFIER
        | IDENTIFIER INC
        | IDENTIFIER DEC
        | /* empty */
        ;

statement:
        LBRACE body RBRACE
        | body
        ;

body:
        IDENTIFIER LPARSEN STRING RPARSEN SEMICOLON     /* e.g. printf("Hi"); */
        | IDENTIFIER SEMICOLON                         /* e.g. x++; */
        | /* empty */
        ;

%%

void yyerror(const char *s)
{
    fprintf(stderr, "Error: %s\n", s);
}

int main(void)
{
    printf("Enter a FOR loop:\n");
    return yyparse();
}
