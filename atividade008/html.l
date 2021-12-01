/*
	HTML v.1 - Lê de arquivos ou linha de comando
	Willians Oliveira
*/
%option caseless
%{
#define YYSTYPE double
#include "html.tab.h" 
#include <stdlib.h>

void yyerror(char *s); 
%}

%%

"<!DOCTYPE html>"         { return DOCTYPE; }
"<html>"                  { return O_HTML; }
"</html>"                 { return C_HTML; }
"<head>"                  { return O_HEAD; }
"</head>"                 { return C_HEAD; }
"<body>"                  { return O_BODY; }
"</body>"                 { return C_BODY; }
"<p>"                     { return O_P; }
"</p>"                    { return C_P; }
"<div>"                   { return O_DIV; }
"</div>"                  { return C_DIV; }
"<h1>"                    { return O_H1; }
"</h1>"                   { return C_H1; }
"<h2>"                    { return O_H2; }
"</h2>"                   { return C_H2; }
"<h3>"                    { return O_H3; }
"</h3>"                   { return C_H3; }
"<h4>"                    { return O_H4; }
"</h4>"                   { return C_H4; }
"<h5>"                    { return O_H5; }
"</h5>"                   { return C_H5; }
"<h6>"                    { return O_H6; }
"</h6>"                   { return C_H6; }
"<button>"                { return O_BUTTON; }
"</button>"               { return C_BUTTON; }
"<ul>"                    { return O_UL; }
"</ul>"                   { return C_UL; }
"<ol>"                    { return O_OL; }
"</ol>"                   { return C_OL; }
"<li>"                    { return O_LI; }
"</li>"                   { return C_LI; }
"<a"                      { return O_A; }
"</a>"                    { return C_A; }
"<img"                    { return IMG; }
[[:space:]]			  ;
.					  ; /*{ printf("palavra: \"%s\"\n", yytext);} */

%%

int yywrap()
{
	return 1;
}

