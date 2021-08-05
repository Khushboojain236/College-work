;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Matrix Multiplication
;

N	EQU	4		

	AREA	globals, DATA, READWRITE

; result array
ARR_R	SPACE	N*N*4		; N*N words (4 bytes each)


	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR  SP,=0x40010000
	LDR  R10,=ARR_A  ; loading the address of matrix A
	LDR  R9,=ARR_B   ; loading the address of matrix B
	LDR  R8,=ARR_R   ; loading the address of matrix R
	LDR  R7,=N       ;loading the size of row elements 
	MOV  R0,#0    ;i=0
for
	CMP  R0,#N    ;i<N 
	BHS  endfor   ;if higher branch to the end of the loop
	MOV  R1,#0   ;j=0
for1
    CMP  R1,#N    ; j < N
	BHS endfor1  ;if higher branch to the end of the loop
	MOV  R2,#0  ; r=0
	MOV  R3,#0  ;k=0
for2
    CMP R3,#N    ;k < N
	BHS endfor2  ;if higher branch to the end of the loop
	
	MUL R4,R0,R7          ; multiply  index=row by row elements size
	ADD R4,R4,R3          ;index=index+column
	LDR R5,[R10,R4,LSL#2] ; element to be loaded defined by array to be seen with index multiplied by 4
	
	MUL R11,R3,R7         ; multiply  index=row by row elements size
	ADD R11,R11,R1        ;index=index+column
	LDR R6,[R10,R11,LSL#2]; element to be loaded defined by array to be seen with index multiplied by 4
	
	MUL R12,R5,R6 ;( A[ i , k ] * B[ k , j ] )
	ADD R2,R2,R12 ;r = r +( A[ i , k ] * B[ k , j ] )
	ADD  R3,R3,#1  ;  k++
	B   for2        ; branch back to for2 loop
endfor2
    MUL R5,R0,R7 ; to store back we create the offset similarly by multiplying row into row elemsize
	ADD R5,R5,R1 ; adding the column
	STR R2,[R8,R5,LSL#2] ; multiplying the offset by 4  R[ i , j ] = r ;
	ADD R1,R1,#1   ; j ++
	B    for1      ; branch back to for1 loop
endfor1
    ADD  R0,R0,#1    ; i ++
	 B   for         ; branch back to for loop
endfor
	

    
	
	
STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

ARR_B	DCD	 1,  2,  3,  4
	DCD	 5,  6,  7,  8
	DCD	 9, 10, 11, 12
	DCD	13, 14, 15, 16

	END
