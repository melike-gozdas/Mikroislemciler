
_main:

;Deg_For_While_if.c,3 :: 		void main() {
;Deg_For_While_if.c,4 :: 		TRISB = 0;
	CLRF       TRISB+0
;Deg_For_While_if.c,5 :: 		PORTB = 0;
	CLRF       PORTB+0
;Deg_For_While_if.c,6 :: 		TRISD.B6 = 1;
	BSF        TRISD+0, 6
;Deg_For_While_if.c,7 :: 		TRISD.B7 = 1;
	BSF        TRISD+0, 7
;Deg_For_While_if.c,8 :: 		while(1)
L_main0:
;Deg_For_While_if.c,10 :: 		for(i=0; i<10; i++)
	CLRF       _i+0
	CLRF       _i+1
L_main2:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main8
	MOVLW      10
	SUBWF      _i+0, 0
L__main8:
	BTFSC      STATUS+0, 0
	GOTO       L_main3
;Deg_For_While_if.c,12 :: 		PORTB = 1;    //belirli bir register ýn deðerini deðiþtirir.
	MOVLW      1
	MOVWF      PORTB+0
;Deg_For_While_if.c,13 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	DECFSZ     R11+0, 1
	GOTO       L_main5
	NOP
	NOP
;Deg_For_While_if.c,14 :: 		if(PORTD.B7 == 0)
	BTFSC      PORTD+0, 7
	GOTO       L_main6
;Deg_For_While_if.c,16 :: 		PORTD = 0;
	CLRF       PORTD+0
;Deg_For_While_if.c,17 :: 		}
L_main6:
;Deg_For_While_if.c,10 :: 		for(i=0; i<10; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Deg_For_While_if.c,18 :: 		}
	GOTO       L_main2
L_main3:
;Deg_For_While_if.c,19 :: 		}
	GOTO       L_main0
;Deg_For_While_if.c,21 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
