#line 1 "D:/Pic_Dersleri_2021/ADC_Potansiyometre_deðerini_LED_ile_göster/ADC_Potansiyometre.c"
#line 6 "D:/Pic_Dersleri_2021/ADC_Potansiyometre_deðerini_LED_ile_göster/ADC_Potansiyometre.c"
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;
sbit LCD_RS_Direction at TRISB0_bit;
sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;
unsigned int adc_deger=0;
char adc_deger_txt[15];
void main() {
 ADC_init();
 adcon1=0b00001110;
 TRISA.B0 = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"BILGISAYAR");
 Lcd_Out(2,2,"MUHENDISLIGI");
 delay_ms(4000);
 LCD_Cmd(_LCD_CLEAR);
 while(1){
 adc_deger=ADC_Read(0);
 wordtoStr(adc_deger,adc_deger_txt);
 Lcd_Out(1,1,adc_deger_txt);
 Lcd_Out(2,2," Gelen Deger");
 delay_ms(500);
}
}
