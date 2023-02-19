#line 1 "D:/Pic_Dersleri_2021/RB4ve7arasi_Interrupt/RB4_7_Interrupt.c"
void interrup()
{
 if(INTCON.INTF == 1)
 {
 INTCON.INTF = 1;

 PORTD = 0;
 }
}

void main() {

 OPTION_REG.INTEDG = 1 ;
 INTCON.INTE = 1;
 INTCON.GIE = 1;
 INTCON.PEIE = 1;

 TRISD = 0;
 PORTD = 0;
 while(1)
 {

 delay_ms(1000);
 PORTD = 0;
 delay_ms(1000);
 PORTD = 255;
 }

}
