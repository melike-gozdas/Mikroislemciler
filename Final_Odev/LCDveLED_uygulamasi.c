// Lcd pinout settings
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D7 at RB3_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D4 at RB0_bit;

// Pin direction
sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D7_Direction at TRISB3_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D4_Direction at TRISB0_bit;

int veri=0;
float voltaj=0;
float doluluk=0;
char txt[15];

void main()
{
   TRISA=0b00000001;  //AN0 giris olarak ayarlandi.
   ADCON1=0b10001110;
   TRISB=0;   //PORTB decimal sistemde tamamen cikis yapildi.
   PORTB=0;   //PORTB icerigi temizlendi
   TRISC=0;   //PORTC decimal sistemde tamamen cikis yapildi.
   PORTC=0;   //PORTC icerigi temizlendi

   Lcd_init();
   Lcd_Cmd(_LCD_CURSOR_OFF);  //Isaretciyi kapatir.
   Lcd_Cmd(_LCD_CLEAR);  //LCD ekranini temizler
   Lcd_Out(1,1,"  BATARYA OLCER");
   delay_ms(1000);  //Gecikme fonksiyonu
   Lcd_Cmd(_LCD_CLEAR);
   while(1)
   {
      veri=ADC_Read(0); //AN0 secildi.
      voltaj=(veri * 5)/1023; //ham veri

      //0 ile 12V arasi bir bataryamiz var. Bunu olcmek istiyoruz
      //Ama direk pic'in ucuna 12 volt gerilimi direk baglarsak pic'imizin portu yanar.
      //Cunku pic uclarýna maksimum 5V verilebilir.
      //12 voltu 5 volta oranlayamayiz. Bunuda en kolay gerilim bolucu devre ile yapariz.
      //Burada 1K ve 10K direncleri kullanarak, 1/11 oranýnda donusum yapmis oluruz.
      //Gerilim bolucuye 12 volt uyguladigimiz zaman pic'in bacagina 1.09 volt uygulanmis olur.

      doluluk=11 * voltaj;
      //Gerilim bolucuyle 11 kat gerilimi kuculttugumuz icin bu formulle
      //11 kat buyuterek gercek degerini buluyoruz.
      floattoStr(doluluk, txt);
      Lcd_Out(1,1," Batarya Voltaji");
      Lcd_Out(2,5,txt);

      if(doluluk > 2.4)
      {
         PORTB.RB6=1;  //PORTB'nin 6. bitini 1 yaptik.
         PORTB.RB7=0;  //PORTB'nin 7. bitini 0 yaptik.
         PORTC.RC0=0;  //PORTC'nin 0. bitini 0 yaptik.
      }
      else  if(1.2 <doluluk && doluluk<= 2.4)
      {
         PORTB.RB6=0;  //PORTB'nin 6. bitini 0 yaptik.
         PORTB.RB7=1;  //PORTB'nin 7. bitini 1 yaptik.
         PORTC.RC0=0;  //PORTC'nin 0. bitini 0 yaptik.
      }
      else if(doluluk <= 1.2)
      {
         PORTB.RB6=0;  //PORTB'nin 6. bitini 0 yaptik.
         PORTB.RB7=0;  //PORTB'nin 7. bitini 0 yaptik.
         PORTC.RC0=1;  //PORTC'nin 0. bitini 1 yaptik.
      }
      delay_ms(1000);
      Lcd_Cmd(_LCD_CLEAR);

   }
}
