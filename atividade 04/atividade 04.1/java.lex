DIGITO			[0-9]
NUMERO			[0-9]+(\.[0-9])
STRING           \"([^"\n]|\"\")+\"
PARENS_ABERTURA  [\(]
PARENS_FECHAMENTO  [\)]
PONTO_E_VIRGULA  [;]
CHAVE_ABERTURA  [{]
CHAVE_FECHAMENTO  [}]
COLCHETES_ABERTURA [\[]
COLCHETES_FECHAMENTO [\]]

HASH              [#]
MENOR             [<]
MAIOR             [>]

PONTO            [.]
PALAVRA			[a-zA-Z]+
IDENTIFICADOR	[a-zA-Z][a-zA-Z0-9]+
BRANCO			[ \n\t]

%%

class         printf("palavra chave: \"%s\"\n", yytext);
public         printf("palavra chave: \"%s\"\n", yytext);
static         printf("palavra chave: \"%s\"\n", yytext);
void     printf("palavra chave: \"%s\"\n", yytext);
main     printf("palavra chave: \"%s\"\n", yytext);
String     printf("palavra chave: \"%s\"\n", yytext);
System     printf("palavra chave: \"%s\"\n", yytext);
out     printf("palavra chave: \"%s\"\n", yytext);
println     printf("palavra chave: \"%s\"\n", yytext);

{HASH} printf("Voce escreveu um #: \"%s\"\n", yytext);

{DIGITO}		printf("Voce escreveu um digito: \"%s\"\n", yytext);
{PALAVRA}		printf("Voce escreveu uma palavra: \"%s\"\n", yytext);
{STRING}        printf("Voce escreveu uma string: \"%s\"\n", yytext);

{PARENS_ABERTURA} printf("Voce abriu um parenteses: \"%s\"\n", yytext);
{PARENS_FECHAMENTO} printf("Voce fechou um parenteses: \"%s\"\n", yytext);

{COLCHETES_ABERTURA} printf("Voce abriu um colchete: \"%s\"\n", yytext);
{COLCHETES_FECHAMENTO} printf("Voce fechou um colchete: \"%s\"\n", yytext);

{CHAVE_ABERTURA} printf("Voce abriu uma chave: \"%s\"\n", yytext);
{CHAVE_FECHAMENTO} printf("Voce fechou uma chave: \"%s\"\n", yytext);

{MENOR} printf("Voce escreveu <: \"%s\"\n", yytext);
{MAIOR} printf("Voce escreveu >: \"%s\"\n", yytext);

{IDENTIFICADOR}	printf("Voce escreveu um identificador: \"%s\"\n", yytext);
{BRANCO}		printf("Voce escreveu um espaco branco: \"%s\"\n", yytext);
{NUMERO}		printf("Voce escreveu um numero: \"%s\"\n", yytext);

{PONTO_E_VIRGULA} printf("Voce escreveu um ponto-e-virgula: \"%s\"\n", yytext);
{PONTO}			printf("Voce escreveu um ponto: \"%s\"\n", yytext);
.			printf("Nao reconhecido: \"%s\"\n", yytext);

%%
int main(int argc, char *argv[])
{
	if (argc < 2)
	{
		printf ("Missing input file\n");
		exit(-1);
	}

	yyin = fopen(argv[1], "r" );
	yylex();
}
