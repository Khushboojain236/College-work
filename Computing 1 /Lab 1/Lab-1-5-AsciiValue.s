;
; CSU11021 Introduction to Computing I 2019/2020
; Convert a sequence of ASCII digits to the value they represent
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='0'	; Load R2 with ASCII code for symbol '0'
	LDR	R3, ='3'	; Load R3 with ASCII code for symbol '3'
	LDR	R4, ='4'	; Load R4 with ASCII code for symbol '4'

	; your program goes here
	LDR R5,='0'  
	SUB R1,R1,R5   ;the ASCII code is converted into its character
	LDR R6,=1000  
	MUL R1,R6,R1   ; then multiplied to its decimal place, here 1000
	
	SUB R2,R2,R5
	LDR R6,=100
	MUL R2,R6,R2   ; multiplied to its decimal place, here 100
	
	SUB R3,R3,R5
	LDR R6,=10
	MUL R3,R6,R3    ; multiplied to its decimal place, here 10
	
	SUB R4,R4,R5
	ADD R7,R1,R2   
	ADD R0,R3,R4
	ADD R0,R0,R7   ; result

STOP	B	STOP

	END
