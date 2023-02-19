/*Ornek1: Zamanlayici ile Mikrodenetleyici ledi 10ms araliklarla yakip sondursun.
1. OPTION_REG.T0CS = 0 veya 1;
2. OPTION_REG.PSA = 0 veya 1;
3. Prescaler ayarý 1:64
3.1. OPTION_REG.PS2 = 1
3.2. OPTION_REG.PS1 = 0
3.3. OPTION_REG.PS0 = 1
4. TMR0 Kaydedicisinin baslangis degeri, TMR0= 99.
5. INTCON Kaydedicisinin TMR0IE, PEIE ve GIE bitleri
5.1. INTCON.TMR0IE = 1; //1 = Enables the TMR0 Interrupt
5.2. INTCON.PEIE=1; //Enables all unmasked peripheral interrupts
5.3. INTCON.GIE = 1; //1 = Enables all interrupts
6. InitTimer0() fonksiyonu ile Timer 0 baslat. */

unsigned short counter=0, counter2=0;
//Timer 0 initiallisations
void InitTimer0()
{
 //OPTION Register
 OPTION_REG.T0CS = 0; //Harici instruction cycle clock (CLKOUT)
 OPTION_REG.PSA = 0; //Prescaler Timer0 module icin kullanilir
 //PS2:PS0: Prescaler Rate Select bits, Prescaler 1:64
 OPTION_REG.PS2 = 1;
 OPTION_REG.PS1 = 0;
 OPTION_REG.PS0 = 1;
 TMR0 = 99; //Timer0 baslangic deger
 //INTCON Register
 INTCON.TMR0IE = 1; //1 = Enables the TMR0 Interrupt
 INTCON.PEIE=1; //Enables all unmasked peripheral interrupts
 INTCON.GIE = 1; //1 = Enables all interrupts
}
//isr
void Interrupt()
{
 if(INTCON.TMR0IF == 1) //Time 0 kaydedicisi 255 degerine vardigi zaman
 {
 INTCON.TMR0IF = 0; //reset timer0 interrupt flag
 TMR0 = 99; //Timer0 tekrar 99 degeri ile beslenmesi gerekmektedir
// istenen islemler
 portb.b0 = ~portb.b0; // led
// Ek 1 saniye icin
 counter++; // 1 second
 counter2++; // 2 seconds
 if(counter == 100)
 {
 counter=0;
 portb.b0 = ~portb.b0; // led
 }
 if(counter2 == 200) // 2 saniye icin
 {
 counter2=0;
 portb.b1 = ~portb.b1; // led
 }// Ek
 }
}
void main()
{
 int i=0;
 InitTimer0(); //Timer 0 baslatiliyor
 //pin B0 as output
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
//Kapasitor = CAP
//Osilator (Kristal) = Crystal
