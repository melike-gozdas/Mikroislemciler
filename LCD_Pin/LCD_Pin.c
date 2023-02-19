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

int sayi=70;       //degiskenler port tanimindan sonra tanimlanamaz.
char sayi_txt[10];
void main() {
TRISC.B0 = 1;    //cikis
PORTC.b0 = 0;    //sifirlandi
TRISC.B1 = 1;    //cikis
PORTC.b1 = 0;    //sifirlandi
LCD_Init();
IntToStr(sayi, sayi_txt);
delay_ms(1000);  //1sn;
F1:  //label
LCD_Cmd(_LCD_CLEAR);  //adresini biliyorum.
while(1)
{
delay_ms(1000);
if(PORTC.b0 = 1)
{
    LCD_Out(1, 3, sayi_txt);
}
delay_ms(1000);
if(PORTC.b1 = 1)
{
    //goto F1;    bu komut calisirsa F1: ile goto F1 arasinda sonsuz dongu anahtar kapali oldugu surece.
    //break;
    goto F2;   //sonsuz donguden cikmak icin goto yu tercih etmek daha avantajli cunku istedigin konuma gidebilirsin.
}
}
F2:
LCD_Out(1, 3, "Hello!");

}
