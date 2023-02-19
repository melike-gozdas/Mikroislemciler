
_InitTimer0:

;Zamanlayici_ile_LED_yakma.c,17 :: 		void InitTimer0()
;Zamanlayici_ile_LED_yakma.c,20 :: 		OPTION_REG.T0CS = 0; //Harici instruction cycle clock (CLKOUT)
	BCF        OPTION_REG+0, 5
;Zamanlayici_ile_LED_yakma.c,21 :: 		OPTION_REG.PSA = 0; //Prescaler Timer0 module için kullanýlýr
	BCF        OPTION_REG+0, 3
;Zamanlayici_ile_LED_yakma.c,23 :: 		OPTION_REG.PS2 = 1;
	BSF        OPTION_REG+0, 2
;Zamanlayici_ile_LED_yakma.c,24 :: 		OPTION_REG.PS1 = 0;
	BCF        OPTION_REG+0, 1
;Zamanlayici_ile_LED_yakma.c,25 :: 		OPTION_REG.PS0 = 1;
	BSF        OPTION_REG+0, 0
;Zamanlayici_ile_LED_yakma.c,26 :: 		TMR0 = 99; //Timer0 baþlangýç deðer
	MOVLW      99
	MOVWF      TMR0+0
;Zamanlayici_ile_LED_yakma.c,28 :: 		INTCON.TMR0IE = 1; //1 = Enables the TMR0 Interrupt
	BSF        INTCON+0, 5
;Zamanlayici_ile_LED_yakma.c,29 :: 		INTCON.PEIE=1; //Enables all unmasked peripheral interrupts
	BSF        INTCON+0, 6
;Zamanlayici_ile_LED_yakma.c,30 :: 		INTCON.GIE = 1; //1 = Enables all interrupts
	BSF        INTCON+0, 7
;Zamanlayici_ile_LED_yakma.c,31 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Zamanlayici_ile_LED_yakma.c,33 :: 		void Interrupt()
;Zamanlayici_ile_LED_yakma.c,35 :: 		if(INTCON.TMR0IF == 1) //Time 0 kaydedicisi 255 deðerine vardýðý zaman
	BTFSS      INTCON+0, 2
	GOTO       L_Interrupt0
;Zamanlayici_ile_LED_yakma.c,37 :: 		INTCON.TMR0IF = 0; //reset timer0 interrupt flag
	BCF        INTCON+0, 2
;Zamanlayici_ile_LED_yakma.c,38 :: 		TMR0 = 99; //Timer0 tekrar 99 deðeri ile beslenmesi gerekmektedir
	MOVLW      99
	MOVWF      TMR0+0
;Zamanlayici_ile_LED_yakma.c,40 :: 		portb.b0 = ~portb.b0; // led
	MOVLW      1
	XORWF      PORTB+0, 1
;Zamanlayici_ile_LED_yakma.c,42 :: 		counter++; // 1 second
	INCF       _counter+0, 1
;Zamanlayici_ile_LED_yakma.c,43 :: 		counter2++; // 2 seconds
	INCF       _counter2+0, 1
;Zamanlayici_ile_LED_yakma.c,44 :: 		if(counter == 100)
	MOVF       _counter+0, 0
	XORLW      100
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt1
;Zamanlayici_ile_LED_yakma.c,46 :: 		counter=0;
	CLRF       _counter+0
;Zamanlayici_ile_LED_yakma.c,47 :: 		portb.b0 = ~portb.b0; // led
	MOVLW      1
	XORWF      PORTB+0, 1
;Zamanlayici_ile_LED_yakma.c,48 :: 		}
L_Interrupt1:
;Zamanlayici_ile_LED_yakma.c,49 :: 		if(counter2 == 200) // 2 saniye için
	MOVF       _counter2+0, 0
	XORLW      200
	BTFSS      STATUS+0, 2
	GOTO       L_Interrupt2
;Zamanlayici_ile_LED_yakma.c,51 :: 		counter2=0;
	CLRF       _counter2+0
;Zamanlayici_ile_LED_yakma.c,52 :: 		portb.b1 = ~portb.b1; // led
	MOVLW      2
	XORWF      PORTB+0, 1
;Zamanlayici_ile_LED_yakma.c,53 :: 		}// Ek
L_Interrupt2:
;Zamanlayici_ile_LED_yakma.c,54 :: 		}
L_Interrupt0:
;Zamanlayici_ile_LED_yakma.c,55 :: 		}
L_end_Interrupt:
L__Interrupt9:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

_main:

;Zamanlayici_ile_LED_yakma.c,56 :: 		void main()
;Zamanlayici_ile_LED_yakma.c,58 :: 		int i=0;
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
;Zamanlayici_ile_LED_yakma.c,59 :: 		InitTimer0(); //Timer 0 baþlatýlýyor
	CALL       _InitTimer0+0
;Zamanlayici_ile_LED_yakma.c,61 :: 		trisb.b0 = 0;
	BCF        TRISB+0, 0
;Zamanlayici_ile_LED_yakma.c,62 :: 		portb.b0 = 0;
	BCF        PORTB+0, 0
;Zamanlayici_ile_LED_yakma.c,63 :: 		trisb.b1 = 0;
	BCF        TRISB+0, 1
;Zamanlayici_ile_LED_yakma.c,64 :: 		portb.b1 = 0;
	BCF        PORTB+0, 1
;Zamanlayici_ile_LED_yakma.c,65 :: 		TRISD = 0;
	CLRF       TRISD+0
;Zamanlayici_ile_LED_yakma.c,66 :: 		PORTD = 0;
	CLRF       PORTD+0
;Zamanlayici_ile_LED_yakma.c,67 :: 		for(i = 0; i < 1000; i++)
	CLRF       main_i_L0+0
	CLRF       main_i_L0+1
L_main3:
	MOVLW      128
	XORWF      main_i_L0+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORLW      3
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__main11
	MOVLW      232
	SUBWF      main_i_L0+0, 0
L__main11:
	BTFSC      STATUS+0, 0
	GOTO       L_main4
;Zamanlayici_ile_LED_yakma.c,69 :: 		PORTD = i;
	MOVF       main_i_L0+0, 0
	MOVWF      PORTD+0
;Zamanlayici_ile_LED_yakma.c,70 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main6:
	DECFSZ     R13+0, 1
	GOTO       L_main6
	DECFSZ     R12+0, 1
	GOTO       L_main6
	DECFSZ     R11+0, 1
	GOTO       L_main6
	NOP
	NOP
;Zamanlayici_ile_LED_yakma.c,67 :: 		for(i = 0; i < 1000; i++)
	INCF       main_i_L0+0, 1
	BTFSC      STATUS+0, 2
	INCF       main_i_L0+1, 1
;Zamanlayici_ile_LED_yakma.c,71 :: 		}
	GOTO       L_main3
L_main4:
;Zamanlayici_ile_LED_yakma.c,72 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
