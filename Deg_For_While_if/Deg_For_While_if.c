int i;

void main() {
   TRISB = 0;
   PORTB = 0;
   TRISD.B6 = 1;
   TRISD.B7 = 1;
   while(1)
   {
      for(i=0; i<10; i++)
      {
         PORTB = 1;    //belirli bir register in degerini degistirir.
         delay_ms(1000);
         if(PORTD.B7 == 0)
         {
            PORTD = 0;
         }
      }
   }

}
/*void main(){
for(i=0; i<10; i++)
{
   PORTB=0;    //belirli bir register in degerini degistirir.
   delay_ms(100);
   PORTB=255;
   delay_ms(100);
}
} */
