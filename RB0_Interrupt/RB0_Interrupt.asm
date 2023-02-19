
_interrup:

;RB0_Interrupt.c,1 :: 		void interrup()
;RB0_Interrupt.c,3 :: 		if(INTCON.INTF == 1)
	BTFSS      INTCON+0, 1
	GOTO       L_interrup0
;RB0_Interrupt.c,6 :: 		}
L_interrup0:
;RB0_Interrupt.c,7 :: 		}
L_end_interrup:
	RETURN
; end of _interrup

_main:

;RB0_Interrupt.c,9 :: 		void main() {
;RB0_Interrupt.c,11 :: 		OPTION_REG.INTEDG = 1 ;//1 ise Rising 0 ise Falling
	BSF        OPTION_REG+0, 6
;RB0_Interrupt.c,12 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;RB0_Interrupt.c,13 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;RB0_Interrupt.c,14 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;RB0_Interrupt.c,15 :: 		TRISB = 0;
	CLRF       TRISB+0
;RB0_Interrupt.c,16 :: 		PORTB = 0;
	CLRF       PORTB+0
;RB0_Interrupt.c,17 :: 		while(1)
L_main1:
;RB0_Interrupt.c,19 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;RB0_Interrupt.c,20 :: 		PORTB = 0;
	CLRF       PORTB+0
;RB0_Interrupt.c,21 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
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
;RB0_Interrupt.c,22 :: 		PORTB = 255;
	MOVLW      255
	MOVWF      PORTB+0
;RB0_Interrupt.c,23 :: 		}
	GOTO       L_main1
;RB0_Interrupt.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
