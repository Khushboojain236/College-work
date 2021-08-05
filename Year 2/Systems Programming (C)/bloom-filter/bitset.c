
#include "bitset.h"

// create a new, empty bit vector set with a universe of 'size' items
struct bitset * bitset_new(int size) {
    struct bitset*result;
    float word_size=sizeof(uint64_t)*8;
    int words=ceil(size/ word_size);
    result->size_in_words=words;
    result->universe_size=size;
    result->bits=malloc(sizeof(uint64_t)*words);
    for (int i=0; i<words; i++) {
        result->bits[i]=0;
    }
    return result;
}

// get the size of the universe of items that could be stored in the set
int bitset_size(struct bitset * this) {
    return this->universe_size;
}

// get the number of items that are stored in the set
int bitset_cardinality(struct bitset * this){
    int cardinality=0;
    int word_size=sizeof(unit64_t)*8;
    for (int i=0; i<this->size_in_words; i++) {
        unit64_t * tmp=this->bits[i];
        for (int j=0;j<word_size;j++)
        {
            if(tmp[j]==1)
            {
                cardinality++;
            }
        }
    }
    return cardinality;
}

// check to see if an item is in the set
int bitset_lookup(struct bitset * this, int item){
    assert(item>=0 && item<this->universe_size)
    int word_size=sizeof(unit64_t)*8;
    int word=item/word_size;
    int bit=item % word_size;
    uint64_t val= this->bit[word];
    uint64_t mask= 1<<bit;
    int result_is=val & mask;
    return result_is>>bit;
}

// add an item, with number 'item' to the set
// has no effect if the item is already in the set
void bitset_add(struct bitset * this, int item) {
    assert(item>=0 && item<this->universe_size)
    int word_size=sizeof(unit64_t)*8;
    int word=item/word_size;
    int bit=item % word_size;
    uint64_t old_val= this->bit[word];
    uint64_t mask= 1<<bit;
    this->bit[word]=old_val|mask;
}

// remove an item with number 'item' from the set
void bitset_remove(struct bitset * this, int item) {
    assert(item>=0 && item<this->universe_size)
    int word_size=sizeof(unit64_t)*8;
    int word=item/word_size;
    int bit=item % word_size;
    uint64_t old_val= this->bit[word];
    uint64_t mask=~[1<<bit];
    this->bit[word]=old_val & mask;
}

// place the union of src1 and src2 into dest;
// all of src1, src2, and dest must have the same size universe
void bitset_union(struct bitset * dest, struct bitset * src1,
    struct bitset * src2) {
    int size=bitset_size(src1);
    for(int i=0;i<size;i++)
    {
        if(bitset_lookup(src1,i)==1 || bitset_lookup(src2,i)==1)
        {
            bitset_add(dest,i);
        }
        else
        {
            bitset_remove(dest,i);
        }
    }
    
}

// place the intersection of src1 and src2 into dest
// all of src1, src2, and dest must have the same size universe
void bitset_intersect(struct bitset * dest, struct bitset * src1,
    struct bitset * src2) {
    int size=bitset_size(src1);
    for(int i=0;i<size;i++)
    {
        if(bitset_lookup(src1,i)==1 & bitset_lookup(src2,i)==1)
        {
            bitset_add(dest,i);
        }
        else
        {
            bitset_remove(dest,i);
        }
    }
    
}
