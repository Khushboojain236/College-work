//   list_string.c
//   David Gregg
//   January 2021

#include <stdio.h>
#include <assert.h>
#include <stdlib.h>
#include "list_string.h"



// create a new list string with the same value as a normal
// NULL-terminated C string
//here we have allocated the space and initialized the list 
//we  then pass the text and the created list as parameters to the  insert function
struct list_string * new_list_string(char * text) {
    struct list_string * result;
    result=malloc(sizeof(struct  list_string));
    assert(result!=NULL);
     result->head=NULL;
       list_string_add(result,text);
       return result;
}

// find the length of the list string
//count is used as a counter that make sure of the number of nodes 
// it loops through the string the linked list until it reaches the end 
int list_string_length(struct list_string * this) {
    int count=0;
    struct ls_node * p;
    for(p=this->head;p!=NULL;p=p->next){
        count++;
    }
    printf("%i",count);
    return count;
}


// compare two strings; return -1 is s1 is lexicographically less that s2;
// return 0 if the strings are equal; return 1 if s1 is lexicographically
// larger than s2. E.g. "aB" is less than "ab" because 'B' has a smaller
// ASCII code than 'b'. Also "abc" is less that "abcd". 
int list_string_compare(struct list_string * s1, struct list_string * s2) {
    struct ls_node * p;
    struct ls_node * q;
// we start with the assumption that the two strings are equal  
    int result_is=0;
    p=s1->head;
    q=s2->head;
//if one of them is null we stop comparing 
    while(p!=NULL || q!=NULL)
    {
        char c1=p->c;
        char c2=q->c;
//if the  two characters are equal  
        if(c1==c2){
            p=p->next;
            q=q->next;
       }
// if the two characters are not equal
        else
        {
// then we subtract the two characters to see which one is greater 
//if  difference of c1 and c2 is greater than 0 , then c1 thats character in s1 is greater so result is 1 
// if difference  is less than zero then result is -1 
           result_is=c1-c2;
            if (result_is>0)
            {
                result_is=1;
            }
            else
            {
                result_is=-1;
            }
           // printf("%i",result_is);
            break;
        }
    }
 printf("%i",result_is);
    return result_is;

}
// return 1 if str is a substring of text; 0 otherwise
int list_string_substring(struct list_string * text, struct list_string * str) {
 int length1=list_string_length(text);
    int length2=list_string_length(str);
//assuming it isn't a substring 
    int flag=0;
// if the str  has length greater than text then it can't be a substring
    if(length2>length1)
    {
        return 0;
    }
      struct  ls_node * p;
       struct  ls_node * q;
        p=str->head;
        q=text->head;
// looping through the str (substring)
        while(p!=NULL)
        {
            char c1=p->c;
            char c2=q->c;
//case 1 the flag is zero  and the characters match  
            if((flag==0) && (c1==c2))
            {
                p=p->next;
                q=q->next;
                flag=1;
            }
//case 2 the flag is 1 as the previous characters matched but these didn't 
//not in sequence so isn't a substring so break  
            else if((flag==1) && (c1!=c2))
            {
                flag=0;
                break;
            }
//case 3 flag is 1  the characters match  so we continue following 
            else if ((flag==1) && (c1==c2))
            {
                p=p->next;
                q=q->next;
            }
//the flag is zero and  characters don't match we move to next character in text 
// to look for a match 
            else if((flag==0) && (c1!=c2))
            {
                q=q->next;
                flag=0;
            }
        }
    printf("%i",flag);
    return flag;
}


//to add characters of string to the linked list
//the while loop ensures that we loop through the end of the string by comparing it to the null character
//each character is added as a single node  
void  list_string_add(struct list_string * this,char * text){
       int i=0;
 while(text[i]!='\0'){
     struct ls_node * p;
      p=malloc(sizeof(struct ls_node));
        p->c=text[i];
        p->next=this->head;
        this->head=p;
        i++;
}
}

