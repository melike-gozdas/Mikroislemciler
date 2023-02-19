#line 1 "D:/Pic_Dersleri_2021/PWM_HizKontrolu/PWM_HizKontrolu.c"
unsigned short duty_cycle=0;
void main()
{
 trisb.b0 = 1;
 trisb.b1 = 1;
 trisc.b2 = 0;
 PR2 = 124;

 T2CKPS1_bit = 1;
 T2CKPS0_bit = 1;
 PWM1_Set_Duty(duty_cycle);
 PWM1_Start();
 {
 if(portb.b0 == 0)
 {
 duty_cycle++;
 PWM1_Set_Duty(duty_cycle);
 delay_ms(50);
 }
 if(portb.b1 == 0)
 {
 duty_cycle--;
 PWM1_Set_Duty(duty_cycle);
 delay_ms(50);
 }
 }
}
