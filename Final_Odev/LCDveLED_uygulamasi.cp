#line 1 "D:/Pic_Dersleri_2021/Final_Odev/LCDveLED_uygulamasi.c"

sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;


sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

int veri=0;
float voltaj=0;
float doluluk=0;
char txt[15];

void main()
{
 TRISA=0b00000001;
 ADCON1=0b10001110;
 TRISB=0;
 PORTB=0;
 TRISC=0;
 PORTC=0;

 Lcd_init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"  BATARYA OLCER");
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);
 while(1)
 {
 veri=ADC_Read(0);
 voltaj=(veri * 5)/1023;








 doluluk=11 * voltaj;


 floattoStr(doluluk, txt);
 Lcd_Out(1,1," Batarya Voltajý");
 Lcd_Out(2,5,txt);

 if(doluluk > 2.4)
 {
 PORTB.RB6=1;
 PORTB.RB7=0;
 PORTC.RC0=0;
 }
 else if(1.2 <doluluk && doluluk<= 2.4)
 {
 PORTB.RB6=0;
 PORTB.RB7=1;
 PORTC.RC0=0;
 }
 else if(doluluk <= 1.2)
 {
 PORTB.RB6=0;
 PORTB.RB7=0;
 PORTC.RC0=1;
 }
 delay_ms(1000);
 Lcd_Cmd(_LCD_CLEAR);

 }
}
