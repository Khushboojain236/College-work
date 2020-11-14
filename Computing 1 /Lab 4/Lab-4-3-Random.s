;
; CSU11021 Introduction to Computing I 2019/2020
; Pseudo-random number generator
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =0x40000000	; start address for pseudo-random sequence
	LDR	R1, =64; number of pseudo-random values to generate

	;
	; Write your program here
	;	

   LDR R8,=0           ;count=0
   LDR R5,[R0]         ;randomInt=memory[address] loading memory location
   LDR R5,=0x2D345F78  ;randomInt=seed
   STR R5,[R0]         ;memory[address]=randomInt
 
do
   CMP  R1,R8          ;while(count< number of values to generate) 
   BEQ endprogram      ; if greater end program
   LDR  R10,[R0]       ; loading the memory address
   MOV  R4,R5,LSR #13  ; shifting the seed value by a prime number (13) to right first ,temp1= seed>>13
   EOR  R9,R5,R4       ; random number= temp1 XOR seed
   MOV  R10,R9         ; moving random number to memory location
   STR  R10,[R0]       ; storing back in memory
   ADD  R0,R0,#4       ; memory location+=4
   ADD  R8,R8,#1       ; count++
   MOV  R5,R9          ; moving the random number to be seed value for generating next random number
   
   CMP  R1,R8          ;while(count< number of values to generate)
   BEQ  endprogram     ; if greater end program
   LDR  R10,[R0]       ; loading the memory address
   MOV  R6,R5,LSL #19  ; shifting the seed value by a prime number (19) to left first ,temp1= seed<<19
   EOR  R9,R5,R6       ; random number= temp1 XOR seed
   MOV  R10,R9         ; moving random number to memory location
   STR  R10,[R0]       ; storing back in memory
   ADD  R0,R0,#4       ; memory location+=4
   ADD  R8,R8,#1       ; count++
   MOV  R5,R9          ; moving the random number to be seed value for generating next random number
   B    do             ; to loop back while condition is true
   
   
  
endprogram
   
   
STOP	B	STOP

	END
