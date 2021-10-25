/*
	SQL v.1 - Lê de arquivos ou linha de comando
	Willians Oliveira
*/
%option caseless
%{
#define YYSTYPE double
#include "sql.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 
%}

%%

SELECT                { return SELECT; }
FROM                  { return FROM; }
WHERE                 { return WHERE; }
LIKE                  { return LIKE; }
"="                   { return EQUAL;}
">"                   { return GREATER_THEN;}
"<"                   { return LESS_THEN;}
">="                   { return GREATER_THEN_EQUAL;}
"<="                   { return LESS_THEN_EQUAL;}
"<>"                   { return NOTEQUAL;} 
";"                   { return SEMICOLON;}
","                   { return COMMA; }
AND                   { return AND;}
OR                    { return OR;}
"("                   { return P_LEFT; }
")"                   { return P_RIGHT; }
[0-9]+("."[0-9]+)?    { return NUMBER; }
\'([^'\n]|\'\')+\'    { return STRING; }
[a-zA-Z][a-zA-Z0-9]+  { return ATRIBUTE; }

[[:space:]]			  ;
.					  { printf("palavra: \"%s\"\n", yytext);}

%%

int yywrap()
{
	return 1;
}

