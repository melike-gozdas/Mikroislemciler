
_get_adc_set_duty_cycle:

;ADCvalue_DutyCycle_goster.c,17 :: 		void get_adc_set_duty_cycle()
;ADCvalue_DutyCycle_goster.c,19 :: 		adc_value = ADC_Read(0); // AN0 analog deðeri oku
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value+0
	MOVF       R0+1, 0
	MOVWF      _adc_value+1
;ADCvalue_DutyCycle_goster.c,20 :: 		duty_cycle = adc_value / 4;
	MOVF       R0+0, 0
	MOVWF      R2+0
	MOVF       R0+1, 0
	MOVWF      R2+1
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	RRF        R2+1, 1
	RRF        R2+0, 1
	BCF        R2+1, 7
	MOVF       R2+0, 0
	MOVWF      _duty_cycle+0
;ADCvalue_DutyCycle_goster.c,21 :: 		wordtostr(adc_value,adc_value_txt);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _adc_value_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;ADCvalue_DutyCycle_goster.c,22 :: 		bytetostr(duty_cycle,duty_cycle_txt);
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _duty_cycle_txt+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;ADCvalue_DutyCycle_goster.c,23 :: 		Lcd_Out(1,1,"ADC VALUE: "); Lcd_Out(1,12,adc_value_txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADCvalue_DutyCycle_goster+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      12
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _adc_value_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADCvalue_DutyCycle_goster.c,24 :: 		Lcd_Out(2,1,"Duty Cycle: "); Lcd_Out(2,13,duty_cycle_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ADCvalue_DutyCycle_goster+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _duty_cycle_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADCvalue_DutyCycle_goster.c,25 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ADCvalue_DutyCycle_goster.c,26 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_get_adc_set_duty_cycle0:
	DECFSZ     R13+0, 1
	GOTO       L_get_adc_set_duty_cycle0
	DECFSZ     R12+0, 1
	GOTO       L_get_adc_set_duty_cycle0
	DECFSZ     R11+0, 1
	GOTO       L_get_adc_set_duty_cycle0
	NOP
;ADCvalue_DutyCycle_goster.c,27 :: 		}
L_end_get_adc_set_duty_cycle:
	RETURN
; end of _get_adc_set_duty_cycle

_main:

;ADCvalue_DutyCycle_goster.c,28 :: 		void main()
;ADCvalue_DutyCycle_goster.c,30 :: 		ADC_Init();
	CALL       _ADC_Init+0
;ADCvalue_DutyCycle_goster.c,31 :: 		ADCON1 = 0b00001110; TRISA.B0 = 1;
	MOVLW      14
	MOVWF      ADCON1+0
	BSF        TRISA+0, 0
;ADCvalue_DutyCycle_goster.c,32 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ADCvalue_DutyCycle_goster.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADCvalue_DutyCycle_goster.c,34 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADCvalue_DutyCycle_goster.c,36 :: 		trisc.b2 = 0; //C2 PWM
	BCF        TRISC+0, 2
;ADCvalue_DutyCycle_goster.c,37 :: 		PR2 = 124; //load period register with 124 to get 500Hz Frequency
	MOVLW      124
	MOVWF      PR2+0
;ADCvalue_DutyCycle_goster.c,39 :: 		T2CKPS1_bit = 1;
	BSF        T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0)
;ADCvalue_DutyCycle_goster.c,40 :: 		T2CKPS0_bit = 1;
	BSF        T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0)
;ADCvalue_DutyCycle_goster.c,41 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;ADCvalue_DutyCycle_goster.c,42 :: 		PWM1_Start(); // PWM1 baþlatýldý
	CALL       _PWM1_Start+0
;ADCvalue_DutyCycle_goster.c,43 :: 		while(1)
L_main1:
;ADCvalue_DutyCycle_goster.c,45 :: 		get_adc_set_duty_cycle();
	CALL       _get_adc_set_duty_cycle+0
;ADCvalue_DutyCycle_goster.c,46 :: 		}
	GOTO       L_main1
;ADCvalue_DutyCycle_goster.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
