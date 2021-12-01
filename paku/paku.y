%{
#include <stdio.h>
#include "hashtable.h"
extern FILE* yyin;

void yyerror(char *s);
int yylex(void);
int yyparse();
extern int yylineno;
hashtable *htable;
%}

%union {
    char *s;
    double d;
    int i;
}

%locations

%token PLUS MINUS DIVIDE TIMES EQUALS  TYPE  EOL END
%token P_LEFT P_RIGHT
%token PRINT READ
%token IF ELSE 
%token O_KEY C_KEY 
%token GREATER_THEN_EQUAL LESS_THEN_EQUAL NOTEQUAL LESS_THEN GREATER_THEN EQUALS_DOUBLE

%left P_LEFT P_RIGHT
%left PLUS MINUS
%left TIMES DIVIDE

%token <d> NUMBER 
%token <s> IDENTIFIER
%type <d> IDENTIFIER_CALC CALC PRINT_EXP

%%

PROGRAM:
    STATEMENT END{YYACCEPT;}
    ;

STATEMENT:
    LINE
    | IF_STMT
    | STATEMENT STATEMENT
    ;

LINE:
    ATTRIBUTION
    | PRINT_EXP
    | READ_EXP
    | DECLARATION
    | EOL
    ;

CONDITION:
    IDENTIFIER CONDOPERATOR NUMBER
    | IDENTIFIER CONDOPERATOR IDENTIFIER
    | NUMBER CONDOPERATOR NUMBER
    | NUMBER CONDOPERATOR IDENTIFIER
    ;

CONDOPERATOR: 
    | GREATER_THEN_EQUAL 
    | LESS_THEN_EQUAL 
    | NOTEQUAL 
    | LESS_THEN 
    | GREATER_THEN 
    | EQUALS_DOUBLE
    ;

BLOCK:
    O_KEY STATEMENT C_KEY
    ;

IF_STMT:
    IF P_LEFT CONDITION P_RIGHT BLOCK
    | IF P_LEFT CONDITION P_RIGHT BLOCK ELSE BLOCK
    ;

ATTRIBUTION:
    IDENTIFIER EQUALS CALC EOL { 
        Variable* variable = (Variable*)malloc(sizeof(Variable));
        variable->name = $1;
        variable->value = $3;
        hash_insert(htable,variable->name,variable);}
    | IDENTIFIER EQUALS IDENTIFIER_CALC EOL { 
        Variable* variable = (Variable*)malloc(sizeof(Variable));
        variable->name = $1;
        variable->value = $3;
        hash_insert(htable,variable->name,variable);}
    ;

IDENTIFIER_CALC:
    IDENTIFIER PLUS IDENTIFIER  {
        $$ = hash_lookup(htable,$1)->value + hash_lookup(htable,$3)->value;}
    | IDENTIFIER MINUS IDENTIFIER {
        $$ = hash_lookup(htable,$1)->value - hash_lookup(htable,$3)->value;}
    | IDENTIFIER DIVIDE IDENTIFIER {
        $$ = hash_lookup(htable,$1)->value / hash_lookup(htable,$3)->value;}
    | IDENTIFIER TIMES IDENTIFIER {
        $$ = hash_lookup(htable,$1)->value * hash_lookup(htable,$3)->value;}
    | IDENTIFIER PLUS CALC {$$ = hash_lookup(htable,$1)->value + $3;}
    | IDENTIFIER MINUS CALC {$$ = hash_lookup(htable,$1)->value - $3;}
    | IDENTIFIER DIVIDE CALC {$$ = hash_lookup(htable,$1)->value / $3;}
    | IDENTIFIER TIMES CALC {$$ = hash_lookup(htable,$1)->value * $3;}
    | CALC PLUS IDENTIFIER {$$ = $1 + hash_lookup(htable,$3)->value;}
    | CALC MINUS IDENTIFIER {$$ = $1 - hash_lookup(htable,$3)->value;}
    | CALC DIVIDE IDENTIFIER {$$ = $1 / hash_lookup(htable,$3)->value;}
    | CALC TIMES IDENTIFIER {$$ = $1 * hash_lookup(htable,$3)->value;}
    | IDENTIFIER_CALC PLUS CALC {$$ = $1 + $3;}
    | IDENTIFIER_CALC MINUS CALC {$$ = $1 - $3;}
    | IDENTIFIER_CALC DIVIDE CALC {$$ = $1 / $3;}
    | IDENTIFIER_CALC TIMES CALC {$$ = $1 * $3;}
    | IDENTIFIER_CALC PLUS IDENTIFIER {$$ = $1 + hash_lookup(htable,$3)->value;}
    | IDENTIFIER_CALC MINUS IDENTIFIER {$$ = $1 - hash_lookup(htable,$3)->value;}
    | IDENTIFIER_CALC DIVIDE IDENTIFIER {$$ = $1 / hash_lookup(htable,$3)->value;}
    | IDENTIFIER_CALC TIMES IDENTIFIER {$$ = $1 * hash_lookup(htable,$3)->value;}
    ;

CALC:
    NUMBER
    | CALC PLUS CALC {$$ = $1 + $3}
    | CALC MINUS CALC {$$ = $1 - $3}
    | CALC DIVIDE CALC {
        if($3 == 0){
            yyerror("zero division!");
            YYABORT;
        }
        $$ = $1 / $3}
    | CALC TIMES CALC {$$ = $1 * $3}
    | P_LEFT CALC P_RIGHT {$$ = $2}
    ;

PRINT_EXP:
    PRINT P_LEFT IDENTIFIER P_RIGHT EOL { 
        printf("print: %s: %d\n", $3, hash_lookup(htable,$3)->value);
    }
    ;

READ_EXP:
    READ P_LEFT IDENTIFIER P_RIGHT EOL { 
        Variable* variable = (Variable*)malloc(sizeof(Variable));
        variable->name = $3;
        printf("Digite: \n");
        scanf("%i", &variable->value );
        hash_insert(htable,variable->name,variable);}
    ; 
 
DECLARATION:
    TYPE IDENTIFIER EOL
    ;

%%

void yyerror(char *s)
{
	printf("Error: %s\n", s);
    printf("Line: %d\n", yylineno);
}

int main(int argc, char *argv[])
{
    htable = hash_init(101);
    /*#ifdef YYDEBUG
        yydebug = 1;
    #endif
	*/
    int result;
    yyin = fopen(argv[1], "r");
    result = yyparse();
    if (result == 0){
        printf("Correct\n");
    }
	return 0;
}
