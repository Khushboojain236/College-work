;
; CS1022 Introduction to Computing II 2018/2019
; Chess Clock
;
;some parts of code included have  been taken from CSU11022 course material from following examples
; polling,button int ,timer int , timer , blinky  

T0IR		EQU	0xE0004000
T0TCR		EQU	0xE0004004
T0TC		EQU	0xE0004008
T0MR0		EQU	0xE0004018
T0MCR		EQU	0xE0004014

T1IR		EQU 	0xE0008000
T1TCR		EQU	0xE0008004
T1TC		EQU	0xE0008008
T1MR0		EQU     0xE0008018
T1MCR		EQU	0xE0008014	
	
	
PINSEL4		EQU	0xE002C010

FIO2DIR1	EQU	0x3FFFC041
FIO2PIN1	EQU	0x3FFFC055

EXTINT		EQU	0xE01FC140
EXTMODE		EQU	0xE01FC148
EXTPOLAR	EQU	0xE01FC14C

VICIntSelect	EQU	0xFFFFF00C
VICIntEnable	EQU	0xFFFFF010
VICVectAddr0	EQU	0xFFFFF100
VICVectPri0	EQU	0xFFFFF200
VICVectAddr	EQU	0xFFFFFF00

VICVectT0	EQU	4
VICVectT1	EQU	5
VICVectEINT0	EQU	14


Irq_Stack_Size	EQU	0x80

Mode_USR        EQU     0x10
Mode_IRQ        EQU     0x12
I_Bit           EQU     0x80            ; when I bit is set, IRQ is disabled
F_Bit           EQU     0x40            ; when F bit is set, FIQ is disabled



	AREA	RESET, CODE, READONLY
	ENTRY

	; Exception Vectors

	B	Reset_Handler	; 0x00000000
	B	Undef_Handler	; 0x00000004
	B	SWI_Handler	; 0x00000008
	B	PAbt_Handler	; 0x0000000C
	B	DAbt_Handler	; 0x00000010
	NOP			; 0x00000014
	B	IRQ_Handler	; 0x00000018
	B	FIQ_Handler	; 0x0000001C

;
; Reset Exception Handler
;
Reset_Handler

	;
	; Initialize Stack Pointers (SP) for each mode we are using
	;

	; Stack Top
	LDR	R0, =0x40010000

	; Enter irq mode and set initial SP
	MSR     CPSR_c, #Mode_IRQ:OR:I_Bit:OR:F_Bit
	MOV     SP, R0
	SUB     R0, R0, #Irq_Stack_Size

	; Enter user mode and set initial SP
	MSR     CPSR_c, #Mode_USR
	MOV	SP, R0

	;
	; your initialisation goes here
	;
	
	;
	; Initialise variables stored in RAM
	;
	LDR	R4, =count
	LDR	R5, =0
	STR	R5, [R4]		; count = 0
	
	;
	; Configure TIMER0
	;

	; Stop and reset TIMER0 using Timer Control Register
	; Set bit 0 of TCR to 0 to stop TIMER
	; Set bit 1 of TCR to 1 to reset TIMER
	LDR	R5, =T0TCR
	LDR	R6, =0x2
	STRB	R6, [R5]

	; Clear any previous TIMER0 interrupt by writing 0xFF to the TIMER0
	; Interrupt Register (T0IR)
	LDR	R5, =T0IR
	LDR	R6, =0xFF
	STRB	R6, [R5]

	; Set match register for 10 secs using Match Register
	; Assuming a 1Mhz clock input to TIMER0, set MR
	; MR0 (0xE0004018) to 10,000,000
	LDR	R4, =T0MR0
	LDR	R5, =10000000
	STR	R5, [R4]

	; IRQ on match using Match Control Register
	

        LDR    	R4,=T0MCR 
	LDR   	R5,=0x01
	STRH    R5,[R4]

	;
	; Configure TIMER1
	;

	; Stop and reset TIMER0 using Timer Control Register
	; Set bit 0 of TCR to 0 to stop TIMER
	; Set bit 1 of TCR to 1 to reset TIMER
	LDR	R7, =T1TCR
	LDR	R6, =0x2
	STRB	R6, [R7]

	; Clear any previous TIMER0 interrupt by writing 0xFF to the TIMER0
	; Interrupt Register (T0IR)
	LDR	R8, =T1IR
	LDR	R6, =0xFF
	STRB	R6, [R8]

	; Set match register for 10 secs using Match Register
	; Assuming a 1Mhz clock input to TIMER0, set MR
	; MR0 (0xE0004018) to 10,000,000
	LDR	R7, =T1MR0
	LDR	R5, =10000000
	STR	R5, [R7]

	; IRQ on match using Match Control Register
	

	LDR    	R4,=T1MCR 
	LDR   	R5,=0x01
	STRH    R5,[R4]


	;
	; Configure P2.10 for EINT0
	;

	; Enable P2.10 for GPIO
	LDR	R4, =PINSEL4
	LDR	R9, [R4]		; read current value
	BIC	R9, #(0x03 << 20)	; clear bits 21:20
	ORR	R9, #(0x01 << 20)	; set bits 21:20 to 01
	STR	R9, [R4]		; write new value

	; Set edge-sensitive mode for EINT0
	LDR	R4, =EXTMODE
	LDR	R9, [R4]		; read
	ORR	R9, #1			; modify
	STRB	R9, [R4]		; write

	; Set rising-edge mode for EINT0
	LDR	R4, =EXTPOLAR
	LDR	R9, [R4]		; read
	BIC	R9, #1			; modify
	STRB	R9, [R4]		; write

	 ;Reset EINT0
	LDR	R4, =EXTINT
	MOV	R9, #1
	STRB	R9, [R4]
	
	
	


	;
	; Configure VIC for TIMER0 interrupts
	;

	; Useful VIC vector numbers and masks for following code
	LDR	R3, =VICVectT0		; vector 4
	LDR	R4, =(1 << VICVectT0) 	; bit mask for vector 4

	; VICIntSelect - Clear bit 4 of VICIntSelect register to cause
	; channel 4 (TIMER0) to raise IRQs (not FIQs)
	LDR	R5, =VICIntSelect	; addr = VICVectSelect;
	LDR	R6, [R5]		; tmp = Memory.Word(addr);
	BIC	R6, R6, R4		; Clear bit for Vector 0x04
	STR	R6, [R5]		; Memory.Word(addr) = tmp;

	; Set Priority for VIC channel 4 (TIMER0) to lowest (15) by setting
	; VICVectPri4 to 15. Note: VICVectPri4 is the element at index 4 of an
	; array of 4-byte values that starts at VICVectPri0.
	; i.e. VICVectPri4=VICVectPri0+(4*4)
	LDR	R5, =VICVectPri0	; addr = VICVectPri0;
	MOV	R6, #15			; pri = 15;
	STR	R6, [R5, R3, LSL #2]	; Memory.Word(addr + vector * 4) = pri;

	; Set Handler routine address for VIC channel 4 (TIMER0) to address of
	; our handler routine (TimerHandler). Note: VICVectAddr4 is the element
	; at index 4 of an array of 4-byte values that starts at VICVectAddr0.
	; i.e. VICVectAddr4=VICVectAddr0+(4*4)
	LDR	R5, =VICVectAddr0	; addr = VICVectAddr0;
	LDR	R6, =Timer_Handler	; handler = address of TimerHandler;
	STR	R6, [R5, R3, LSL #2]	; Memory.Word(addr + vector * 4) = handler

	; Enable VIC channel 4 (TIMER0) by writing a 1 to bit 4 of VICIntEnable
	LDR	R5, =VICIntEnable	; addr = VICIntEnable;
	STR	R4, [R5]		; enable interrupts for vector 0x4
	
	
	;
	; Configure VIC for TIMER1 interrupts
	;

	; Useful VIC vector numbers and masks for following code
	LDR	R3, =VICVectT1		; vector 5
	LDR	R4, =(1 << VICVectT1) 	; bit mask for vector 5

	; VICIntSelect - Clear bit 4 of VICIntSelect register to cause
	; channel 5 (TIMER1) to raise IRQs (not FIQs)
	LDR	R5, =VICIntSelect	; addr = VICVectSelect;
	LDR	R6, [R5]		; tmp = Memory.Word(addr);
	BIC	R6, R6, R4		; Clear bit for Vector 0x05
	STR	R6, [R5]		; Memory.Word(addr) = tmp;

	; Set Priority for VIC channel 4 (TIMER0) to lowest (15) by setting
	; VICVectPri4 to 15. Note: VICVectPri4 is the element at index 4 of an
	; array of 4-byte values that starts at VICVectPri0.
	; i.e. VICVectPri4=VICVectPri0+(4*4)
	LDR	R5, =VICVectPri0	; addr = VICVectPri0;
	MOV	R6, #15			; pri = 15;
	STR	R6, [R5, R3, LSL #2]	; Memory.Word(addr + vector * 4) = pri;

	; Set Handler routine address for VIC channel 4 (TIMER1) to address of
	; our handler routine (TimerHandler). Note: VICVectAddr4 is the element
	; at index 4 of an array of 4-byte values that starts at VICVectAddr0.
	; i.e. VICVectAddr4=VICVectAddr0+(4*4)
	LDR	R5, =VICVectAddr0	; addr = VICVectAddr0;
	LDR	R6, =Timer_Handler1	; handler = address of TimerHandler1;
	STR	R6, [R5, R3, LSL #2]	; Memory.Word(addr + vector * 4) = handler

	; Enable VIC channel 4 (TIMER0) by writing a 1 to bit 4 of VICIntEnable
	LDR	R5, =VICIntEnable	; addr = VICIntEnable;
	STR	R4, [R5]		; enable interrupts for vector 0x5
	
	
	;
	; Configure VIC for EINT0 interrupts
	;

	; Useful VIC vector numbers and masks for following code
	LDR	R4, =VICVectEINT0		; vector 14
	LDR	R5, =(1 << VICVectEINT0) 	; bit mask for vector 14

	; VICIntSelect - Clear bit 4 of VICIntSelect register to cause
	; channel 14 (EINT0) to raise IRQs (not FIQs)
	LDR	R6, =VICIntSelect	; addr = VICVectSelect;
	LDR	R7, [R6]		; tmp = Memory.Word(addr);
	BIC	R7, R7, R5		; Clear bit for Vector 14
	STR	R7, [R6]		; Memory.Word(addr) = tmp;

	; Set Priority for VIC channel 14 (EINT0) to lowest (15) by setting
	; VICVectPri4 to 15. Note: VICVectPri4 is the element at index 14 of an
	; array of 4-byte values that starts at VICVectPri0.
	; i.e. VICVectPri4=VICVectPri0+(4*4)
	LDR	R6, =VICVectPri0	; addr = VICVectPri0;
	MOV	R7, #15			; pri = 15;
	STR	R7, [R6, R4, LSL #2]	; Memory.Word(addr + vector * 4) = pri;

	; Set Handler routine address for VIC channel 4 (EINT0) to address of
	; our handler routine (TimerHandler). Note: VICVectAddr4 is the element
	; at index 4 of an array of 4-byte values that starts at VICVectAddr0.
	; i.e. VICVectAddr4=VICVectAddr0+(4*4)
	LDR	R6, =VICVectAddr0	; addr = VICVectAddr0;
	LDR	R7, =Button_Handler	; handler = address of ButtonHandler;
	STR	R7, [R6, R4, LSL #2]	; Memory.Word(addr + vector * 4) = handler

	; Enable VIC channel 14 (EINT0) by writing a 1 to bit 4 of VICIntEnable
	LDR	R6, =VICIntEnable	; addr = VICIntEnable;
	STR	R5, [R6]		; enable interrupts for vector 14
	
	; Start TIMER0 using the Timer Control Register
	; Set bit 0 of TCR (0xE0004004) to enable the timer
	LDR	R4, =T0TCR
	LDR	R5, =0x01
	STRB	R5, [R4]

	
	

stop	B	stop


;
; TOP LEVEL EXCEPTION HANDLERS
;

;
; Software Interrupt Exception Handler
;
Undef_Handler
	B	Undef_Handler

;
; Software Interrupt Exception Handler
;
SWI_Handler
	B	SWI_Handler

;
; Prefetch Abort Exception Handler
;
PAbt_Handler
	B	PAbt_Handler

;
; Data Abort Exception Handler
;
DAbt_Handler
	B	DAbt_Handler

;
; Interrupt ReQuest (IRQ) Exception Handler (top level - all devices)
;
IRQ_Handler
	SUB	lr, lr, #4	; for IRQs, LR is always 4 more than the
				; real return address
	STMFD	sp!, {r0-r3,lr}	; save r0-r3 and lr

	LDR	r0, =VICVectAddr; address of VIC Vector Address memory-
				; mapped register

	MOV	lr, pc		; can’t use BL here because we are branching
	LDR	pc, [r0]	; to a different subroutine dependant on device
				; raising the IRQ - this is a manual BL !!

	LDMFD	sp!, {r0-r3, pc}^ ; restore r0-r3, lr and CPSR

;
; Fast Interrupt reQuest Exception Handler
;
FIQ_Handler
	B	FIQ_Handler


;
; write your interrupt handlers here
;

Timer_Handler

	STMFD	sp!, {r4-r5, lr}

	; Reset TIMER0 interrupt by writing 0xFF to T0IR
	LDR	R4, =T0IR
	MOV	R5, #0xFF
	STRB	R5, [R4]

	;
	; take some action here when the timer expires!
	;
	;Set bit 2 of MCR of TIMER0 to 1 to stop the counter after match (20 secs)
	LDR	R4, =T0MCR
	LDR	R5, =0x04
	STRH	R5, [R4]
	
	;to stop the timer control register
	LDR	R7, =T0TCR
	LDR	R5, =0x00
	STRB	R5, [R7]
	
	;setting the pin to output so it won't allow user to press the 
	; Enable P2.10 for GPIO
	LDR	R4, =PINSEL4
	LDR	R9, [R4]		; read current value
	BIC	R9, #(0x03 << 20)	; clear bits 21:20
	STR	R9, [R4]		; write new value
	

	; Set P2.10 for output
	LDR	R5, =FIO2DIR1	; load address of FIO2DIR1
	NOP
	LDRB	R6, [R5]	; read current FIO2DIR1 value
	ORR	R6, #(0x1 << 2)	; modify bit 2 to 1 for output, leaving other bits unmodified
	STRB	R6, [R5]	; write new FIO2DIR1
	
	; read current P2.10 output value
	;   0 or 1 in bit 2 of FIO2PIN1
	LDR	R4, =0x04		;   setup bit mask for P2.10 bit in FIO2PIN1
	LDR	R5, =FIO2PIN1		;
	LDRB	R6, [R5]		;   read FIO2PIN1

	; modify P2.10 output (leaving other pin outputs controlled by
	;   FIO2PIN1 with their original value)
			;   {
	ORR	R6, R6, R4		;     set bit 2 (turn LED on)
				                                 ; write new FIO2PIN1 value
	STRB	R6, [R5]

	; Clear source of interrupt by writing 0 to VICVectAddr
	LDR	R4, =VICVectAddr
	MOV	R5, #0
	STR	R5, [R4]

	LDMFD	sp!, {r4-r5, pc}
	
Timer_Handler1

	STMFD	sp!, {r4-r5, lr}

	; Reset TIMER0 interrupt by writing 0xFF to T0IR
	LDR	R4, =T0IR
	MOV	R5, #0xFF
	STRB	R5, [R4]

	;
	; take some action here when the timer expires!
	;
	; Set bit 2 of MCR to 1 to stop the counter after match
	LDR	R7, =T1MCR
	LDR	R5, =0x04
	STRH	R5, [R7]
	
	LDR	R7, =T1TCR
	LDR	R5, =0x00
	STRB	R5, [R7]
	
	; setting so the pin won't be allowed to be pressed again  
	; Enable P2.10 for GPIO
	LDR	R4, =PINSEL4
	LDR	R9, [R4]		; read current value
	BIC	R9, #(0x03 << 20)	; clear bits 21:20
	STR	R9, [R4]		; write new value
	

	; Set P2.10 for output
	LDR	R5, =FIO2DIR1	; load address of FIO2DIR1
	NOP
	LDRB	R6, [R5]	; read current FIO2DIR1 value
	ORR	R6, #(0x1 << 2)	; modify bit 2 to 1 for output, leaving other bits unmodified
	STRB	R6, [R5]	; write new FIO2DIR1
	
	; read current P2.10 output value
	;   0 or 1 in bit 2 of FIO2PIN1
	LDR	R4, =0x04		;   setup bit mask for P2.10 bit in FIO2PIN1
	LDR	R5, =FIO2PIN1		;
	LDRB	R6, [R5]		;   read FIO2PIN1

	; modify P2.10 output (leaving other pin outputs controlled by
	;   FIO2PIN1 with their original value)
			;   {
	ORR	R6, R6, R4		;     set bit 2 (turn LED on)
				         ; write new FIO2PIN1 value
	STRB	R6, [R5]
	

	; Clear source of interrupt by writing 0 to VICVectAddr
	LDR	R4, =VICVectAddr
	MOV	R5, #0
	STR	R5, [R4]

	LDMFD	sp!, {r4-r5, pc}
Button_Handler

	STMFD	sp!, {r4-r7, lr}

	; Reset EINT0 interrupt by writing 1 to EXTINT register
	LDR	R4, =EXTINT
	MOV	R5, #1
	STRB	R5, [R4]
	; check for odd or even  
	LDR   R7,=0xFFFFFFFE
	
	LDR	R4, =count		; addr = count
	LDR	R5, [R4]		; tmp_count = Memory.Word(addr);
	;isolate last bit to see if is odd or even 
	BIC     R6,R5,R7
	CMP     R6,#1  
	BEQ     start_timer0
;if even number turn
start_timer1
	;stop TIMER0 and start TIMER1 
	LDR  	R5,=T0TCR
	LDR     R6,=0x00
	STRB    R6,[R5]
	
	
	LDR  	R5,=T1TCR
	LDR     R6,=0x01
	STRB    R6,[R5]
	B       do_rest
;if odd number turn	
start_timer0
        ;stop TIMER1 and start TIMER0
	LDR  	R5,=T1TCR
	LDR     R6,=0x00
	STRB    R6,[R5]
	
	
	LDR  	R5,=T0TCR
	LDR     R6,=0x01
	STRB    R6,[R5]
do_rest
    ; Increment Count
	;
	;
	; Clear source of interrupt
	;
	LDR     R4,=count
	LDR     R5,[R4]
	ADD	R5, R5, #1		; increment count;
	STR	R5, [R4]		; Memory.Word(addr) = tmp_count;
	LDR	R4, =VICVectAddr	; addr = VICVectAddr
	MOV	R5, #0			; tmp = 0;
	STR	R5, [R4]		; Memory.Word(addr) = tmp;

	LDMFD	sp!, {r4-r7, pc}


	AREA	TestData, DATA, READWRITE

count	SPACE	4

	END
