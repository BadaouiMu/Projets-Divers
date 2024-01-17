

volatile int cp,divis=5;
volatile int tput=0;
void setup() {
  // put your setup code here, to run once:
pinMode(2,INPUT);
pinMode(8,OUTPUT);
digitalWrite(8,LOW);
     bitSet(EIFR,INTF0);  
     attachInterrupt(0,fonction_transition, CHANGE); 
     Serial.begin(9600);
Serial.setTimeout(20000);

}
void loop(){ divis=Serial.parseInt();}
void fonction_transition() {
       cp++;
       if(cp>=divis) {tput=1-tput;digitalWrite(8,tput);
   cp=0;    } 
       
}
