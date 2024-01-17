#include <Servo.h>
Servo servo1; 
byte b;char c;int k;
void setup() { 
  pinMode(2,OUTPUT);digitalWrite(2,LOW);
  servo1.attach(9,1000,2000);
  Serial.begin(9600);
  
}

void loop() {

if(Serial.available()>0)
{
  b=Serial.read();
   if(b=='A') 
   {k=Serial.parseInt();
   while(Serial.available()>0)
    c=Serial.read();
   servo1.write(k);}
   if(b=='B') 
   {k=Serial.parseInt();
   while(Serial.available()>0)
    c=Serial.read();
   servo1.write(k);}
   if(b=='C')
    digitalWrite(2,HIGH) ;
   if(b=='D')
    digitalWrite(2,LOW) ;
}
}
