;
; CS1022 Introduction to Computing II 2018/2019
; Magic Square
;

TRUE   EQU  1
FALSE  EQU  0
	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000

	LDR	R0, =arr1                ;address of array 1
	LDR	R4, =size1               ;loading the address of where the size of the array is stored
	LDR	R1, [R4]                 ;loading the value,N 

	;
	; test your subroutine here
	;
	BL     isMagic                  ;branching to the subroutine isMagic

STOP	B	STOP

;
; write your subroutine here
;
; to check whether the given square is a magic square or not
; compares firstly the sum of two diagonals
; then all of the indiviual rows sum
; then all of the indiviual columns sum
; looking for sum of the two diagonals,rows and columns is same
; Parameters
; R0- start address of arr1
; R1- the size of arr1
;
; Return
; R0-true:if it is a magic square
; R0-false:if it is not a magic square 

isMagic
	PUSH {R4-R12}
	MOV  R4,R0   		               ;address of array
	MOV  R5,R1                         ;size,N
	LDR  R6,=0                         ;i=0 row counter
	LDR  R7,=0                         ;j=0 column counter
	LDR  R8,=1                         ;counter
diagonal_left
	CMP  R8,R5                         ;if(counter<N){ ,comparing the counter to size 
	BHI  diagonal_right                ;branch if greater 
	MUL  R9,R6,R5                      ;index=row counter* size 
	ADD  R9,R9,R7                      ;index=index+column counter,adding column counter
	LDR  R10,[R4,R9,LSL #2]            ;element = Memory.word[address of array + (index*4)],loading the element 
	ADD  R11,R10,R11                   ;total1 =element+total1
	ADD  R6,R6,#1                      ;rowcounter++
	ADD  R7,R7,#1		               ;columncounter++
	ADD  R8,R8,#1                      ;incrementing counter
	B    diagonal_left                 ;}
diagonal_right                         ;checking the diagonal from far right
    LDR  R6,=0                         ;row counter=0 setting back to zero
	SUB  R7,R5,#1                      ;column counter=size -1 as the array starts with zero so last column reference will be one less 
	LDR  R8,=1                         ;counter
check_diagonal_right
    CMP  R8,R5                         ;if(counter<N){ ,comparing the counter to size  
	BHI  compare_diagonals	           ;branch if greater 
	MUL  R9,R6,R5                      ;index=row counter* size
	ADD  R9,R9,R7                      ;index=index+column counter,adding column counter
	LDR  R10,[R4,R9,LSL #2]            ;element = Memory.word[address of array + (index*4)],loading the element 
	ADD  R12,R10,R12                   ;total2=element+total2
	ADD  R6,R6,#1                      ;rowcounter++
	SUB  R7,R7,#1		               ;columncounter--
	ADD  R8,R8,#1                      ;incrementing counter
	B    check_diagonal_right          ;}
compare_diagonals                      ;comparing the sum of elements of the two diagonals 
        CMP   R11,R12                  ;if(total1==total2)
	BNE   not_magicSquare              ;if not then it is not a magic square 
	B     compare_horizontal           ;to compare further rows and columns
compare_horizontal                     ;comparing each individual rows total
	LDR   R6,=0                        ;row counter=0 setting back to zero
do_rows
        CMP   R6,R5                    ;if(row counter<= size)
	BHS   compare_vertical             ;{
	LDR   R7,=0                        ;columncounter=0 set it zero everytime we shift to next row
	LDR   R8,=0                        ;rowtotal=0,is now used for storing the row total so set to zero everytime 
is_row
	CMP  R7,R5                         ;if(columncounter<=size)
	BHS  compare_count                 ;{ if one row is completed branch to check total
	MUL  R9,R6,R5                      ;index=row counter* size
	ADD  R9,R9,R7                      ;index=index+column counter,adding column counter
	LDR  R10,[R4,R9,LSL #2]            ;element = Memory.word[address of array + (index*4)],loading the element 
	ADD  R8,R10,R8                     ;rowtotal=rowtotal+element
	ADD  R7,R7,#1                      ;columncounter++
	B     is_row                       ;}
compare_count	
	CMP  R8,R11                        ;if(rowtotal==total1)
	BNE  not_magicSquare               ;if not equal then is not a magic square
	ADD  R6,R6,#1                      ;rowcounter++
	B    do_rows                       ;}
compare_vertical
	LDR   R7,=0                        ;column counter=0 setting back to zero
do_columns                             ;comparing each individual columns total
        CMP   R7,R5                    ;if(column counter<= size)
	BHS   is_magicSquare               ;{
	LDR   R6,=0                        ;rowcounter=0 set it zero everytime we shift to next column
	LDR   R8,=0                        ;columntotal=0,is now used for storing the row total so set to zero everytime 
is_column
	CMP  R6,R5                         ;if(rowcounter<=size)
	BHS  compare_counts                ;{ if one column is completed branch to check total
	MUL  R9,R6,R5                      ;index=row counter* size
	ADD  R9,R9,R7                      ;index=index+column counter,adding column counter
	LDR  R10,[R4,R9,LSL #2]            ;element = Memory.word[address of array + (index*4)],loading the element 
	ADD  R8,R10,R8                     ;columntotal=rowtotal+element
	ADD  R6,R6,#1                      ;rowcounter++
	B     is_column                    ;}
compare_counts	
	CMP  R8,R11                        ;if(columntotal==total1)
	BNE  not_magicSquare              
	ADD  R7,R7,#1                      ;columncounter++
	B    do_columns                    ;}
is_magicSquare                           
    LDR   R0,=TRUE                     ;result is a magic square
	B     result
not_magicSquare
    LDR   R0,=FALSE                    ;is not a magic square
result
        POP   {R4-R12}
	BX     LR
;
; Test Data
;

size1	DCD	5		        ; a 3x3 array
arr1	DCD	17,24,1,8,15		; the array
	DCD	23,5,7,14,16
	DCD	4,6,13,20,22
	DCD     10,12,19,21,3
	DCD     11,18,25,2,9


	END
