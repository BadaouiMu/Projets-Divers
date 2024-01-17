#include<Wire.h>
void setup() {Serial.begin(9600);
  char b[19];int i,c[3];
Wire.begin();
 Wire.beginTransmission(0x51);
 delay(10);
  Wire.write(0x00);
  Wire.write(0x80);
  delay(10);
  Wire.write(24);
  delay(10);
  Wire.write(25);
delay(10);
  Wire.write(40);
  delay(20);
  Wire.endTransmission();
delay(10);
Wire.beginTransmission(0x51);
delay(10);
    Wire.write(0x00);
  delay(10);
  Wire.write(0x20);
  delay(10);
  Wire.write("ecole mohammadia");
  delay(10);

  Wire.endTransmission();
Wire.beginTransmission(0x51);
delay(10);
    Wire.write(0x00);
  delay(10);
  Wire.write(0x20);
  delay(10);
  Wire.endTransmission();
  
  Wire.requestFrom(0x51,16);
  delay(10);
  for(i=0;i<16;i++)
  {delay(10);
    b[i]=Wire.read();}
    delay(10);
  for(i=0;i<16;i++)
  {delay(10);
    Serial.print(b[i]);
  }

Wire.beginTransmission(0x51);
delay(10);
    Wire.write(0x00);
  delay(10);
  Wire.write(0x80);
  delay(10);
  Wire.endTransmission();
  
  Wire.requestFrom(0x51,3);
  delay(10);
  for(i=0;i<3;i++)
  {delay(10);
    c[i]=Wire.read();}
    delay(10);
    Serial.println();
  for(i=0;i<3;i++)
  {delay(10);

    Serial.println(c[i]);
  }



} 


void loop() {
 
  

}
