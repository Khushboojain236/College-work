;
; CSU11021 Introduction to Computing I 2019/2020
; Proper Case
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R0, =tststr	; address of existing string
	LDR	R1, =0x40000000	; address for new string

	;
	; Write your program here to create the Proper Case string
	;
	LDRB R2,[R0]  ;loading first letter of string 
	
	LDR  R5, =0   ;check for first letter of the string StringCheck=0  
	
	
whstr
         CMP   R5,#0          ;if(stringcheck==0)
	 BNE   checkis    ;{
	 B     do         ;we go to the do segment of the program to properly Upper case the first letter of string
checkis
          CMP  R2,#0      ; here we compare that we haven't reached the end of our string (ch!=0)
          BEQ  ewhstr     ; while(ch!=0)
          CMP  R2,#' '    ;then we check if (ch == '  ')
          BNE  check      ;{
	  ADD  R0,R0,#1   ;we add one to the address so we get next character
	  ADD  R1,R1,#1   ;memoryaddress++
       
do      LDRB  R2,[R0]   ; here we check that are loaded value is in what case
        CMP  R2,#'a'    ; if(ch>='a' &&ch<='z')
        BLO  elseis     ;{
        CMP  R2,#'z'
        BHI  elseis       ; we go to else
        SUB  R2,R2,#0x20  ; ch=ch-0x20
        B    store        ;}then we go to store the character back to memory
elseis  
       MOV  R2,R2         ;if first ch is an upperCase then we keep it as it is n then go to store
       B   store
store                     ;in store we create space to store in memory
       ADD    R5,R5,#1   
       STRB   R2,[R1]    ; store ch in memory address 
       ADD    R1,R1,#1   ;memoryaddress++
       ADD    R0,R0,#1   ;increase ch++ so it moves to next character in the string
       ADD    R5,R5,#1   ;stringcheck++
       LDRB   R2,[R0]    ; reload ch
        B      whstr

check 
ifup  
       CMP  R2,#'A'      ;if (ch>='A' && ch<='Z')
       BLO  elselc       ;{
       CMP  R2,#'Z'
       BHI  elselc
       ADD  R2,R2,#0x20   ; ch=ch+0x20
       B    store         ;} goes to store the character
elselc
      MOV   R2,R2         ;if first ch is an lowerCase then we keep it as it is n then go to store
      B     store
	
ewhstr
       

        

STOP	B	STOP

tststr	DCB	"tHe fOx",0

	END
