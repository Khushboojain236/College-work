;
; CSU11021 Introduction to Computing I 2019/2020
; Basic ARM Assembly Language
;

	AREA	RESET, CODE, READONLY
	ENTRY

; Write your solution for all parts (i) to (iv) below.

; Tip: Right-click on any instruction and select 'Run to cursor' to
; "fast forward" the processor to that instruction.

; (i) 3x+y
	LDR	R1, =2	 ; x = 2
	LDR	R2, =3	 ; y = 3
	

	; your program goes here

	MOV R3,#3	 ;tmp=3	
	MUL R0,R1,R3 ;result=x*tmp
	ADD R0,R0,R2 ;result=result+y



; (ii) 3x^2+5x
	LDR	R1, =2	; x = 2
	
	; your program goes here
	LDR R3,=3
	MUL R0,R1,R1 ;result=x*x
	MUL R0,R3,R0 ;result=3*x*x
	LDR R3,=5    ;tmp=5
	MUL R3,R1,R3 ;tmp= x*5
	ADD R0,R3,R0 ;result=result+tmp
	

; (iii) 2x^2+6xy+3y^2
	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3
	

	; your program goes here
	MOV R3,#2    ;tmp=2
	MUL R0,R1,R1 ;result=x*x
	MUL R0,R3,R0 ;result=tmp*result
	
	MOV R3,#6
	MUL R4,R1,R2 ;tmpn=x*y
	MUL R3,R4,R3 ;tmp=tmpn*6
	
	MOV R4,#3    ;tmpn=3
	MUL R5,R2,R2 ;tmp1=y*y
	MUL R4,R5,R4 ;tmpn=tmp1*3
	ADD R6,R3,R4 ;result1=tmp+tmpn
	ADD R0,R0,R6 ;result=result+result1
	


; (iv) x^3-4x^2+3x+8
	
	LDR	R1, =2	; x = 2
	LDR	R2, =3	; y = 3

	; your program goes here
	MUL R4,R1,R1 ; tmp=x^2  
	MUL R0,R1,R4 ; result=x^2*x
	MOV R3,#4    ; tmpn=4
	MUL R3,R4,R3 ; tmpn= 4x^2
	SUB R0,R0,R3 ;result=x^3-4x^2
		
	MOV R5,#3    ;tmp1=3
	MUL R5,R1,R5 ;tmp1=3*x
	MOV R6,#8    ;tmp2=8
	ADD R7,R5,R6 ;result1=tmp1+tmp2
    ADD R0,R0,R7 ; result=result+result1

STOP	B	STOP

	END
