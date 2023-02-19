#line 1 "D:/Pic_Dersleri_2021/Interrupt_Ledleri_yakma/Interrupt_Ledleri_yakma.c"

void _init()
{

 trisb.b4 = 1;
 trisb.b5 = 1;
 trisb.b6 = 1;
 trisb.b7 = 1;

 trisd.b0 = 0; portd.b0 = 0;
 trisd.b1 = 0; portd.b1 = 0;
 trisd.b2 = 0; portd.b2 = 0;
 trisd.b3 = 0; portd.b3 = 0;
 intcon.rbie=1;
 intcon.PEIE=1;
 intcon.gie=1;
}

void interrupt()
{
 if(intcon.rbif==1)
 {
 if(portb.f4==0)
 {
 portd.b0 = ~portd.b0;
 intcon.rbif=0;
 if(portb.f5==0)
 {
 portd.b1 = ~portd.b1;
 intcon.rbif=0;
 }
 if(portb.f6==0)
 {
 portd.b2 = ~portd.b2;
 intcon.rbif=0;
 }
 if(portb.f7==0)
 {
 portd.b3 = ~portd.b3;
 intcon.rbif=0;
 }
 }
}
void main()
{
 _init();
 for(;;)
 {

 asm sleep;
 }
}
