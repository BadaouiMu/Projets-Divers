#include <Wire.h>
#include <LiquidCrystal.h>
int8_t msb; // signé
uint8_t lsb;
float T;
byte devadr=0x4C;
LiquidCrystal lcd(13,12,11,10,9,8);
void setup(){
  Wire.begin();
  lcd.begin(16, 2);
   
    Wire.beginTransmission(devadr);
    Wire.write(0xAC); 
    Wire.write(0x01);
    Wire.endTransmission();
    delay(750); 
  }
  //premier échantillon


void loop(){
 
  
    Wire.beginTransmission(devadr);
    Wire.write(0xEE); 

    Wire.endTransmission();
    
    
      delay(750);
  lcd.clear();
         Wire.beginTransmission(devadr);

    Wire.write(0xAA);
    Wire.endTransmission();
     
    Wire.requestFrom(devadr,2);
    msb = Wire.read();
    lsb = Wire.read();
    T = msb;
    if (lsb == 128)T = T+0.5;

    lcd.print(T,1);
         delay(1000);
        
  
//  période de répétition
}
