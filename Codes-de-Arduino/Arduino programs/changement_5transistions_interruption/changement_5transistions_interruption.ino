

volatile int cp;
volatile int tput=0;
void setup() {
  // put your setup code here, to run once:
pinMode(2,INPUT);
pinMode(8,OUTPUT);
digitalWrite(8,LOW);
     bitSet(EIFR,INTF0);  
     attachInterrupt(0,fonction_transition, CHANGE); 

}
void loop(){}
void fonction_transition() {

       cp++;
       if(cp==5) {tput=1-tput;digitalWrite(8,tput);
   cp=0;    } 
       
}
