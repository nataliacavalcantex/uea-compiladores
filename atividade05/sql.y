/*
	Calculadora v.4 - Lê de arquivos ou linha de comando
	Jucimar Jr
*/

%{
#define YYSTYPE double
#include <stdio.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token SELECT FROM WHERE 
%token COMMA SEMICOLON 
%token ATRIBUTE STRING NUMBER
%token EQUAL OR AND LIKE
%token GREATER_THEN LESS_THEN GREATER_THEN_EQUAL LESS_THEN_EQUAL NOTEQUAL
%token P_LEFT P_RIGHT

%%

STATEMENT:
	STATEMENT QUERY SEMICOLON { printf("SQL VALIDO!\n");}
	|
	;


QUERY : 
    SELECT SELECTLIST FROM FROMLIST
	| SELECT SELECTLIST FROM FROMLIST WHERE WHERELIST
	; 

SELECTLIST : ATRIBUTE
	| ATRIBUTE COMMA SELECTLIST
	;
FROMLIST : ATRIBUTE
	| ATRIBUTE COMMA FROMLIST
	;
WHERELIST : ATRIBUTE COMPARISON STRING
    | ATRIBUTE COMPARISON NUMBER
    | ATRIBUTE LIKE STRING
	| WHERELIST AND WHERELIST
	| WHERELIST OR WHERELIST
	| P_LEFT WHERELIST P_RIGHT
	;

COMPARISON : EQUAL
	| GREATER_THEN 
	| LESS_THEN 
	| GREATER_THEN_EQUAL 
	| LESS_THEN_EQUAL 
	| NOTEQUAL
	;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	
	if (argc == 1)
    {
		yyparse();
    }

	if (argc == 2)
	{
    	yyin = fopen(argv[1], "r");
		yyparse();
    }

	return 0;
}
