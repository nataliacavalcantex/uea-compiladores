/*
	Paku v.1 - Lê de arquivos ou linha de comando
	Willians Oliveira
*/
%option caseless
%option yylineno
%{
#define YYSTYPE double
#include "paku.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 
%}

%%

"int"													{return INT;}
"float"													{return FLOAT;}
"/"														{return DIV;}
"*"														{return MULT;}
"+"														{return PLUS;}
"-"														{return MINUS;}
"="														{return ATRIBUITION;}
"print"													{return PRINT;}
[A-Za-z][A-Za-z0-9]*|[_][A-Za-z0-9]+					{return IDENTIFIER;}
[0-9]+("."[0-9]+)? 										{ yylval = atof(yytext); return NUMBER; }
[\n]													{ return EOL; }
[(]														{ return P_LEFT;}
[)]														{ return P_RIGHT;}
[[:space:]]												;
.														{ yyerror("Undefined token\n"); }


%%

int yywrap()
{
	return 1;
}

