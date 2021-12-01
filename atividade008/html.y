/*
	HTML v.1 - Lê de arquivos ou linha de comando
	Willians Oliveira
*/

%{
#define YYSTYPE double
#include <stdio.h>
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
%}

%token DOCTYPE O_HTML C_HTML O_HEAD C_HEAD O_BODY C_BODY
%token O_P C_P O_DIV C_DIV
%token O_H1 C_H1 O_H2 C_H2 O_H3 C_H3 O_H4 C_H4 O_H5 C_H5 O_H6 C_H6
%token O_BUTTON C_BUTTON
%token O_UL C_UL O_OL C_OL O_LI C_LI
%token O_A C_A IMG

%%

STATEMENT:
	STATEMENT DOCUMENT { printf("HTML VALIDO!\n");}
	|
	;


DOCUMENT :
	DOCTYPE HTML
	;

HTML : O_HTML HEAD BODY C_HTML
	| O_HTML HEAD C_HTML
	| O_HTML BODY C_HTML
	| O_HTML C_HTML
	;

HEAD : O_HEAD C_HEAD
	;

BODY : O_BODY C_BODY
	| O_BODY TAGLIST C_BODY
	;

TAGLIST : TAG
	| TAG TAGLIST
	;

TAG : P
	| DIV
	| HEADING
	| BUTTON
	| LISTS
	| A
	| IMG
	;

P : O_P C_P
	| O_P TAGLIST C_P
	;

DIV : O_DIV C_DIV
	| O_DIV TAGLIST C_DIV

HEADING : H1
	| H2 
	| H3
	| H4 
	| H5
	| H6 
	;

H1 : O_H1 C_H1 
	| O_H1 TAGLIST C_H1
	;

H2 : O_H2 C_H2 
	| O_H2 TAGLIST C_H2
	; 

H3 : O_H3 C_H3 
	| O_H3 TAGLIST C_H3
	; 

H4 : O_H4 C_H4 
	| O_H4 TAGLIST C_H4
	; 

H5 : O_H5 C_H5 
	| O_H5 TAGLIST C_H5
	; 

H6 : O_H6 C_H6 
	| O_H6 TAGLIST C_H6
	; 

BUTTON : O_BUTTON C_BUTTON
	| O_BUTTON TAGLIST C_BUTTON
	;

LISTS : OL
	| UL
	;

OL : O_OL LILIST C_OL
	| O_OL C_OL
	;

UL : O_UL LILIST C_UL
	| O_UL C_UL
	;

LILIST : LI
	| LI LILIST
	;

LI : O_LI C_LI
	| O_LI TAGLIST C_LI
	;

A : O_A C_A
	| O_A TAGLIST C_A
	;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
}

int main(int argc, char *argv[])
{
	yydebug = 0;
	
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
