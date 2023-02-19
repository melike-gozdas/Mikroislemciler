
_main:

;PWM_HizKontrolu.c,2 :: 		void main()
;PWM_HizKontrolu.c,4 :: 		trisb.b0 = 1; //B0 duty_cycle deðerinin artýþý için
	BSF        TRISB+0, 0
;PWM_HizKontrolu.c,5 :: 		trisb.b1 = 1; //B1 duty_cycle deðerinin azalmasý için
	BSF        TRISB+0, 1
;PWM_HizKontrolu.c,6 :: 		trisc.b2 = 0; //C2 PWM çýkýþ olarak ayarlandý
	BCF        TRISC+0, 2
;PWM_HizKontrolu.c,7 :: 		PR2 = 124; // period register = 124, bize 500Hz Frequency vermesi için
	MOVLW      124
	MOVWF      PR2+0
;PWM_HizKontrolu.c,9 :: 		T2CKPS1_bit = 1;
	BSF        T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0)
;PWM_HizKontrolu.c,10 :: 		T2CKPS0_bit = 1;
	BSF        T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0)
;PWM_HizKontrolu.c,11 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set ediliyor
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_HizKontrolu.c,12 :: 		PWM1_Start(); // PWM1 baþlatýlýyorwhile(1)
	CALL       _PWM1_Start+0
;PWM_HizKontrolu.c,14 :: 		if(portb.b0 == 0) //
	BTFSC      PORTB+0, 0
	GOTO       L_main0
;PWM_HizKontrolu.c,16 :: 		duty_cycle++; // duty cycle artýr
	INCF       _duty_cycle+0, 1
;PWM_HizKontrolu.c,17 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi 1…..255
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_HizKontrolu.c,18 :: 		delay_ms(50); //bekleme
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main1:
	DECFSZ     R13+0, 1
	GOTO       L_main1
	DECFSZ     R12+0, 1
	GOTO       L_main1
	NOP
	NOP
;PWM_HizKontrolu.c,19 :: 		}
L_main0:
;PWM_HizKontrolu.c,20 :: 		if(portb.b1 == 0) //switch B1 basýlý ise
	BTFSC      PORTB+0, 1
	GOTO       L_main2
;PWM_HizKontrolu.c,22 :: 		duty_cycle--; // duty cycle azalt
	DECF       _duty_cycle+0, 1
;PWM_HizKontrolu.c,23 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;PWM_HizKontrolu.c,24 :: 		delay_ms(50); //bekleme
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;PWM_HizKontrolu.c,25 :: 		}
L_main2:
;PWM_HizKontrolu.c,27 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
