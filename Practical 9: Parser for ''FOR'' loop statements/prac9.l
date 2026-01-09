%{
#include <stdio.h>
#include "shreyas4.tab.h"
%}

%%

"for"       { return FOR; }
"("         { return LPARSEN; }
")"         { return RPARSEN; }
"{"         { return LBRACE; }
"}"         { return RBRACE; }
";"         { return SEMICOLON; }
"="         { return ASSIGN; }
"<"         { return LT; }
">"         { return GT; }
"++"        { return INC; }
"--"        { return DEC; }
"+"         { return PLUS; }

\"[^\"]*\"  { return STRING; }      /* "Hi" or "Hello" */
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
[0-9]+                  { return NUMBER; }
[ \t\n]+                ;               /* ignore whitespace */
.                       { printf("Invalid character: %s\n", yytext); }

%%
int yywrap(void) { return 1; }
