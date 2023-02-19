#line 1 "D:/Pic_Dersleri_2021/RB0_Interrupt/RB0_Interrupt.c"
void interrup()
{
 if(INTCON.INTF == 1)
 {

 }
}

void main() {

 OPTION_REG.INTEDG = 1 ;
 INTCON.INTE = 1;
 INTCON.GIE = 1;
 INTCON.PEIE = 1;
 TRISB = 0;
 PORTB = 0;
 while(1)
 {
 delay_ms(1000);
 PORTB = 0;
 delay_ms(1000);
 PORTB = 255;
 }

}
