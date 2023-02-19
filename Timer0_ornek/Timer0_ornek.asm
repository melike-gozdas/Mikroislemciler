
_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Timer0_ornek.c,2 :: 		void Interrupt()    //TMR0IF = 1
;Timer0_ornek.c,4 :: 		if(INTCON.TMR0IF == 1)   //Time 0 kaydedicisi 255 deðerine vardýðý zaman
	BTFSS      INTCON+0, 2
	GOTO       L_Interrupt0
;Timer0_ornek.c,6 :: 		INTCON.TMR0IF = 0;  //reset timer0 Interrupt flag
	BCF        INTCON+0, 2
;Timer0_ornek.c,7 :: 		TMR0 = 99;
	MOVLW      99
	MOVWF      TMR0+0
;Timer0_ornek.c,8 :: 		PORTD = ~portd;
	COMF       PORTD+0, 1
;Timer0_ornek.c,9 :: 		}
L_Interrupt0:
;Timer0_ornek.c,10 :: 		}
L_end_Interrupt:
L__Interrupt6:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;Timer0_ornek.c,11 :: 		void main() {
;Timer0_ornek.c,12 :: 		OPTION_REG.T0CS = 0;
	BCF        OPTION_REG+0, 5
;Timer0_ornek.c,13 :: 		OPTION_REG.T0SE = 1; //default u 1
	BSF        OPTION_REG+0, 4
;Timer0_ornek.c,14 :: 		OPTION_REG.PSA = 0;
	BCF        OPTION_REG+0, 3
;Timer0_ornek.c,15 :: 		OPTION_REG.PS2 = 1;
	BSF        OPTION_REG+0, 2
;Timer0_ornek.c,16 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;Timer0_ornek.c,17 :: 		OPTION_REG.PS0 = 1;
	BSF        OPTION_REG+0, 0
;Timer0_ornek.c,18 :: 		TMR0 = 99; //99-----255   255 ise TMR0IF = 1
	MOVLW      99
	MOVWF      TMR0+0
;Timer0_ornek.c,19 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;Timer0_ornek.c,20 :: 		INTCON.PEIE = 0;
	BCF        INTCON+0, 6
;Timer0_ornek.c,21 :: 		INTCON.TMR0IE = 1;
	BSF        INTCON+0, 5
;Timer0_ornek.c,24 :: 		TRISB = 0;
	CLRF       TRISB+0
;Timer0_ornek.c,25 :: 		PORTB = 0;
	CLRF       PORTB+0
;Timer0_ornek.c,26 :: 		TRISD = 0;
	CLRF       TRISD+0
;Timer0_ornek.c,27 :: 		PORTD = 0;
	CLRF       PORTD+0
;Timer0_ornek.c,28 :: 		while(1)
L_main1:
;Timer0_ornek.c,31 :: 		PORTB = 0;
	CLRF       PORTB+0
;Timer0_ornek.c,32 :: 		DELAY_MS(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	DECFSZ     R11+0, 1
	GOTO       L_main3
	NOP
	NOP
;Timer0_ornek.c,33 :: 		PORTB = 1;
	MOVLW      1
	MOVWF      PORTB+0
;Timer0_ornek.c,34 :: 		DELAY_MS(1000);
	MOVLW      6
	MOVWF      R11+0
	MOVLW      19
	MOVWF      R12+0
	MOVLW      173
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	DECFSZ     R11+0, 1
	GOTO       L_main4
	NOP
	NOP
;Timer0_ornek.c,35 :: 		}
	GOTO       L_main1
;Timer0_ornek.c,36 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
