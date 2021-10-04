DIGITO			[0-9]
NUMERO			[0-9]+(\.[0-9])
STRING           \'([^'\n]|\'\')+\'
PARENS_ABERTURA  [\(]
PARENS_FECHAMENTO  [\)]
PONTO_E_VIRGULA  [;]
DOISPONTOS       [\:]
PONTO            [.]
MAIS              [\+]
VIRGULA          [\,]
PALAVRA			[a-zA-Z]+
IDENTIFICADOR	[a-zA-Z][a-zA-Z0-9]+
BRANCO			[ \n\t]

%%

program         printf("palavra chave: \"%s\"\n", yytext);
begin         printf("palavra chave: \"%s\"\n", yytext);
end         printf("palavra chave: \"%s\"\n", yytext);
writeln     printf("palavra chave: \"%s\"\n", yytext);
read    printf("palavra chave: \"%s\"\n", yytext);
var printf("palavra chave: \"%s\"\n", yytext);
integer printf("palavra chave: \"%s\"\n", yytext);

{DIGITO}		printf("Voce escreveu um digito: \"%s\"\n", yytext);
{PALAVRA}		printf("Voce escreveu uma palavra: \"%s\"\n", yytext);
{STRING}        printf("Voce escreveu uma string: \"%s\"\n", yytext);
{PARENS_ABERTURA} printf("Voce abriu um parenteses: \"%s\"\n", yytext);
{PARENS_FECHAMENTO} printf("Voce fechou um parenteses: \"%s\"\n", yytext);
{IDENTIFICADOR}	printf("Voce escreveu um identificador: \"%s\"\n", yytext);
{BRANCO}		printf("Voce escreveu um espaco branco: \"%s\"\n", yytext);
{NUMERO}		printf("Voce escreveu um numero: \"%s\"\n", yytext);

{MAIS}        printf("Voce escreveu um mais + : \"%s\"\n", yytext);
{VIRGULA}     printf("Voce escreveu uma virgula: \"%s\"\n", yytext);
{DOISPONTOS}  printf("Voce escreveu um dois pontos: \"%s\"\n", yytext);
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
