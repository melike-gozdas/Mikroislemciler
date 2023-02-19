// initiallisation
void _init()
{
 //port B4-B7 as input
 trisb.b4 = 1;
 trisb.b5 = 1;
 trisb.b6 = 1;
 trisb.b7 = 1;
 //port D0-D4 as output
 trisd.b0 = 0; portd.b0 = 0;
 trisd.b1 = 0; portd.b1 = 0;
 trisd.b2 = 0; portd.b2 = 0;
 trisd.b3 = 0; portd.b3 = 0;
 intcon.rbie=1; //enable port B4-B7 pin change interrupts
 intcon.PEIE=1; //Enables all unmasked peripheral interrupts
 intcon.gie=1; //enable global interrupts
}
//ISR
void interrupt()
{
 if(intcon.rbif==1) //if B4-B7 interrupt occured
 {
   if(portb.f4==0) //if B4 caused the interrupt
   {
      portd.b0 = ~portd.b0; //turn on led at D0
      intcon.rbif=0; //reset B4-B7 interrupts flag }
   if(portb.f5==0) //if B5 caused the interrupt
   {
      portd.b1 = ~portd.b1; //turn on led at D1
      intcon.rbif=0; //reset B4-B7 interrupts flag
   }
   if(portb.f6==0) //if B6 caused the interrupt
   {
      portd.b2 = ~portd.b2; //turn on led at D2
      intcon.rbif=0; //reset B4-B7 interrupts flag
   }
   if(portb.f7==0) //if B7 caused the interrupt
   {
      portd.b3 = ~portd.b3; //turn on led at D3
      intcon.rbif=0; //reset B4-B7 interrupts flag
    }
 }
}
void main()
{
 _init(); //iterrupt initiallisation
 for(;;)
 {
 //put the microcontroller in sleep mode
 asm sleep;
 }
}