unsigned short sayac1_sn=0, sayac2_sn=0;

//ISR
void Interrupt()
{
  if(INTCON.TMR0IF == 1) //Time 0 kaydedicisi 255 degerine vardigi zaman
  {
    INTCON.TMR0IF = 0; //reset timer0 Interrupt flag
    TMR0 = 99; //Timer0 tekrar 99 degeri ile beslenmesi gerekmektedir
    // istenen islemler
    portb.b0 = ~portb.b0; // led
    // Ek 1 saniye icin
    sayac1_sn++; // 1 second
    sayac2_sn++; // 2 seconds
    if(sayac1_sn == 100)
    {
      sayac1_sn=0;
      portd.b0 = ~portd.b0; // led
    }
    if(sayac2_sn == 200) // 2 saniye icin
    {
      sayac2_sn=0;
      portd.b1 = ~portd.b1; // led
    }
  }
}
void main()
{
  OPTION_REG.T0CS = 0;
  OPTION_REG.T0SE = 1;
  OPTION_REG.PSA = 0;
  OPTION_REG.PS2 = 1;
  OPTION_REG.PS1 = 0;
  OPTION_REG.PS0 = 1;
  TMR0 = 99; //Timer0 baslangic deger
  //INTCON Register
  INTCON.GIE = 1;
  INTCON.PEIE=1;
  INTCON.TMR0IE = 1;

  //pin B0 as output

  TRISD = 0;
  PORTD = 0;
  while(1)
  {
      PORTD = 255;
  }
}
