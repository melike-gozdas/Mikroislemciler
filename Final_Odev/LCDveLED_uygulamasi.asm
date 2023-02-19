
_main:

;LCDveLED_uygulamasi.c,22 :: 		void main()
;LCDveLED_uygulamasi.c,24 :: 		TRISA=0b00000001;  //AN0 giriþ olarak ayarlandý.
	MOVLW      1
	MOVWF      TRISA+0
;LCDveLED_uygulamasi.c,25 :: 		ADCON1=0b10001110;
	MOVLW      142
	MOVWF      ADCON1+0
;LCDveLED_uygulamasi.c,26 :: 		TRISB=0;   //PORTB decimal sistemde tamamen çýkýþ yapýldý.
	CLRF       TRISB+0
;LCDveLED_uygulamasi.c,27 :: 		PORTB=0;   //PORTB içeriði temizlendi
	CLRF       PORTB+0
;LCDveLED_uygulamasi.c,28 :: 		TRISC=0;   //PORTC decimal sistemde tamamen çýkýþ yapýldý.
	CLRF       TRISC+0
;LCDveLED_uygulamasi.c,29 :: 		PORTC=0;   //PORTC içeriði temizlendi
	CLRF       PORTC+0
;LCDveLED_uygulamasi.c,31 :: 		Lcd_init();
	CALL       _Lcd_Init+0
;LCDveLED_uygulamasi.c,32 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);  //Ýþaretçiyi kapatýr.
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDveLED_uygulamasi.c,33 :: 		Lcd_Cmd(_LCD_CLEAR);  //LCD ekranýný temizler
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDveLED_uygulamasi.c,34 :: 		Lcd_Out(1,1,"  BATARYA OLCER");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCDveLED_uygulamasi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDveLED_uygulamasi.c,35 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main0:
	DECFSZ     R13+0, 1
	GOTO       L_main0
	DECFSZ     R12+0, 1
	GOTO       L_main0
	DECFSZ     R11+0, 1
	GOTO       L_main0
	NOP
	NOP
;LCDveLED_uygulamasi.c,36 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDveLED_uygulamasi.c,37 :: 		while(1)
L_main1:
;LCDveLED_uygulamasi.c,39 :: 		veri=ADC_Read(0); //AN0 seçildi.
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _veri+0
	MOVF       R0+1, 0
	MOVWF      _veri+1
;LCDveLED_uygulamasi.c,40 :: 		voltaj=(veri * 5)/1023; //ham veri
	MOVLW      5
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	CALL       _Mul_16X16_U+0
	MOVLW      255
	MOVWF      R4+0
	MOVLW      3
	MOVWF      R4+1
	CALL       _Div_16x16_S+0
	CALL       _int2double+0
	MOVF       R0+0, 0
	MOVWF      _voltaj+0
	MOVF       R0+1, 0
	MOVWF      _voltaj+1
	MOVF       R0+2, 0
	MOVWF      _voltaj+2
	MOVF       R0+3, 0
	MOVWF      _voltaj+3
;LCDveLED_uygulamasi.c,49 :: 		doluluk=11 * voltaj;
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
	MOVWF      _doluluk+0
	MOVF       R0+1, 0
	MOVWF      _doluluk+1
	MOVF       R0+2, 0
	MOVWF      _doluluk+2
	MOVF       R0+3, 0
	MOVWF      _doluluk+3
;LCDveLED_uygulamasi.c,52 :: 		floattoStr(doluluk, txt);
	MOVF       R0+0, 0
	MOVWF      FARG_FloatToStr_fnum+0
	MOVF       R0+1, 0
	MOVWF      FARG_FloatToStr_fnum+1
	MOVF       R0+2, 0
	MOVWF      FARG_FloatToStr_fnum+2
	MOVF       R0+3, 0
	MOVWF      FARG_FloatToStr_fnum+3
	MOVLW      _txt+0
	MOVWF      FARG_FloatToStr_str+0
	CALL       _FloatToStr+0
;LCDveLED_uygulamasi.c,53 :: 		Lcd_Out(1,1," Batarya Voltajý");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr2_LCDveLED_uygulamasi+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDveLED_uygulamasi.c,54 :: 		Lcd_Out(2,5,txt);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      5
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCDveLED_uygulamasi.c,56 :: 		if(doluluk > 2.4)
	MOVF       _doluluk+0, 0
	MOVWF      R4+0
	MOVF       _doluluk+1, 0
	MOVWF      R4+1
	MOVF       _doluluk+2, 0
	MOVWF      R4+2
	MOVF       _doluluk+3, 0
	MOVWF      R4+3
	MOVLW      154
	MOVWF      R0+0
	MOVLW      153
	MOVWF      R0+1
	MOVLW      25
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main3
;LCDveLED_uygulamasi.c,58 :: 		PORTB.RB6=1;  //PORTB'nin 6. bitini 1 yaptýk.
	BSF        PORTB+0, 6
;LCDveLED_uygulamasi.c,59 :: 		PORTB.RB7=0;  //PORTB'nin 7. bitini 0 yaptýk.
	BCF        PORTB+0, 7
;LCDveLED_uygulamasi.c,60 :: 		PORTC.RC0=0;  //PORTC'nin 0. bitini 0 yaptýk.
	BCF        PORTC+0, 0
;LCDveLED_uygulamasi.c,61 :: 		}
	GOTO       L_main4
L_main3:
;LCDveLED_uygulamasi.c,62 :: 		else  if(1.2 <doluluk && doluluk<= 2.4)
	MOVF       _doluluk+0, 0
	MOVWF      R4+0
	MOVF       _doluluk+1, 0
	MOVWF      R4+1
	MOVF       _doluluk+2, 0
	MOVWF      R4+2
	MOVF       _doluluk+3, 0
	MOVWF      R4+3
	MOVLW      154
	MOVWF      R0+0
	MOVLW      153
	MOVWF      R0+1
	MOVLW      25
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
	MOVF       _doluluk+0, 0
	MOVWF      R4+0
	MOVF       _doluluk+1, 0
	MOVWF      R4+1
	MOVF       _doluluk+2, 0
	MOVWF      R4+2
	MOVF       _doluluk+3, 0
	MOVWF      R4+3
	MOVLW      154
	MOVWF      R0+0
	MOVLW      153
	MOVWF      R0+1
	MOVLW      25
	MOVWF      R0+2
	MOVLW      128
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main7
L__main11:
;LCDveLED_uygulamasi.c,64 :: 		PORTB.RB6=0;  //PORTB'nin 6. bitini 0 yaptýk.
	BCF        PORTB+0, 6
;LCDveLED_uygulamasi.c,65 :: 		PORTB.RB7=1;  //PORTB'nin 7. bitini 1 yaptýk.
	BSF        PORTB+0, 7
;LCDveLED_uygulamasi.c,66 :: 		PORTC.RC0=0;  //PORTC'nin 0. bitini 0 yaptýk.
	BCF        PORTC+0, 0
;LCDveLED_uygulamasi.c,67 :: 		}
	GOTO       L_main8
L_main7:
;LCDveLED_uygulamasi.c,68 :: 		else if(doluluk <= 1.2)
	MOVF       _doluluk+0, 0
	MOVWF      R4+0
	MOVF       _doluluk+1, 0
	MOVWF      R4+1
	MOVF       _doluluk+2, 0
	MOVWF      R4+2
	MOVF       _doluluk+3, 0
	MOVWF      R4+3
	MOVLW      154
	MOVWF      R0+0
	MOVLW      153
	MOVWF      R0+1
	MOVLW      25
	MOVWF      R0+2
	MOVLW      127
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSS      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main9
;LCDveLED_uygulamasi.c,70 :: 		PORTB.RB6=0;  //PORTB'nin 6. bitini 0 yaptýk.
	BCF        PORTB+0, 6
;LCDveLED_uygulamasi.c,71 :: 		PORTB.RB7=0;  //PORTB'nin 7. bitini 0 yaptýk.
	BCF        PORTB+0, 7
;LCDveLED_uygulamasi.c,72 :: 		PORTC.RC0=1;  //PORTC'nin 0. bitini 1 yaptýk.
	BSF        PORTC+0, 0
;LCDveLED_uygulamasi.c,73 :: 		}
L_main9:
L_main8:
L_main4:
;LCDveLED_uygulamasi.c,74 :: 		delay_ms(1000);
	MOVLW      11
	MOVWF      R11+0
	MOVLW      38
	MOVWF      R12+0
	MOVLW      93
	MOVWF      R13+0
L_main10:
	DECFSZ     R13+0, 1
	GOTO       L_main10
	DECFSZ     R12+0, 1
	GOTO       L_main10
	DECFSZ     R11+0, 1
	GOTO       L_main10
	NOP
	NOP
;LCDveLED_uygulamasi.c,75 :: 		Lcd_Cmd(_LCD_CLEAR);
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCDveLED_uygulamasi.c,77 :: 		}
	GOTO       L_main1
;LCDveLED_uygulamasi.c,78 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
