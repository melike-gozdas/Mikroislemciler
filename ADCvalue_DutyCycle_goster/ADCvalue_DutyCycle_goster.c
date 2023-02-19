sbit LCD_RS at RB2_bit;
sbit LCD_EN at RB3_bit;sbit LCD_D4 at RB4_bit;
sbit LCD_D5 at RB5_bit;
sbit LCD_D6 at RB6_bit;
sbit LCD_D7 at RB7_bit;
sbit LCD_RS_Direction at TRISB2_bit;
sbit LCD_EN_Direction at TRISB3_bit;
sbit LCD_D4_Direction at TRISB4_bit;
sbit LCD_D5_Direction at TRISB5_bit;
sbit LCD_D6_Direction at TRISB6_bit;
sbit LCD_D7_Direction at TRISB7_bit;
// End LCD module connections
unsigned int adc_value;
char adc_value_txt[10];
unsigned short duty_cycle=0;
char duty_cycle_txt[4];
void get_adc_set_duty_cycle()
{
 adc_value = ADC_Read(0); // AN0 analog degeri oku
 duty_cycle = adc_value / 4;
 wordtostr(adc_value,adc_value_txt);
 bytetostr(duty_cycle,duty_cycle_txt);
 Lcd_Out(1,1,"ADC VALUE: "); Lcd_Out(1,12,adc_value_txt);
 Lcd_Out(2,1,"Duty Cycle: "); Lcd_Out(2,13,duty_cycle_txt);
 PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
 delay_ms(100);
}
void main()
{
 ADC_Init();
 ADCON1 = 0b00001110; TRISA.B0 = 1;
 Lcd_Init();
 Lcd_Cmd(_LCD_CLEAR);
 Lcd_Cmd(_LCD_CURSOR_OFF);
 //PWM
 trisc.b2 = 0; //C2 PWM
 PR2 = 124; //load period register with 124 to get 500Hz Frequency
 //set prescaler 1:16
 T2CKPS1_bit = 1;
 T2CKPS0_bit = 1;
 PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
 PWM1_Start(); // PWM1 baslatildi
 while(1)
 {
 get_adc_set_duty_cycle();
 }
}
