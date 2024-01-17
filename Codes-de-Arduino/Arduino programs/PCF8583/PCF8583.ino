#include <Wire.h>
int i;
float T;
byte b[5];
String days[6]={"samedi","dimanche","lundi"};
byte d;

void setup(){
  Wire.begin();
  Serial.begin(9600);
Wire.beginTransmission(0x50);
Wire.write(0x00);
Wire.write(0x80);
Wire.endTransmission();

Wire.beginTransmission(0x50);
Wire.write(0x02);
Wire.write(B00000000);
Wire.endTransmission();

Wire.beginTransmission(0x50);
Wire.write(0x03);
Wire.write(B01000000);//
Wire.endTransmission();

Wire.beginTransmission(0x50);
Wire.write(0x04);
Wire.write(B00001000);
Wire.endTransmission();
Wire.beginTransmission(0x50);
Wire.write(0x05);
Wire.write(B01100000);
Wire.endTransmission();
Wire.beginTransmission(0x50);
Wire.write(0x06);
Wire.write(B01010010);
Wire.endTransmission();
Wire.beginTransmission(0x50);
Wire.write(0x00);
Wire.write(0x00);
Wire.endTransmission();}



void loop(){

  Wire.beginTransmission(0x50);
Wire.write(0x02);
Wire.endTransmission();
delay(10);
  Wire.requestFrom(0x50,5);
  delay(10);
  for(i=0;i<5;i++)
  {b[i]=Wire.read();
  delay(10);
    }
    

    for(i=0;i<5;i++)
  {Serial.println(b[i],BIN);
  delay(10);
    }
    Serial.println();






Serial.println(b[0],HEX);

Serial.println(b[1],HEX);


Serial.println(b[2],HEX);

d=b[3]<<2;
d=d>>2;



Serial.println(d,HEX);
Serial.println("2021");
delay(10000);



    


}

    
  
  
  
  
  
