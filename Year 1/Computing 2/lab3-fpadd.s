;
; CS1022 Introduction to Computing II 2018/2019
; Lab 3 - Floating-Point
;

	AREA	RESET, CODE, READONLY
	ENTRY

;
; Test Data
;
;FP_A	EQU 0xC0400000 ;-3
;FP_B	EQU 0x3F000000 ;0.5

FP_A	EQU 0x3FA00000 ;1.25
FP_B	EQU 0x3F400000 ;0.75

;FP_A	EQU 0xBF400000 ;-0.75
;FP_B	EQU 0xBE800000 ;-0.5

	; initialize system stack pointer (SP)
	LDR SP, =0x40010000
start
	;
	; test your subroutines here  
	;
	LDR R0,=FP_A   ;storing first value in register
	LDR R1,=FP_B   ;storing second value in register
	BL  fpadd      ;calling subroutine to add
stop	B   stop

;
;fpadd
;adds two IEEE 754 floating point values 
;returns the result as an IEEE 754 floating point value
;parameters:
;r0 - ieee 754 float- float1
;r1 - ieee 754 float- float2
;return:
;r2 - result in form of ieee 754 float 
;
fpadd
	PUSH {R4-R12,lr}
	MOV  R4,R0  ;moving float1 to register
	BL   fpexp  ;calling subroutine for decoding exponent
	MOV  R6,R0  ;exp1 as 2s complements
	MOV  R5,R1  ;moving float2 into another register
	MOV  R0,R5  ;to pass the parameter (float2) to the subroutine
	BL   fpexp
	MOV  R7,R0  ;exp2
	
	MOV  R0,R4
	BL   fpfrac ;calling subroutine to decode the fraction of float1
	MOV  R8,R0  ;frac1
	MOV  R0,R5
	BL   fpfrac ;calling subroutine to decode the fraction of float2
	MOV  R9,R0  ;frac2
	CMP  R8,#0  ;checking if the frac1 is less than zero
	BLT  isneg  ; if it is convert it from its two complement's to have the 23 bits of fraction
checknext
	CMP  R9,#0  ;checking if frac2 is less than zero
	BGT  dothis 
	NEG  R9,R9  ;is less than zero  but change it from its 2's complement value to change it to its fraction bytes
	b    dothis 

isneg	
	NEG  R8,R8    ;is less than zero  but change it from its 2's complement value to change it to its fraction bytes
	 B  checknext ;wants to check for frac2 
dothis
	MOV  R0,R4     
	BL   fpsign
	MOV  R11,R0 ;sign bit of float1 - sign1
	MOV  R0,R5
	BL   fpsign
	MOV  R12,R0 ;sign bit of float2 - sign2
	
	
comparingexp
        ORR R9,R9,#0x00800000 ;placing the hidden bit to the fractions
	ORR R8,R8,#0x00800000
        CMP R6,R7             ;comparing the two exponents exp1 and exp2
	BEQ adding            ;if they are equal then the fractions can be added
	BGT firstBigger       ;if (exp1>exp2) then branch  
	B   secondBigger      ;if (exp1<exp2)
	
firstBigger
	SUB R10,R6,R7         ;counter=exp1-exp2
dofirst                       
        CMP R10,#0            ;while (counter>0)
	BEQ endfirst          ;{
	MOV R9,R9,LSR #1      ;shift the fraction to right by one bit
        SUB R10,R10,#1        ;counter--
	ADD R7,R7,#1          ;exp2++
	B   dofirst           ;}
endfirst
	B   adding            ;to add the fractions
secondBigger
        SUB R10,R7,R6         ;counter=exp2-exp1
dosecond
        CMP R10,#0            ;while (counter>0)
	BEQ endsecond         ;{
	MOV R8,R8,LSR #1      ;shift the fraction to right by one bit
        SUB R10,R10,#1        ;counter--
	ADD R6,R6,#1          ;exp1++
	B   dosecond          ;}
endsecond
	B  adding             ;to add the fractions
adding
        CMP R11,#0x80000000   ;if(sign1==negative)
	BEQ negfirst          ;branch to negfirst
	CMP R12,#0x80000000   ;if(sign2==negative)
	BEQ negsec            ;branch to negsec
	ADD R0,R8,R9          ; as both are positive add the two fractions frac1+frac2
	MOV R1,R6             ;passing the exponent
	B   posSign           ; assigning sign bit

negfirst
	CMP R12,#0x80000000  ;if(sign2==negative)
	BEQ negboth          ;branch to both floats are negative
	SUB R0,R9,R8         ;result=frac2- frac1
	CMP R8,R9            ; if(frac1>frac2)
	BGT negsign          ; then sign is negative
	B   posSign          ; else is positive

negsec
	SUB R0,R8,R9         ;result=frac1- frac2
	CMP R9,R8            ;if(frac2>frac1)
	BGT negsign          ;then sign is negative 
	B   posSign          ;else positive
	
negboth 
        ADD R0,R8,R9         ;as both are negative so frac1+frac2
	B   negsign          ;sign will be negative

negsign
        LDR R10,=0x80000000  ;assigning sign bit 1
	MOV R1,R6            ;passing the exponent
	BL fpencode          ;to encode result into iee 754 float
	ADD R0,R0,R10        ;adding the sign bit
	B   endresult        
	
posSign
        LDR R10,=0x00000000  ;assigning sign bit 0
	MOV R1,R6            ;passing the exponent
	BL fpencode
	ADD R0,R0,R10        ;adding the sign bit
	B   endresult	
endresult	
	POP {R4-R12,PC}	
	
;fpsign
;gets the sign bit of the IEEE 754 floating point value 
;parameters
;    r0 - ieee 754 float
;return:
;    r0 - signed bit
;
fpsign
	PUSH {R4,lr}
	LDR  R4,=0x7FFFFFFF   ;mask
	BIC  R4,R0,R4         ;clearing out rest to get the last bit, ie 32nd bit 
	MOV  R0,R4            ;signed bit
	POP  {R4,PC}

;
; fpfrac
; decodes an IEEE 754 floating point value to the signed (2's complement)
; fraction
; parameters:
;	r0 - ieee 754 float
; return:
;	r0 - fraction (signed 2's complement word)
;
fpfrac

;
; your decode subroutine goes here
;
	PUSH {R4-R7,lr}
	MOV  R4,R0               
	BIC  R7,R4,#0x7FFFFFFF  ;to store the signed bit

	LDR  R5,=0xFF800000     ;mask to extract bits 0 to 22nd
	BIC  R4,R4,R5
	
	
	CMP  R7,#0x80000000    ;if (signed bit==1)
	BNE  ispositive        ;{
	NEG  R4,R4             ;then fraction is negative as it depends on the signed bit 
	MOV  R0,R4             ;}
ispositive 
	MOV  R0,R4
	
	
	POP {R4-R7,pc}



;
; fpexp
; decodes an IEEE 754 floating point value to the signed (2's complement)
; exponent
; parameters:
;	r0 - ieee 754 float
; return:
;	r0 - exponent (signed 2's complement word)
;
fpexp

	;
	; your decode subroutine goes here
	;
	PUSH {R4-R8,LR}
	MOV  R4,R0
	
	
	LDR  R6,=0x807FFFFF  ;mask to extract the extract the exponent bits, ie 23 to 31 bits
	BIC  R5,R4,R6
	MOV  R7,R5,LSR #23   ;shift it to the right
	LDR  R8,=127         ; biased 
	SUB  R4,R7,R8        ;result (signed 2s complement)=exponent-biased
	MOV  R0,R4           
	POP  {R4-R8,PC}
	

;
; fpencode
; encodes an IEEE 754 value using a specified fraction and exponent
; parameters:
;	r0 - fraction (signed 2's complement word)
;	r1 - exponent (signed 2's complement word)
; result:
;	r0 - ieee 754 float
;
fpencode
                                                                                   
	;
	; your encode subroutine goes here
	;

	PUSH {R4-R11,LR}
	MOV  R4,R0    ;frac
	MOV  R5,R1    ;exp
	
	
	
	CMP R4,#0      
	BGT checkexp  
	NEG R4,R4    
checkexp
	LDR  R7,=127      ; biased
	CMP  R5,#0        ;if (exp<0)
	BGT Ispositive    ;{ 
	NEG  R5,R5        ;exp=-(-exp)
	SUB  R5,R7,R5     ;exp=127-exp
	B   checkf        ;}
Ispositive
	ADD R5,R7,R5      ;exp=exp+biased
	B   checkf
;normalising the fraction
;we check if the most significant bit of the passed fraction is one or not
;if it is not we shift it accordingly
;if we shift it to the right then we increment the exponent
;else shifting left we decreament the exponent
checkf
	LDR R8,=0x00800000  
	CMP R4,R8          
	BHS doelse
do
	MOV R4,R4,LSL #1
	SUB R5,R5,#1
	AND R9,R8,R4
	CMP R9,R8
	BEQ calc
	BNE do
doelse
	AND R9,R8,R4
	CMP R8,R9
	BEQ dothen
	MOV R4,R4,LSR #1
	ADD R5,R5,#1
	AND R9,R8,R4
	CMP R9,R8
	BEQ dothen
	BNE doelse
dothen
	LDR R11,=0xFF000000
	BIC R4,R4,R11 
	B   calc
calc
	BIC  R4,R4,R8     ;clear 23 bit
	MOV  R5,R5,LSL#23 ; shift the exponent to its position,ie 23 to 31
	ADD  R0,R4,R5     ;adding the frac and exponent

	POP   {R4-R11,PC}
	

	END
