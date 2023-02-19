unsigned short duty_cycle=0; // duty cycle’in degerini saklar
void main()
{
 trisb.b0 = 1; //B0 duty_cycle degerinin artisi icin
 trisb.b1 = 1; //B1 duty_cycle degerinin azalmasi icin
 trisc.b2 = 0; //C2 PWM cikis olarak ayarlandi
 PR2 = 124; // period register = 124, bize 500Hz Frequency vermesi icin
 // prescaler 1:16
 T2CKPS1_bit = 1;
 T2CKPS0_bit = 1;
 PWM1_Set_Duty(duty_cycle); // duty cycle set ediliyor
 PWM1_Start(); // PWM1 baslatiliyor while(1)
 {
 if(portb.b0 == 0) //
 {
 duty_cycle++; // duty cycle artir
 PWM1_Set_Duty(duty_cycle); // duty cycle set edildi 1…..255
 delay_ms(50); //bekleme
 }
 if(portb.b1 == 0) //switch B1 basili ise
 {
 duty_cycle--; // duty cycle azalt
 PWM1_Set_Duty(duty_cycle); // duty cycle set edildi
 delay_ms(50); //bekleme
 }
 }
}
