
_main:

;ADC_Potansiyometre.c,20 :: 		void main() {
;ADC_Potansiyometre.c,21 :: 		ADC_init();
	CALL       _ADC_Init+0
;ADC_Potansiyometre.c,22 :: 		adcon1=0b00001110; // A portu'nun 0. pini analog olarak ayarlandý
	MOVLW      14
	MOVWF      ADCON1+0
;ADC_Potansiyometre.c,23 :: 		TRISA.B0 = 1;
	BSF        TRISA+0, 0
;ADC_Potansiyometre.c,24 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;ADC_Potansiyometre.c,25 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_Potansiyometre.c,26 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_Potansiyometre.c,27 :: 		Lcd_Out(1,1,"BILGISAYAR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_ADC_Potansiyometre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_Potansiyometre.c,28 :: 		Lcd_Out(2,2,"MUHENDISLIGI");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_ADC_Potansiyometre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_Potansiyometre.c,29 :: 		delay_ms(4000);
	MOVLW      41
	MOVWF      R11+0
	MOVLW      150
	MOVWF      R12+0
	MOVLW      127
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
;ADC_Potansiyometre.c,30 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;ADC_Potansiyometre.c,31 :: 		while(1){
L_main1:
;ADC_Potansiyometre.c,32 :: 		adc_deger=ADC_Read(0); // A portu'nun 0. pininden gelen deðeri bir deðiþkene atýyoruz
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _adc_deger+0
	MOVF       R0+1, 0
	MOVWF      _adc_deger+1
;ADC_Potansiyometre.c,33 :: 		wordtoStr(adc_deger,adc_deger_txt);
	MOVF       R0+0, 0
	MOVWF      FARG_WordToStr_input+0
	MOVF       R0+1, 0
	MOVWF      FARG_WordToStr_input+1
	MOVLW      _adc_deger_txt+0
	MOVWF      FARG_WordToStr_output+0
	CALL       _WordToStr+0
;ADC_Potansiyometre.c,34 :: 		Lcd_Out(1,1,adc_deger_txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _adc_deger_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_Potansiyometre.c,35 :: 		Lcd_Out(2,2," Gelen Deger");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_ADC_Potansiyometre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;ADC_Potansiyometre.c,36 :: 		delay_ms(500);
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
;ADC_Potansiyometre.c,37 :: 		}
	GOTO       L_main1
;ADC_Potansiyometre.c,38 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
