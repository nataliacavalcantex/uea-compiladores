#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "hashtable.h"

int main() {
    

    printf("\nInicializa a tabela hash:\n");
    hashtable *table;
    table = hash_init(11);

    printf("\nVerifica se geramos as chaves corretamente?\n\n");
    


   Variable* variable = (Variable*)malloc(sizeof(Variable));
   variable->name = "teste";

    hash_insert(table,"teste", variable);

    hash_print(table);


    // printf("%d ", hash_index(table, "casa"));
    // printf("%d ", hash_index(table, "g"));
    // printf("%d ", hash_index(table, "java"));
    // printf("%d ", hash_index(table, "angular"));
    // printf("%d ", hash_index(table, "c#"));
    // printf("%d ", hash_index(table, "abacate"));
    // printf("%d ", hash_index(table, "google"));
    // printf("%d ", hash_index(table, "apple"));
    // printf("%d ", hash_index(table, "amazon"));
    // printf("%d ", hash_index(table, "teste"));
    // printf("%d ", hash_index(table, "1234"));


    
    // printf("\nInsere\n");

    // hash_insert(table, "livro","A");
    // hash_insert(table, "casa", "B");
    // hash_insert(table, "g", "C");
    // hash_insert(table, "java", "D");
    // hash_insert(table, "angular", "E");
    // hash_insert(table, "c#", "F");
    // hash_insert(table, "abacate", "G");
    // hash_insert(table, "google", "H");
    // hash_insert(table, "apple", "I");
    // hash_insert(table, "amazon", "J");
    // hash_insert(table, "teste", "K");
    // hash_insert(table, "1234", "L");

    // printf("\n ");
    // hash_print(table);
    
    // printf("\n ");
    // hash_update(table, "1234", "M");

    // hash_print(table);
    // printf("\n ");

    // printf("\nRemove\n");
    // hash_remove(table, "abacate");

    // hash_print(table);

    // printf("\ndestroi \n");
    // hash_destroy(table);


    return 0;
    

}

