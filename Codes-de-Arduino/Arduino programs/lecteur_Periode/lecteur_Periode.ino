void setup() {
  // put your setup code here, to run once:
pinMode(3,INPUT);
Serial.begin(9600);
interrupts();
    // attachInterrupt(1,falling, FALLING);     
     attachInterrupt(1,rising,CHANGE);     
}
volatile unsigned long  T1,T2,T3;
volatile int i=0,s=0;





//
//void loop() {
//float Th = pulseIn(3,HIGH); 
//float Tl = pulseIn(3,LOW);
//float T=Th+Tl;
//Serial.print("Th =");
//Serial.println(Th);
//Serial.print("T = ");
//Serial.println(T);
//Serial.print("Rapport cyclique est :");
//Serial.println(Th/T);
//delay(1000); 
//
//}


void loop() {
  if(s==1){unsigned long a=T2-T1,b=T3-T1;
Serial.print("Th =");
delay(1000);
Serial.println((float)a);
Serial.print("T = ");
delay(1000);
Serial.println((float)b);
Serial.print("Rapport cyclique est :");
delay(1000);

Serial.println((float)a/b);
delay(1000);
s=0;
}}
void rising(){
  s=0;
  if (i==0)
  {
    T1=micros();
    i=1; 
    }
 if(i==1)
 {T2=micros();

 i=2; 
 

  }
  if(i==2)
  {T3=micros();
 
  s=1;
  i=0;
    }
  }

  
