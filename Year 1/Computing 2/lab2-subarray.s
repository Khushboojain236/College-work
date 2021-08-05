;
; CS1022 Introduction to Computing II 2018/2019
; Lab 2 - Subarray
;

N	EQU	7
M	EQU	3
FALSE EQU 0
TRUE  EQU 1	

	AREA  RESET, CODE, READONLY
	ENTRY

	; initialize system stack pointer (SP)
	LDR	SP, =0x40010000
    LDR R1,=LARGE_A
	LDR R2,=SMALL_A
	LDR R5,=N
	LDR R6,=M
	MUL R0,R6,R6          ;m*m
	

	;
	; Write your program here to determine whether SMALL_A
	;   is a subarray of LARGE_A
	;
	; Store 1 in R0 if SMALL_A is a subarray and zero otherwise
	;
	LDR R3,=0                 ;LARGE_A row Counter
	LDR R8,=0                 ;SMALL_A row Counter
	LDR R9,=0                 ;SMALL_A column Counter
for1
    LDR R4,=0                 ;lARGE_A column Counter
load1
    CMP R3,#N                 ;compare that the LARGE_A row counter is still less than the row numbers
	BHS endfor1               ; end program as large_A has been fully checked 
startcheck
	MUL R7,R3,R5              ;INDEX of LARGE_A
	ADD R7,R7,R4              ; adding column counter to the index of LARGE_A
	LDR R7,[R1,R7,LSL#2]      ; loading the element of LARGE_A at the index 
for2
    CMP R8,#M                 ;comparing row counter of small_A
	BHS endfor2               ;if row counter is greater then end
	MUL R10,R6,R8             ;INDEX of small_A
	ADD R10,R10,R9            ;adding column to index
	LDR R10,[R2,R10,LSL#2]    ;loading the element of SMALL_A at the index
check
   CMP  R7,R10                ;compare the element of SMALL_A and LARGE_A
   BNE  endfor                ;keeping track of the column counter
   ADD  R11,R11,#1            ;counter to check the number of elements 
   CMP  R11,R0                ;to see if all the elements of the small_A have been checked
   BEQ  result                ;if they have been checked then go to result as it must be true
   ADD  R12,R12,#1            ;Counter column if they are equal to keep track of the column index where we found the match
   ADD  R4,R4,#1              ;increase large_A column counter
   ADD  R9,R9,#1              ; small_A column counterr++
   CMP  R12,R6                ;compare counter column with small_a number of columns cause we know it must be equal to sub array
   BHS  nextrowin             ;go to adding 1 to our row counter of large_A
   B    load1                 ;else go to loading the next element in same row 
   
nextrowin
   ADD  R3,R3,#1              ; getting to next row
   SUB  R4,R4,R6              ; we need to get our column Counter of large A back to index where we found our first match 
   MOV  R12,#0                ; setting counter column back to 0 
   
   B    load1                 ; going to loading elements
endfor
   CMP  R4,#N                 ;comparing column counter of large A
   BHS  nextrow               ; go to next row if greater
   ADD  R4,R4,#1              ; add  column++
   B   startcheck             ;load next element
nextrow
   ADD  R3,R3,#1             ; add to row counter++
   B    for1                 ; go back to loading
endfor1
endfor2	
  LDR   R0,=FALSE            ; if not all the elements were present then its false
   B   STOP                  ; go to end

result
  LDR  R0,=TRUE              ; if all the elements were present then its a sub array 
	   
	 
 



STOP	B	STOP


;
; test data
;

LARGE_A	DCD	 48, 37, 49, 44,18, 17, 26
	DCD	  2,  9, 12, 18, 14, 33, 16
	DCD	 13, 20,  1, 22,  7, 48, 21
	DCD	 27, 19, 44, 49, 44, 18, 10
	DCD	 29, 17, 22,  4, 46, 43, 41
	DCD	 37, 35, 38, 34, 16, 25,  0
	DCD	 17,  0, 48, 15, 27, 35, 11

SMALL_A	DCD	 49, 44, 18
	DCD	  4, 46, 43
	DCD	 34, 16, 25

	END
