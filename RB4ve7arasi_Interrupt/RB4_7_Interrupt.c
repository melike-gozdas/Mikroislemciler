void interrup()
{
  if(INTCON.RBIF == 1)
  {

    if(PORTB.B4 == 1)
    {
      PORTD.B0 = ~portd;
      INTCON.RBIF = 0;
    }
    if(PORTB.B5 == 1)
    {
      PORTD.B1 = 0;
    }
    if(PORTB.B6 == 1)
    {
      PORTD.B2 = 0;
    }
    if(PORTB.B7 == 1)
    {
      PORTD.B3 = 0;
    }

  }
}

void main() {
  //RB4_7 harici kesme
  //kesme isleminde yazilimsal olarak yani register uzerinde yapamiyorsak asagidaki gibi TRIS ayarý yapilmali;
  TRISB.B4 = 1;
  TRISB.B5 = 1;
  TRISB.B6 = 1;
  TRISB.B7 = 1;
  INTCON.RBIE = 1;
  INTCON.GIE = 1;
  INTCON.PEIE = 1;
  //port b kullanilamaz cunku birinci pin kesme icin kullanildi.
  TRISD = 0;
  PORTD = 0;
  while(1)
  {
    //komutlar
    PORTD = 255;
  }

}
