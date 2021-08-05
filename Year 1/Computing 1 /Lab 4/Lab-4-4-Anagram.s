;
; CSU11021 Introduction to Computing I 2019/2020
; Anagrams
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr1	; first string
	LDR	R1, =tststr2	; second string

	;
	; Write your program here
	;
	
	LDR  R10,=0X40000000 ;memorylocation
whileload   
	LDRB R4,[R1]     ;loading the second string byte by byte
	ADD  R1,R1,#1    ;adding 1 to shift to next byte
	CMP  R4,#0       ;comparing we haven't reached the end of string which is zero
	BEQ  endstore    
	STRB R4,[R10]    ; storing the value in memory location
	ADD  R10,R10,#1  ;memorylocation++
	B    whileload   
endstore

	LDR  R6,=0       ;counter1=0  counter for string1
	LDR  R7,=0       ;counter2=0  counter for string2
	LDR  R1,=tststr2 ;loading string 2 back in register1
while
	LDRB R3,[R0]     ; loading byte of string1 = ch
	CMP  R3,#0       ; if(ch!=0)
	BEQ  whileis	 ;{
	ADD  R6,R6,#1    ;count++
	ADD  R0,R0,#1    ;ch=ch++, move to next byte
	B    while       ;}while is true
	
	
whileis
	LDRB R5,[R1]    ; loading byte of string2 = ch1
	CMP  R5,#0      ; if(ch1!=0)
	BEQ  check	    ;{
	ADD  R7,R7,#1   ;count1++
	ADD  R1,R1,#1   ;ch1=ch1++, move to next byte
	B    whileis    ;}while is true
	
check
    CMP R7,R6       ;comparing count == count1
    BNE notAnagram  ;if not equal end
	LDR R0,=tststr1 ;loading string 1 back 
    LDR R10,=0X40000000 ;memorylocation
    LDR R8,=1        ;store result is set to 1= anagram , 0= not an anagram
	
startwhile
    LDRB  R11,[R0]     ;loading byte
    CMP   R11,#0    
    BEQ   endprogram   ;check if value is zero end of string

    LDR R10,=0X40000000;reset everytime for inner loop
while2
    LDRB  R12,[R10]        ; loading byte 
	CMP   R12,#0
	BEQ   notAnagram   ;check if value is zero end of string
	
	CMP   R11,R12     ;testing whether that the two bytes are the same or not 
	BNE   notequal
	LDR   R9,=0xFF    ;if equal we set that byte to clear space
	STRB  R9,[R10]    ; store it back in memeory
	ADD   R0,R0,#1    ; move to next byte
	B     startwhile

notequal
    ADD   R10,R10,#1  ; moving to next byte of outer loop
	B     while2
	
notAnagram 
    LDR   R8,=0    ;if isnt an anagram result=0
    MOV   R0,R8    ; we move result to designated register
	B    endprogram ; we move result to designated register
	
	
endprogram
   MOV   R0,R8

STOP	B	STOP

tststr1	DCB	"tapas",0
tststr2	DCB	"pasta",0

	END
