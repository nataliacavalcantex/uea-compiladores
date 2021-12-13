#ifndef HASHTABLE_H
#define HASHTABLE_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include "hashlist.h"

typedef struct hashtable {
    int size;
    list **table;
} hashtable;

int hash_index(hashtable *table,  char *key)
{ 
    unsigned h = 0;
    for (int i = 0; key[i] != '\0'; i++) 
      h = (h * 256 + key[i]) % table->size;
    return h;
}

Variable *hash_lookup(hashtable *hashtab,  char *key)
{ 
    int index;
    index = hash_index(hashtab, key);
    list *templist = hashtab->table[index];
    if (empty(templist))
        return 0;
    else {
        node *tempnode = listkeysearch(templist, key);
        return tempnode->value;
    }
}

void hash_insert(hashtable *hashtab,  char *key, Variable *value)
{ 
    int index = hash_index(hashtab, key);
    list *temp = hashtab->table[index];
    listinsert(temp, nodegen(key, value));
}

int hash_update(hashtable *hashtab,  char *key, Variable *value)
{
    int index = hash_index(hashtab, key);
    list *temp = hashtab->table[index];
    return listupdate(temp, key, value);
}

hashtable *hash_init(int size)
{ 
    list **hasharray;
    hasharray = malloc(sizeof (list) * size);
    hashtable *hashtab;
    hashtab = malloc(sizeof (hashtable));

    int i;
    for (i = 0; i < size; i++) {
        hasharray[i] = listinit();
    }

    hashtab->table = hasharray;
    hashtab->size = size;
    return hashtab;
}

void hash_destroy(hashtable *oldtable)
{ // destroy!!
    int i;
    for (i = 0; i < oldtable->size; i++) {
        destroylist(oldtable->table[i]);
    }
    free(oldtable);
}

void hash_print(hashtable *toprint)
{
    int i;
    list *templist;
    printf("keys:\tvalues:\n");
    for (i = 0; i < toprint->size; i++) {
        templist = toprint->table[i];
        if (! (empty(templist))){            
            printlist(templist);
        }
            
    }
}

void hash_remove(hashtable *hashtab,  char *key)
{ 
    int index = hash_index(hashtab, key);
    list *templist = hashtab->table[index];
    if (! (empty(templist))) {
        node *delnode = listkeysearch(templist, key);
        listremove(templist, delnode);
    }
}

#endif