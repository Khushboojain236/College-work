;
; CSU11021 Introduction to Computing I 2019/2020
; Adding the values represented by ASCII digit symbols
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, ='2'	; Load R1 with ASCII code for symbol '2'
	LDR	R2, ='4'	; Load R2 with ASCII code for symbol '4'

	; your program goes here
 
	LDR R1,=0x032 
	SUB R1,R1,#'0'  ; converted to its character
	
	LDR R2,=0x034
	SUB R2,R2,#'0'  ; converted to its character
	
	
	ADD R0,R1,R2   ; adding the characters

	ADD R0,R0,#'0'    ; converting to ASCII value
STOP	B	STOP

	END
