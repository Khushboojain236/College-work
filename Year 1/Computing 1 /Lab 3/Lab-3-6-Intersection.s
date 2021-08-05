;
; CSU11021 Introduction to Computing I 2019/2020
; Intersection
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; address of sizeC
	LDR	R1, =0x40000004	; address of elemsC
	
	LDR	R6, =sizeA	; address of sizeA
	LDR	R2, [R6]	; load sizeA
	LDR	R3, =elemsA	; address of elemsA
	
	LDR	R6, =sizeB	; address of sizeB
	LDR	R4, [R6]	; load sizeB
	LDR	R5, =elemsB	; address of elemsB

	;
	; Your program to compute the interaction of A and B goes here
	;
	; Store the size of the intersection in memory at the address in R0
	;
	; Store the elements in the intersection in memory beginning at the
	;   address in R1
	;
  LDR R8,=0     ; countA=0
while
  LDR R7,[R3]   ;ch1=addressofelemsA
  CMP R8,R2     ;while(countA<sizeA)
  BHS endwh     ;{
  ADD R8,R8,#1  ;countA++
  LDR R12,=0    ;countB=0
  LDR R5,=elemsB ; we load elements of B everytime to make sure they start from very beginning
whileis
  CMP R12,R4     ;while(countB<sizeB)
  BHS endwhileis  ;{
  ADD R12,R12,#1  ;countB++
  LDR R10,[R5]    ; load element of string B in  ch2
ifis
  CMP R7,R10     ;if(ch1==ch2)
  BNE endifis    ;{
  
  LDR R11,[R1]   ;load memory1 which will store the elements of intersection between a and b 
  MOV R11,R7     ; we store ch 
  STR R11,[R1]   ; store ch in the memory1
  ADD R1,R1,#4   ; memory1=memory1+4 
  
  LDR R9, [R0]   ; we load memory2 which store the number of elements in c
  ADD R9,R9,#1   ; we increase it every time we add a element by 1 as number of element increases
  STR R9, [R0]   ;we store the result back in memory2

endifis          ;}
  ADD R5,R5,#4   ;ch2+4 =ch2 we add 4 as to get the next element of string
  B   whileis    ;}
endwhileis
  ADD R3,R3,#4   ;ch1+4=ch1 as to get to next element
  B  while      ;}
endwh
  

STOP	B	STOP

sizeA	DCD	5
elemsA	DCD	7, 14, 6, 3,8

sizeB	DCD	9
elemsB	DCD	20, 11, 14, 5, 7, 2, 9, 12, 8

	END
