#ifndef ASTEXEC_H
#define ASTEXEC_H

#include "astgen.h"
#include "hashtable.h"

double operator(char* op, double left, double right);
static void dispatchStatement(hashtable *htable, AstElement* node);
double evalExpression(hashtable *htable, AstElement* node);
static void execStmt(hashtable *htable, AstElement* a);

double evalExpression(hashtable *htable, AstElement* node)
{    
    double left;
    double right;
    //printf("e-> %c \n", node->nodetype); 
    Variable* variable = (Variable*)malloc(sizeof(Variable));

    switch (node->nodetype)
    { 

    case 'V': 
        return node->val;
        break;

    case 'N':
        return hash_lookup(htable,node->name)->value;
        break;
    case 'E':
        left = evalExpression(htable,node->left);
        right = evalExpression(htable,node->right);
        return operator(node->op, left, right);
    break;

    default:
        printf("expression not found %c", node->nodetype);
    }
    return 0;
}

static void dispatchStatement(hashtable *htable, AstElement* node)
{
    Variable* variable = (Variable*)malloc(sizeof(Variable));
    double result;
    //printf("d-> %c \n", node->nodetype); 
    switch (node->nodetype)
    {
    case 'S':
        execStmt(htable, node);
        break;
    case 'P':
        printf("print: %s: %f\n", node->name, hash_lookup(htable, node->name)->value);
        break;
    case 'R':     
        variable->name = node->name;
        printf("Digite: \n");
        scanf("%lf", &variable->value );
        hash_insert(htable, node->name, variable);
        break;

    case 'I':
        result = evalExpression(htable, node->cond);

        if(result){
            execStmt(htable, node->left);
        }else{
            if(node->right){
                execStmt(htable, node->right);
            }            
        }
        break;

    case 'D':
        variable->name = node->name;
        hash_insert(htable, node->name, variable);
        break;

    case 'A':               
        variable->name = node->name;
        variable->value = evalExpression(htable, node->right);
        hash_insert(htable, node->name,variable);
        break;
    
    default:
        //printf("desconhecido \n");
        break;
    }
}


static void execStmt(hashtable *htable, AstElement* a)
{    
    int i;
    for(i=0; i < a->count; i++)
    {
        dispatchStatement(htable, a->statements[i]);
    }
}

//perdao
double operator(char* op, double left, double right){
    if (strcmp(op, "+") == 0){
        return left + right;
    }else if (strcmp(op, "-") == 0){
        return left - right;
    }else if (strcmp(op, "/") == 0){
        return left / right;
    }else if (strcmp(op, "*") == 0){
        return left * right;
    }else if (strcmp(op, ">=" )== 0){
        return left >= right;
    }else if (strcmp(op, "<=") == 0){
        return left <= right;
    }else if (strcmp(op, "!=") == 0){
        return left != right;
    }else if (strcmp(op, "<") == 0){
        return left < right;
    }else if (strcmp(op, ">") == 0){
        return left > right;
    }else if (strcmp(op, "==") == 0){
        return left == right;
    }else {
        return 0;
    }
}

#endif