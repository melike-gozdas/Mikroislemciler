
_init_interrupt:

;Interrupt_ornek.c,3 :: 		void init_interrupt()
;Interrupt_ornek.c,5 :: 		option_reg.intedg=0; //select Interrupt on falling edge of INT0 pin
	BCF        OPTION_REG+0, 6
;Interrupt_ornek.c,6 :: 		intcon.inte=1; //enable port INT0 external interrupt
	BSF        INTCON+0, 4
;Interrupt_ornek.c,7 :: 		intcon.PEIE=1; //Enables all unmasked peripheral interrupts
	BSF        INTCON+0, 6
;Interrupt_ornek.c,8 :: 		intcon.gie=1; //enable global interrupts
	BSF        INTCON+0, 7
;Interrupt_ornek.c,9 :: 		}
L_end_init_interrupt:
	RETURN
; end of _init_interrupt

_interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;Interrupt_ornek.c,11 :: 		void interrupt()
;Interrupt_ornek.c,13 :: 		if(intcon.intf==1) //if INT0 interrupt occured
	BTFSS      INTCON+0, 1
	GOTO       L_interrupt0
;Interrupt_ornek.c,15 :: 		portd.b0 = ~portd.b0; //toggle pin D0
	MOVLW      1
	XORWF      PORTD+0, 1
;Interrupt_ornek.c,16 :: 		for(i = 0; i < 100; i++)
	CLRF       _i+0
	CLRF       _i+1
L_interrupt1:
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__interrupt11
	MOVLW      100
	SUBWF      _i+0, 0
L__interrupt11:
	BTFSC      STATUS+0, 0
	GOTO       L_interrupt2
;Interrupt_ornek.c,18 :: 		porte = i;
	MOVF       _i+0, 0
	MOVWF      PORTE+0
;Interrupt_ornek.c,19 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
	MOVWF      R13+0
L_interrupt4:
	DECFSZ     R13+0, 1
	GOTO       L_interrupt4
	DECFSZ     R12+0, 1
	GOTO       L_interrupt4
	DECFSZ     R11+0, 1
	GOTO       L_interrupt4
	NOP
	NOP
;Interrupt_ornek.c,16 :: 		for(i = 0; i < 100; i++)
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;Interrupt_ornek.c,20 :: 		}
	GOTO       L_interrupt1
L_interrupt2:
;Interrupt_ornek.c,21 :: 		intcon.intf=0; //reset INT0 flag mutlka sýfýrlamalýyýz
	BCF        INTCON+0, 1
;Interrupt_ornek.c,22 :: 		}
L_interrupt0:
;Interrupt_ornek.c,23 :: 		}
L_end_interrupt:
L__interrupt10:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _interrupt

_main:

;Interrupt_ornek.c,24 :: 		void main()
;Interrupt_ornek.c,26 :: 		init_interrupt(); //iterrupt initiallisation
	CALL       _init_interrupt+0
;Interrupt_ornek.c,27 :: 		trisb.b0=1; //INT0 pin as input
	BSF        TRISB+0, 0
;Interrupt_ornek.c,28 :: 		trisd = 0; portd = 0; // D port as output
	CLRF       TRISD+0
	CLRF       PORTD+0
;Interrupt_ornek.c,29 :: 		trise = 0; porte = 0; // E port as output for(i = 0; i < 100; i++)
	CLRF       TRISE+0
	CLRF       PORTE+0
;Interrupt_ornek.c,31 :: 		portd = i;
	MOVF       _i+0, 0
	MOVWF      PORTD+0
;Interrupt_ornek.c,32 :: 		delay_ms(300);
	MOVLW      4
	MOVWF      R11+0
	MOVLW      12
	MOVWF      R12+0
	MOVLW      51
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
;Interrupt_ornek.c,34 :: 		while(1)
L_main6:
;Interrupt_ornek.c,36 :: 		asm sleep;
	SLEEP
;Interrupt_ornek.c,37 :: 		}
	GOTO       L_main6
;Interrupt_ornek.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
