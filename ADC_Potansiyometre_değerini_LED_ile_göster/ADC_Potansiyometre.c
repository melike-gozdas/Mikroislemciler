
/*Ornek 1: Potansiyometre’den gelen degeri LCD ekraninda gosterelim. Bu ornekte ADC
ile alakali uygulama olarak. Potansiyometre’den gelen degeri bir degisken uzerinde
tutup LCD ekranina yazdirmak.*/

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
unsigned int adc_deger=0; // kaydedici degeri
char adc_deger_txt[15]; // LCD
void main() {
 ADC_init();
 adcon1=0b00001110; // A portu'nun 0. pini analog olarak ayarlandi
 TRISA.B0 = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"BILGISAYAR");
 Lcd_Out(2,2,"MUHENDISLIGI");
 delay_ms(4000);
 LCD_Cmd(_LCD_CLEAR);
 while(1){
 adc_deger=ADC_Read(0); // A portu'nun 0. pininden gelen degeri bir degiskene atiyoruz
 wordtoStr(adc_deger,adc_deger_txt);
 Lcd_Out(1,1,adc_deger_txt);
 Lcd_Out(2,2," Gelen Deger");
 delay_ms(500);
}
}
/*
Volt = (adc_deger*5) / 1024;
Floattostr(volt,volt_txt);
Lcd_Out(2,2, volt_txt);   */
