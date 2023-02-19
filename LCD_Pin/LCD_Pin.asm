
_main:

;LCD_Pin.c,19 :: 		void main() {
;LCD_Pin.c,20 :: 		TRISC.B0 = 1;    //çýkýþ
	BSF        TRISC+0, 0
;LCD_Pin.c,21 :: 		PORTC.b0 = 0;    //sýfýrladý
	BCF        PORTC+0, 0
;LCD_Pin.c,22 :: 		TRISC.B1 = 1;    //çýkýþ
	BSF        TRISC+0, 1
;LCD_Pin.c,23 :: 		PORTC.b1 = 0;    //sýfýrladý
	BCF        PORTC+0, 1
;LCD_Pin.c,24 :: 		LCD_Init();
	CALL       _Lcd_Init+0
;LCD_Pin.c,25 :: 		IntToStr(sayi, sayi_txt);
	MOVF       _sayi+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _sayi+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVLW      _sayi_txt+0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;LCD_Pin.c,26 :: 		delay_ms(1000);  //1sn;
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
;LCD_Pin.c,28 :: 		LCD_Cmd(_LCD_CLEAR);  //adresini biliyorum.
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD_Pin.c,29 :: 		while(1)
L_main1:
;LCD_Pin.c,31 :: 		delay_ms(1000);
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
;LCD_Pin.c,32 :: 		if(PORTC.b0 = 1)
	BSF        PORTC+0, 0
	BTFSS      PORTC+0, 0
	GOTO       L_main4
;LCD_Pin.c,34 :: 		LCD_Out(1, 3, sayi_txt);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      _sayi_txt+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Pin.c,35 :: 		}
L_main4:
;LCD_Pin.c,36 :: 		delay_ms(1000);
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
;LCD_Pin.c,37 :: 		if(PORTC.b1 = 1)
	BSF        PORTC+0, 1
	BTFSS      PORTC+0, 1
	GOTO       L_main6
;LCD_Pin.c,41 :: 		goto F2;   //sonsuz döngüden çýkmak için goto yu tercih etmek daha avantajlý çünkü istenidiðin konuma gidebilirsin.
	GOTO       ___main_F2
;LCD_Pin.c,42 :: 		}
L_main6:
;LCD_Pin.c,43 :: 		}
	GOTO       L_main1
;LCD_Pin.c,44 :: 		F2:
___main_F2:
;LCD_Pin.c,45 :: 		LCD_Out(1, 3, "Hello!");
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      3
	MOVWF      FARG_Lcd_Out_column+0
	MOVLW      ?lstr1_LCD_Pin+0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD_Pin.c,47 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
