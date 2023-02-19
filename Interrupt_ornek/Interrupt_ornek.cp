#line 1 "D:/Pic_Dersleri_2021/Interrupt_ornek/Interrupt_ornek.c"

int i = 0;
void init_interrupt()
{
 option_reg.intedg=0;
 intcon.inte=1;
 intcon.PEIE=1;
 intcon.gie=1;
}

void interrupt()
{
 if(intcon.intf==1)
 {
 portd.b0 = ~portd.b0;
 for(i = 0; i < 100; i++)
 {
 porte = i;
 delay_ms(300);
 }
 intcon.intf=0;
 }
}
void main()
{
 init_interrupt();
 trisb.b0=1;
 trisd = 0; portd = 0;
 trise = 0; porte = 0;
 {
 portd = i;
 delay_ms(300);
 }
 while(1)
 {
 asm sleep;
 }
}
