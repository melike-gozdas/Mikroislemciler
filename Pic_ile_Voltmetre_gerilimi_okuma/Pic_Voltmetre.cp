#line 1 "D:/Pic_Dersleri_2021/Pic_ile_Voltmetre_gerilimi_okuma/Pic_Voltmetre.c"
#line 4 "D:/Pic_Dersleri_2021/Pic_ile_Voltmetre_gerilimi_okuma/Pic_Voltmetre.c"
sbit LCD_RS at RB0_bit;
sbit LCD_EN at RB1_bit;
sbit LCD_D4 at RB2_bit;
sbit LCD_D5 at RB3_bit;
sbit LCD_D6 at RB4_bit;
sbit LCD_D7 at RB5_bit;
sbit LCD_RS_Direction at TRISB0_bit;sbit LCD_EN_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB4_bit;
sbit LCD_D7_Direction at TRISB5_bit;
long int gelenveri=0;
float voltaj=0,gerilim=0;
char sondeger[15];
void main() {
 TRISB=0x00;
 TRISA=0xFF;
 adcon0=0b10010000;
 adcon1=0b10000010;
 Lcd_Init();
 Lcd_Cmd(_LCD_CURSOR_OFF);
 LCD_Cmd(_LCD_CLEAR);
 Lcd_Out(1,1,"BILGISAYAR");
 Lcd_Out(2,2,"MUHENDISLIGI");
 delay_ms(4000);
 LCD_Cmd(_LCD_CLEAR);
while(1)
{
 gelenveri=ADC_Read(1);
 voltaj=(0.004887586*gelenveri);
 gerilim=11*voltaj;
 floattoStr(gerilim,sondeger);
 Lcd_Out(1,1,sondeger);
 Lcd_Out(2,2," Pilin Voltaji");
 delay_ms(500);
}
}
