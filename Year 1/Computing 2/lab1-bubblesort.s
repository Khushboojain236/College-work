;
; CS1022 Introduction to Computing II 2019/2020
; Lab 1B - Bubble Sort
;

N	EQU	10
TRUE EQU 1
FALSE EQU 0

	AREA	globals, DATA, READWRITE

; N word-size values

SORTED	SPACE	N*4		; N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY


	;
	; copy the test data into RAM
	;

	LDR	R4, =SORTED
	LDR	R5, =UNSORT
	LDR	R6, =0
whInit	CMP	R6, #N
	BHS	eWhInit
	LDR	R7, [R5, R6, LSL #2]
	STR	R7, [R4, R6, LSL #2]
	ADD	R6, R6, #1
	B	whInit
eWhInit
    LDR R9,=N
	LDR	R4, =SORTED
	LDR	R5, =UNSORT

	;
	; your sort subroutine goes here
	;
outerloop       ;do 
   ldr r3,=0    ;to check the index of the array element ; number of elemets count
do	
   LDR R10,=1    ;index of the array,i
sortloop
   LDR R0,=FALSE    ;setting swapped as false swapped = false ;
   
for
   CMP R10,R9    ;index of the array is less than the number of elements,i ;for ( i = 1 ; i < N; i ++)
   BHS endfor    
   SUB R8,R10,#1 ; storing index of previous element i-1
   LDR R1,[R4,R10,LSL #2] ; to load the element of the array[i]
   LDR R2,[R4,R8, LSL #2] ; to load the element of the array[i-1]  
checkif
   CMP R2,R1                ; if(array[ i -1] >array[ i ])
   BLS endifis              ;{
   MOV R11,R2               ;tmpswap = array [ i -1];
   MOV R2,R1                ;array[i -1] =array[ i ] ;
   MOV R1,R11               ;array[ i ] = tmpswap ;
   LDR R0,=TRUE                ;swapped = t r u e ;
   STR R2,[R4,R8, LSL#2]    ; storing back the array element back after swapping
   STR R1,[R4,R10,LSL#2]    ;}
   ADD R10,R10,#1           ;index of the array i++
   B   for
endifis
  ADD R10,R10,#1            ; index++ even if it is already smaller as we want to check it with the other elements too
  B   for                   ;     
endfor
  CMP  R0,#TRUE               ; to check that the swap is true } whil e ( swapped ) ; 
  BEQ  sortloop
  ADD  R3,R3,#1            ;add one to number of elements cause we want to check the order for every element in the array
  CMP  R3,#N               ;we compare it to the total number as to make sure it works for all
  BHS  endit
   B   do
endit

   
stop B stop

  




   
   
   
   
	
	

UNSORT	DCD	9,3,0,1,6,2,4,7,3,7

	END
