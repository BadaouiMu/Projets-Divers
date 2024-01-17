#include<Servo.h>
Servo SE1;
void setup() {
Serial.begin(9600);
SE1.attach(7);
}

void loop() {
  int b;
if(Serial.available())
  {b=Serial.parseInt();
  SE1.write(b);
  while(Serial.available())
    Serial.read();
  }
else
  {Serial.println();  
  Serial.println("Donnez angle en degre");  
  }
delay(1000);

}
