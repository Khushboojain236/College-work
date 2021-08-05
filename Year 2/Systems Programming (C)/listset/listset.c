#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <assert.h>

// include the header files with the declarations of listset
#include "listset.h"

// create a new, empty linked list set
struct listset * listset_new() {
struct listset* result;
    result=malloc(sizeof(struct listset));
    assert(result!= NULL);
    result->head=NULL;
    return result;
}

/* check to see if an item is in the set
   returns 1 if in the set, 0 if not */
int listset_lookup(struct listset * this, char * item) {
 struct listnode * p;
   // p=malloc(sizeof(struct listnode));
    for (p=this->head; p!=NULL; p=p->next) {
        if (strcmp(p->str,item)==0) {
            return 1;
        }
    }
    return 0;
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set.
// New items that are not already in the set should
// be added to the start of the list
void listset_add(struct listset * this, char * item) {
if (listset_lookup(this,item)==0)
 {
     struct listnode * node;
     node=malloc(sizeof(struct listnode));
                 node->str=item;
                 node->next=this->head;
                 this->head=node;
 }
}

// remove an item with number 'item' from the set
void listset_remove(struct listset * this, char * item) {
struct listnode * node;
struct listnode *prev;
    node=malloc(sizeof(struct listnode));
    node=this->head;
    if(strcmp(node->str,item)==0)
    {
        this->head=node->next;
        free(node);
        return;
    }
    while (node->next!=NULL && (strcmp(node->str,item)!=0))
    {
        prev=node;
        node=node->next;
    }
    if(node==NULL)
    {
        return;
    }
    prev->next=node->next;
    free(node);
}

// place the union of src1 and src2 into dest
void listset_union(struct listset * dest, struct listset * src1,
		   struct listset * src2) {
    struct listnode * node;
    struct listnode * node2;
    for(node=src1->head;node!=NULL;node=node->next)
    {
        listset_add(dest,node->str);
    }
    for(node2=src2->head;node2!=NULL;node2=node2->next)
    {
        if(listset_lookup(dest,node2->str)==0)
            listset_add(dest,node2->str);
    }
}

// place the intersection of src1 and src2 into dest
void listset_intersect(struct listset * dest, struct listset * src1,
		       struct listset * src2) {
 struct listnode* node;
      for(node=src1->head;node!=NULL;node=node->next){
           if (listset_lookup(src2, node->str))
               listset_add(dest,node->str);
       }
}

// return the number of items in the listset
int listset_cardinality(struct listset * this) {
    int count=1;
    struct listnode * p;
    for (p=this->head; p!=NULL; p=p->next) {
        count++;
    }
    return count;

}

// print the elements of the list set
void listset_print(struct listset * this) {
  struct listnode * p;

  for ( p = this->head; p != NULL; p = p->next ) {
    printf("%s, ", p->str);
  }
  printf("\n");
}
