// code for a huffman coder


#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <ctype.h>

#include "huff.h"

// create a new huffcoder structure
struct huffcoder *  huffcoder_new()
{
    struct huffcoder * new = malloc(sizeof(struct huffcoder));
    new->tree=malloc(sizeof(struct huffchar));
    for (int i=0; i<NUM_CHARS; i++) {
        new->freqs[i]=0;
        new->code_lengths[i]=0;
        new->codes[i]=0;
    }
    return new;
}

// count the frequency of characters in a file; set chars with zero
// frequency to one
void huffcoder_count(struct huffcoder * this, char * filename)
{
    unsigned char c ;
    FILE * file = fopen(filename ,"r");
        c = fgetc(file);
             this->freqs[c]++;
             while( !feof(file) ) {
               c = fgetc(file);
               this->freqs[c]++;
             }
             
             //make chars with freq zero freq 1
             for(int i=0; i<NUM_CHARS;i++){
                 if(this->freqs[i] ==0 ) this->freqs[i] ++;
             }
    fclose(file);
}
//find minimum and removes least frequencies
int find_least_freq( struct huffchar ** list, int size)
{
    int min=list[0]->freq;
    int min_index=0;
    for (int i =1 ; i<size; i++) {
        if (list[i]->freq < min || (list[i]->freq == min && list[i]->seqno < list[0]->seqno) {
            //we have a new minimum
            min=list[i]->freq;
            min_index=i;
        }
    }
    return min_index;
}

//make compound
void make_compound(struct huffchar * compound , struct huffchar * min1 , struct huffchar * min2 ,int seqno)
            {
            compound->freq=(min1->freq + min2->freq);
            compound->is_compound=1;
            compound->u.compound.left=min1;
            compound->u.compound.right=min2;
            compound->seqno=seqno;
        }
// using the character frequencies build the tree of compound
// and simple characters that are used to compute the Huffman codes
void huffcoder_build_tree(struct huffcoder * this)
{
    struct huffchar ** list[NUM_CHARS];
    for (int i=0; i<NUM_CHARS; i++) {
        list[i]= malloc(sizeof(struct huffchar));
        list[i] ->freq=this->freqs[i];
        list[i] ->is_compund=0;
        list[i] ->seqno=i;
        list[i] ->u.c=i;
    }
    int counter= NUM_CHARS;
    while (counter>1) {
        //take out 2 smallest
        int smallest=find_least_freq(list,counter);
        struct huffchar * min1 = list[smallest];
        list[smallest]=list[counter-1];
        smallest=find_least_freq(list, counter-1);
        
        struct huffchar * min2 = list[smallest];
        list[smallest]=list[counter-2];
        
        
        struct huffchar * compound;
        compound=new_compound(compund,min1,min2,seqno);
        seqno++;
        counter--;
        list[counter-1]=compound;
    }
    this->tree=list[counter];
}

void  huffercoder_tree2table_recursive( struct huffchar * current,char * path , int depth, char ** codes, int * code_lengths)
{
    if( current->is_compound ==1)
    {
        path[depth] = '0';
        huffercoder_tree2table_recursive(current->u.compound.left, path , depth+1 ,codes, code_lengths);
        path[depth] = '1';
        huffercoder_tree2table_recursive(current->u.compound.right, path , depth+1 ,codes,code_lengths);
    }
    else
    {
        char c = current->u.c;
        code_lengths[c]=depth;
        path[depth]="\0";
        codes[c]= clone_string(path);
    }
}

// using the Huffman tree, build a table of the Huffman codes
// with the huffcoder object
void huffcoder_tree2table(struct huffcoder * this)
{
    char path[NUM_CHARS];
    int depth=0;
    huffercoder_tree2table_recursive(this->tree, path,depth,this->codes,this->code_lengths);
}


// print the Huffman codes for each character in order;
// you should not modify this function
void huffcoder_print_codes(struct huffcoder * this)
{
  for ( int i = 0; i < NUM_CHARS; i++ ) {
    // print the code
    printf("char: %d, freq: %d, code: %s\n", i, this->freqs[i], this->codes[i]);;
  }
}

// encode the input file and write the encoding to the output file
void huffcoder_encode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
    FILE* resultFile=fopen(output_filename,"w");
    FILE* readFile = fopen(input_filename, "r");
      char tmp = fgetc(readFile);
        // encode until EOT is hit
        while(!feof(readFile)){
            fputc(this->codes[tmp],resultFile);
            tmp=fgetc(readFile);
        }

    fclose(readFile);
    fclose(resultFile);
}
// decode the input file and write the decoding to the output file
void huffcoder_decode(struct huffcoder * this, char * input_filename,
    char * output_filename)
{
    FILE* resultFile=fopen(output_filename,"w");
    FILE* readFile = fopen(input_filename, "r");
    char tmp = fgetc(readFile);
    
      while(!feof(readFile)){
          struct huffchar* node = this->tree;
          while(node->is_compound){
              if(tmp=='0')
              {
               node = node->u.compound.left;
               }
            else if(tmp == '1'){
              node = node->u.compound.right;
            }
          }
          fputc(node->u.c,resultFile);
          tmp=fgetc(readFile);
      }
  fclose(readFile);
  fclose(resultFile);
}
}
