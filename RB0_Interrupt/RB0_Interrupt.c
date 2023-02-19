void interrup()
{
  if(INTCON.INTF == 1)
  {
    INTCON.INTF = 0;   //1 olursa surekli gelir
    //komutlar
    PORTD = 0;
  }
}
//kesme sonsuz dongu icerisinde kesme geldigi zaten kesmeye hizmet eder sonra tekrar buraya gelir.
void main() {
  //RB0 harici kesme
  OPTION_REG.INTEDG = 1 ;//1 ise Rising 0 ise Falling
  INTCON.INTE = 1;
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  //port b kullanilamaz cunku birinci pin kesme için kullanildi.
  TRISD = 0;
  PORTD = 0;
  while(1)
  {
    //komutlar
    delay_ms(1000);
    PORTD = 0;
    delay_ms(1000);
    PORTD = 255;
  }

}
