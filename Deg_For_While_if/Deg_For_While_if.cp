#line 1 "D:/Pic_Dersleri_2021/Deg_For_While_if/Deg_For_While_if.c"
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
 PORTB = 1;
 delay_ms(1000);
 if(PORTD.B7 == 0)
 {
 PORTD = 0;
 }
 }
 }

}
