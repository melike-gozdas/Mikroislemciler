void main() {
  TRISC.B2 = 0;
  PR2 = 249;
  
  T2CKPS1_bit = 1;
  T2CKPS0_bit = 1;
  
  PWM1_Set_Duty(192); //0 ile 255 arasýnda istedigimiz degeri girebiliriz.
  /*CCP1M3_bit = 1;
  CCP1M2_bit = 1;
  CCP1M1_bit = 0;
  CCP1M0_bit = 0;  */
  // yukaridaki bit ayarlari yerine
  PWM1_Start();
  
}
