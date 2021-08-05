;
; CSU11021 Introduction to Computing I 2019/2020
; GCD
;

	AREA	RESET, CODE, READONLY
	ENTRY

	;
	; Your program goes here
	;
	 LDR R2,=32   ; a=64
	 LDR R3,=64  ;b=32
while
	CMP R2,R3    ;while(a!=b)
	BEQ endwhile ;{

	CMP R2,R3     ;if(a>b)
	BLS elsedo    ; {
	SUB R2,R2,R3  ; a=a-b
	MOV R0,R2     ; to store result
	B   while     ;}
elsedo            ;else{
	SUB R3,R3,R2  ;b=b-a 
	MOV R0,R3     ; to store result
	B   while     ;}
endwhile           ;}
STOP	B	STOP

	END