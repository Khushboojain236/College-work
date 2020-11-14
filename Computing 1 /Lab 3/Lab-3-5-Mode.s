;
; CSU11021 Introduction to Computing I 2019/2020
; Mode
;

	AREA	RESET, CODE, READONLY
	ENTRY

	LDR	R4, =tstN	; load address of tstN
	LDR	R1, [R4]	; load value of tstN

	LDR	R2, =tstvals	; load address of numbers 
	;
	; Write your progam here to compute the mode in R0
	; 
	
	
	
	LDR R5,=0;[i]=0
while
        LDR R8,[R2]     ; in this while loop we make sure that one number is fixed once and it checks for same occurence through the string
        CMP  R5,R1     ;whie([i]<numberofTerms)
	BHS  endwh      
	LDR  R9,=0      ;count=0
	ADD  R5,R5,#1   ;i++
	LDR  R6,=0     ;[j]=0
	LDR  R3,=tstvals   ; we reload the values of string so they start from beginning   
whileis
    CMP  R6,R1      ;while(j<numberOfTerms)
    BHS  endwhileis
    ADD  R6,R6,#1 	;j++
    LDR  R7,[R3]
ifis  
   CMP  R7,R8     ;if(address[i]==address[j]) 
   BNE  endifis   ;{
   ADD  R9,R9,#1  ;count++
endifis   
    ADD	 R3,R3,#4 ; address[j]++
    B	 whileis  ;}
endwhileis
	CMP  R9,R11   ;if(count>maxCount)   we check if the newcount is greater than the previouscount we change the values 
	BLO  endifis2  ;{
	MOV  R11,R9    ;count= maxcount
	MOV  R0,R8     ;mode= currentNumber  
endifis2                ;}
	 ADD  R2,R2,#4  ; memoryaddress [i]++
	  B   while     ;}
endwh	

STOP	B	STOP

tstN	DCD	11		; N (number of numbers)
tstvals	DCD	5, 3, 7, 5, 3, 7, 1, 9,4,7,9	; numbers

	END
