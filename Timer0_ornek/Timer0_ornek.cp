#line 1 "D:/Pic_Dersleri_2021/Timer0_ornek/Timer0_ornek.c"

void Interrupt()
{
 if(INTCON.TMR0IF == 1)
 {
 INTCON.TMR0IF = 0;
 TMR0 = 99;
 PORTD = ~portd;
 }
}
void main() {
 OPTION_REG.T0CS = 0;
 OPTION_REG.T0SE = 1;
 OPTION_REG.PSA = 0;
 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 1;
 TMR0 = 99;
 INTCON.GIE = 1;
 INTCON.PEIE = 0;
 INTCON.TMR0IE = 1;


 TRISB = 0;
 PORTB = 0;
 TRISD = 0;
 PORTD = 0;
 while(1)
 {

 PORTB = 0;
 DELAY_MS(1000);
 PORTB = 1;
 DELAY_MS(1000);
 }
}
