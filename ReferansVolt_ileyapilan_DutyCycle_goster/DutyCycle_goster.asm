
_get_adc_set_duty_cycle:

;DutyCycle_goster.c,19 :: 		void get_adc_set_duty_cycle()
;DutyCycle_goster.c,21 :: 		adc_value = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_value+0
	MOVF       R0+1, 0
	MOVWF      _adc_value+1
;DutyCycle_goster.c,23 :: 		TempC = adc_value * 1.5;
	CALL       _word2double+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      64
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _TempC+0
	MOVF       R0+1, 0
	MOVWF      _TempC+1
	MOVF       R0+2, 0
	MOVWF      _TempC+2
	MOVF       R0+3, 0
	MOVWF      _TempC+3
;DutyCycle_goster.c,24 :: 		TempC = TempC / 1024;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      137
	MOVWF      R4+3
	CALL       _Div_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _TempC+0
	MOVF       R0+1, 0
	MOVWF      _TempC+1
	MOVF       R0+2, 0
	MOVWF      _TempC+2
	MOVF       R0+3, 0
	MOVWF      _TempC+3
;DutyCycle_goster.c,25 :: 		TempC = TempC * 100;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      72
	MOVWF      R4+2
	MOVLW      133
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      FLOC__get_adc_set_duty_cycle+0
	MOVF       R0+1, 0
	MOVWF      FLOC__get_adc_set_duty_cycle+1
	MOVF       R0+2, 0
	MOVWF      FLOC__get_adc_set_duty_cycle+2
	MOVF       R0+3, 0
	MOVWF      FLOC__get_adc_set_duty_cycle+3
	MOVF       FLOC__get_adc_set_duty_cycle+0, 0
	MOVWF      _TempC+0
	MOVF       FLOC__get_adc_set_duty_cycle+1, 0
	MOVWF      _TempC+1
	MOVF       FLOC__get_adc_set_duty_cycle+2, 0
	MOVWF      _TempC+2
	MOVF       FLOC__get_adc_set_duty_cycle+3, 0
	MOVWF      _TempC+3
;DutyCycle_goster.c,26 :: 		duty_cycle = TempC * 1.7;
	MOVF       FLOC__get_adc_set_duty_cycle+0, 0
	MOVWF      R0+0
	MOVF       FLOC__get_adc_set_duty_cycle+1, 0
	MOVWF      R0+1
	MOVF       FLOC__get_adc_set_duty_cycle+2, 0
	MOVWF      R0+2
	MOVF       FLOC__get_adc_set_duty_cycle+3, 0
	MOVWF      R0+3
	MOVLW      154
	MOVWF      R4+0
	MOVLW      153
	MOVWF      R4+1
	MOVLW      89
	MOVWF      R4+2
	MOVLW      127
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	CALL       _double2byte+0
	MOVF       R0+0, 0
	MOVWF      _duty_cycle+0
;DutyCycle_goster.c,27 :: 		floattostr(TempC,TempC_text);
	MOVF       FLOC__get_adc_set_duty_cycle+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       FLOC__get_adc_set_duty_cycle+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       FLOC__get_adc_set_duty_cycle+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       FLOC__get_adc_set_duty_cycle+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _TempC_text+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;DutyCycle_goster.c,28 :: 		bytetostr(duty_cycle,duty_cycle_txt);
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_ByteToStr_input+0
	MOVLW      _duty_cycle_txt+0
	MOVWF      FARG_ByteToStr_output+0
	CALL       _ByteToStr+0
;DutyCycle_goster.c,29 :: 		Lcd_Out(1,1,TempC_text); Lcd_chr_cp('C');
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _TempC_text+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      67
	MOVWF      FARG_Lcd_Chr_CP_out_char+0
	CALL       _Lcd_Chr_CP+0
;DutyCycle_goster.c,30 :: 		Lcd_Out(2,1,"Duty Cycle: "); Lcd_Out(2,13,duty_cycle_txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_DutyCycle_goster+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      13
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _duty_cycle_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;DutyCycle_goster.c,31 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DutyCycle_goster.c,32 :: 		delay_ms(100);
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
;DutyCycle_goster.c,33 :: 		}
L_end_get_adc_set_duty_cycle:
	RETURN
; end of _get_adc_set_duty_cycle

_main:

;DutyCycle_goster.c,34 :: 		void main()
;DutyCycle_goster.c,36 :: 		ADC_Init();
	CALL       _ADC_Init+0
;DutyCycle_goster.c,37 :: 		ADCON1 = 0b00000101;
	MOVLW      5
	MOVWF      ADCON1+0
;DutyCycle_goster.c,38 :: 		TRISA.B0 = 1;
	BSF        TRISA+0, 0
;DutyCycle_goster.c,39 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;DutyCycle_goster.c,40 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DutyCycle_goster.c,41 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;DutyCycle_goster.c,43 :: 		trisc.b2 = 0; //C2 PWM
	BCF        TRISC+0, 2
;DutyCycle_goster.c,44 :: 		PR2 = 124;
	MOVLW      124
	MOVWF      PR2+0
;DutyCycle_goster.c,46 :: 		T2CKPS1_bit = 1;
	BSF        T2CKPS1_bit+0, BitPos(T2CKPS1_bit+0)
;DutyCycle_goster.c,47 :: 		T2CKPS0_bit = 1;
	BSF        T2CKPS0_bit+0, BitPos(T2CKPS0_bit+0)
;DutyCycle_goster.c,48 :: 		PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
	MOVF       _duty_cycle+0, 0
	MOVWF      FARG_PWM1_Set_Duty_new_duty+0
	CALL       _PWM1_Set_Duty+0
;DutyCycle_goster.c,49 :: 		PWM1_Start(); // PWM1 baþlat
	CALL       _PWM1_Start+0
;DutyCycle_goster.c,50 :: 		while(1)
L_main1:
;DutyCycle_goster.c,52 :: 		get_adc_set_duty_cycle();
	CALL       _get_adc_set_duty_cycle+0
;DutyCycle_goster.c,53 :: 		}
	GOTO       L_main1
;DutyCycle_goster.c,54 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
