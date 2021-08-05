;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Upper Triangular
;
; the basic concept in here being we now for a matrix to be an upper triangular form it will have always the first row with no zeroes and the other rows afterwards will have row number -1 , 
;number of zeroes like 5th row will have 5-1=4 zeroes  
N	EQU	4		
TRUE EQU 1
FALSE EQU 0
	AREA	RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
	LDR R1,=ARR_A  ; loading the address of matrix A
	LDR R2,=N      ;loading the number of elements in the row

	;
	; write your program here to determine whether ARR_A
	;   (below) is a matrix in Upper Triangular form.
	;
	; Store 1 in R0 if the matrix is in Upper Triangular form
	;   and zero otherwise.
	;
	MOV R3,#1    ;i=0 is the row  
for
    CMP R3,#N    ;i<N
	BHS endfor   ;if higher branch to endfor
	MOV R4,#0    ;j=0 is the column
for1
    CMP R4,R3    ;j<i we only need to check elements in a row less than the number of row like if 3 then 2
	BHS endfor1  
	MUL R5,R3,R2  ;index=row*rowelemsize
	ADD R5,R5,R4  ;index=index+col
	LDR R6,[R1,R5 ,LSL#2] ; load the element of matrix A[i][j]
ifis
    CMP R6,#0      ; compare if its zero
	BNE itisnot    ;if not branch to is not
	LDR R0,=TRUE   ; then it is true
	ADD R4,R4,#1    ; we check next elem j++ basically move to next column element
	B  for1
itisnot
    MOV R0,#FALSE    ; if it ain't then false
	B    endfor
endfor1
	ADD  R3,R3,#1  ;i++
	 B    for
endfor


STOP	B	STOP


;
; test data
;

ARR_A	DCD	 1,  2,  3,  4
	DCD	 0,  6,  7,  8
	DCD	 0,  0, 11, 12
	DCD	 0,  0,  9, 16

	END
