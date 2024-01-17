int old1=1,ne1,old2=1,ne2,i;
void setup() {
  Serial.begin(9600);
 pinMode(9,OUTPUT);
 
 pinMode(2,OUTPUT);
 pinMode(3,OUTPUT);

 pinMode(4,INPUT_PULLUP);
 pinMode(5,INPUT_PULLUP);
 digitalWrite(2,LOW);
  digitalWrite(3,LOW);
}

void loop() {
 ne1=digitalRead(4);
 if(ne1-old1==-1)
 
 {digitalWrite(2,HIGH);
  digitalWrite(3,LOW);
  
  for(i=1;i<=10;i++)
 {analogWrite(9,(255*i/10));
 Serial.println((255*i/10));
 delay(1000);
  }
  }
  old1=ne1;

  ne2=digitalRead(5);
 if(ne2-old2==-1)
 {for(i=9;i>=0;i--)
 {analogWrite(9,(255*i/10));
 
 Serial.println((255*i/10));
 delay(1000);
  }
  digitalWrite(3,HIGH);
  }
  old2=ne2;
 
 
 
 }
