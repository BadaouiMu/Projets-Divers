#define BP1 2
#define BP2 4
void setup() {
  Serial.begin(9600);
  pinMode(9,OUTPUT);
  pinMode(BP1,INPUT_PULLUP);
  pinMode(BP2,INPUT_PULLUP);
  analogWrite(9,0);
 

}


 int rp=0;
 int B1_OLD_ST = HIGH, B2_OLD_ST=HIGH;
int B1_NEW_ST , B2_NEW_ST ;
void loop() {
    B1_NEW_ST= digitalRead(BP1);
    if((B1_OLD_ST - B1_NEW_ST) == 1){ 
        rp+=13;
        if(rp>=255) rp=255;
        analogWrite(9,rp);
        Serial.println(rp);
    }
    B1_OLD_ST = B1_NEW_ST;

    B2_NEW_ST = digitalRead(BP2);
    if((B2_OLD_ST - B2_NEW_ST) == 1){ 
        rp-=13;
        if(rp<=0) rp=0;
        analogWrite(9,rp);
        Serial.println(rp);
    }
    B2_OLD_ST = B2_NEW_ST;
}
