#line 1 "D:/Pic_Dersleri_2021/Zamanlayici_ile_LED_yakma/Zamanlayici_ile_LED_yakma.c"
#line 15 "D:/Pic_Dersleri_2021/Zamanlayici_ile_LED_yakma/Zamanlayici_ile_LED_yakma.c"
unsigned short counter=0, counter2=0;

void InitTimer0()
{

 OPTION_REG.T0CS = 0;
 OPTION_REG.PSA = 0;

 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 1;
 TMR0 = 99;

 INTCON.TMR0IE = 1;
 INTCON.PEIE=1;
 INTCON.GIE = 1;
}

void Interrupt()
{
 if(INTCON.TMR0IF == 1)
 {
 INTCON.TMR0IF = 0;
 TMR0 = 99;

 portb.b0 = ~portb.b0;

 counter++;
 counter2++;
 if(counter == 100)
 {
 counter=0;
 portb.b0 = ~portb.b0;
 }
 if(counter2 == 200)
 {
 counter2=0;
 portb.b1 = ~portb.b1;
 }
 }
}
void main()
{
 int i=0;
 InitTimer0();

 trisb.b0 = 0;
 portb.b0 = 0;
 trisb.b1 = 0;
 portb.b1 = 0;
 TRISD = 0;
 PORTD = 0;
 for(i = 0; i < 1000; i++)
 {
 PORTD = i;
 delay_ms(1000);
 }
}
