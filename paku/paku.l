%{

#include "paku.tab.h" 
#include <stdlib.h>

void yyerror(char *s);
%}
%option yylineno


%%
"if"								{ return IF;}
"else"                              { return ELSE;}
"{"                                 { return O_KEY;}
"}"                                 { return C_KEY;}
"="                                 { return EQUALS;}
">="|"<="|"=="|"!="|[=<>+-/*]        { yylval.op = strdup(yytext); return OPERATOR; }
[(]     							{ return P_LEFT; }
[)]     							{ return P_RIGHT; }
print								{ return PRINT; }
read                                { return READ; }
int|float                           { return TYPE; }
[0-9]+|[0-9]+(\.[0-9]+)?  			{ yylval.val = atof(yytext);return NUMBER; }
[a-zA-Z_][_a-zA-Z0-9]*  			{ yylval.name = strdup(yytext); return IDENTIFIER; }
\n                      			{ return EOL; }
<<EOF>>								{ return END; }
[[:space:]]							;

%%

int yywrap()
{
	return 1;
}
