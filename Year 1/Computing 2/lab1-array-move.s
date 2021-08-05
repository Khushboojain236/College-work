;
; CS1022 Introduction to Computing II 2018/2019
; Lab 1 - Array Move
;

N	EQU	16		; number of elements

	AREA	globals, DATA, READWRITE

; N word-size values

ARRAY	SPACE	N*4		; N words


	AREA	RESET, CODE, READONLY
	ENTRY

	; for convenience, let's initialise test array [0, 1, 2, ... , N-1]

	LDR	R0, =ARRAY
	LDR	R1, =0
L1	CMP	R1, #N
	BHS	L2
	STR	R1, [R0, R1, LSL #2]
	ADD	R1, R1, #1
	B	L1
L2

	; initialise registers for your program

	LDR	R0, =ARRAY
	LDR	R1, =3
	LDR	R2, =6
	LDR	R3, =N
	ADD    R11,R2,#1

	; your program goes here
	
check 
    CMP   R1,R2
	BHI   ifis
	MOV   R10,R1
    MOV   R1,R2
	MOV   R2,R10
	
ifis	
	
	CMP    R2,R3
	BHS    endis
	LDR    R6,[R0,R1,LSL#2]
	LDR    R5,[R0,R2,LSL#2]
	SUB    R10,R2,#1    ;2
	SUB    R8,R1,#1     ;5
	MOV    R4,R1
	
do	CMP    R4,R11
        BEQ    dostore
        CMP    R8,R10
	BEQ    dostore
	LDR    R9,[R0,R8,LSL#2]
	STR    R9,[R0,R4,LSL#2]
	SUB    R8,R8,#1
	SUB    R4,R4,#1
	B      do
	B       ifis
dostore
        STR    R6,[R0,R2,LSL#2]
	STR    R5,[R0,R4,LSL#2]

endis

STOP	B	STOP

	END
