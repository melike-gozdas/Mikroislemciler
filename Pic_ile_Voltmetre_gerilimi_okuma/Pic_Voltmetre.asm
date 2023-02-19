
_main:

;Pic_Voltmetre.c,18 :: 		void main() {
;Pic_Voltmetre.c,19 :: 		TRISB=0x00;
	CLRF       TRISB+0
;Pic_Voltmetre.c,20 :: 		TRISA=0xFF;
	MOVLW      255
	MOVWF      TRISA+0
;Pic_Voltmetre.c,21 :: 		adcon0=0b10010000; // kanal2(AN2)seçildi.
	MOVLW      144
	MOVWF      ADCON0+0
;Pic_Voltmetre.c,22 :: 		adcon1=0b10000010; // 5 analog,3 dijital uç olacak þekilde ayarlandý
	MOVLW      130
	MOVWF      ADCON1+0
;Pic_Voltmetre.c,23 :: 		Lcd_Init();
	CALL       _Lcd_Init+0
;Pic_Voltmetre.c,24 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Pic_Voltmetre.c,25 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Pic_Voltmetre.c,26 :: 		Lcd_Out(1,1,"BILGISAYAR");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_Pic_Voltmetre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic_Voltmetre.c,27 :: 		Lcd_Out(2,2,"MUHENDISLIGI");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_Pic_Voltmetre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic_Voltmetre.c,28 :: 		delay_ms(4000);
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
;Pic_Voltmetre.c,29 :: 		LCD_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Pic_Voltmetre.c,30 :: 		while(1)
L_main1:
;Pic_Voltmetre.c,32 :: 		gelenveri=ADC_Read(1); //Kanal 2 seçildiðinde ADC_Read(2) olur. kanal 1'de ADC_Read(1) olurdu
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _gelenveri+0
	MOVF       R0+1, 0
	MOVWF      _gelenveri+1
	CLRF       _gelenveri+2
	CLRF       _gelenveri+3
;Pic_Voltmetre.c,33 :: 		voltaj=(0.004887586*gelenveri);
	MOVF       _gelenveri+0, 0
	MOVWF      R0+0
	MOVF       _gelenveri+1, 0
	MOVWF      R0+1
	MOVF       _gelenveri+2, 0
	MOVWF      R0+2
	MOVF       _gelenveri+3, 0
	MOVWF      R0+3
	CALL       _longint2double+0
	MOVLW      11
	MOVWF      R4+0
	MOVLW      40
	MOVWF      R4+1
	MOVLW      32
	MOVWF      R4+2
	MOVLW      119
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _voltaj+0
	MOVF       R0+1, 0
	MOVWF      _voltaj+1
	MOVF       R0+2, 0
	MOVWF      _voltaj+2
	MOVF       R0+3, 0
	MOVWF      _voltaj+3
;Pic_Voltmetre.c,34 :: 		gerilim=11*voltaj;
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      48
	MOVWF      R4+2
	MOVLW      130
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      _gerilim+0
	MOVF       R0+1, 0
	MOVWF      _gerilim+1
	MOVF       R0+2, 0
	MOVWF      _gerilim+2
	MOVF       R0+3, 0
	MOVWF      _gerilim+3
;Pic_Voltmetre.c,35 :: 		floattoStr(gerilim,sondeger);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _sondeger+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;Pic_Voltmetre.c,36 :: 		Lcd_Out(1,1,sondeger);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _sondeger+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic_Voltmetre.c,37 :: 		Lcd_Out(2,2," Pilin Voltaji");
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      2
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr3_Pic_Voltmetre+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Pic_Voltmetre.c,38 :: 		delay_ms(500);
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
;Pic_Voltmetre.c,39 :: 		}
	GOTO       L_main1
;Pic_Voltmetre.c,40 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
