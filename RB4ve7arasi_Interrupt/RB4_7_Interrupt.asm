
_interrup:

;RB4_7_Interrupt.c,1 :: 		void interrup()
;RB4_7_Interrupt.c,3 :: 		if(INTCON.INTF == 1)
	BTFSS      INTCON+0, 1
	GOTO       L_interrup0
;RB4_7_Interrupt.c,5 :: 		INTCON.INTF = 1;
	BSF        INTCON+0, 1
;RB4_7_Interrupt.c,7 :: 		PORTD = 0;
	CLRF       PORTD+0
;RB4_7_Interrupt.c,8 :: 		}
L_interrup0:
;RB4_7_Interrupt.c,9 :: 		}
L_end_interrup:
	RETURN
; end of _interrup

_main:

;RB4_7_Interrupt.c,11 :: 		void main() {
;RB4_7_Interrupt.c,13 :: 		OPTION_REG.INTEDG = 1 ;//1 ise Rising 0 ise Falling
	BSF        OPTION_REG+0, 6
;RB4_7_Interrupt.c,14 :: 		INTCON.INTE = 1;
	BSF        INTCON+0, 4
;RB4_7_Interrupt.c,15 :: 		INTCON.GIE = 1;
	BSF        INTCON+0, 7
;RB4_7_Interrupt.c,16 :: 		INTCON.PEIE = 1;
	BSF        INTCON+0, 6
;RB4_7_Interrupt.c,18 :: 		TRISD = 0;
	CLRF       TRISD+0
;RB4_7_Interrupt.c,19 :: 		PORTD = 0;
	CLRF       PORTD+0
;RB4_7_Interrupt.c,20 :: 		while(1)
L_main1:
;RB4_7_Interrupt.c,23 :: 		delay_ms(1000);
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
;RB4_7_Interrupt.c,24 :: 		PORTD = 0;
	CLRF       PORTD+0
;RB4_7_Interrupt.c,25 :: 		delay_ms(1000);
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
;RB4_7_Interrupt.c,26 :: 		PORTD = 255;
	MOVLW      255
	MOVWF      PORTD+0
;RB4_7_Interrupt.c,27 :: 		}
	GOTO       L_main1
;RB4_7_Interrupt.c,29 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
