;
; CSU11021 Introduction to Computing I 2019/2020
; 64-bit Shift
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R1, =0xabababab		; most significaint 32 bits (63 ... 32)
	LDR	R0, =0xabababab		; least significant 32 bits (31 ... 0)
	LDR	R2, =-2		; shift count
    
	;
	; Write your program here
	;
	LDR R3,=32           ;loading number of bits=32
	CMP R2,#0            ; to check if shift count is not zero
	BEQ endprogram       ; if it is zero end program
	BGT toright          ;if shift count is greater than zero move to right
	
	NEG R4,R2            ;as the shift count is negative so we make it positive n store in another register n=-(- Shift count)
	SUB R5,R3,R4         ; reverseShift=number of bits - n 
	MOV R6,R0,LSR R5     ;temp= shifting r0 by reverseShift to right
	MOV R1,R1,LSL R4     ;shifting r1 by n to left
	ORR R1,R1,R6         ;r1=temp|r1  so we get the required least significant bits that are the most significant bits out of shifting r0
	MOV R0,R0,LSL R4     ; we finally move r0 to left by the n
	B   endprogram
	
toright
    SUB R5,R3,R2         ; reverseShift=number of bits - shiftcount    
	MOV R6,R1,LSL R5     ;temp= shifting r1 by reverseShift to left
	MOV R0,R0,LSR R2     ;shifting r0 by shiftcount to right
	ORR R0,R0,R6         ;r0=temp|r0  so we get the required most significant bits that are the least significant bits out of shifting r1
	MOV R1,R1,LSR R2     ; we finally move r1 to right by the shiftcount
		
endprogram

STOP	B	STOP

	END
