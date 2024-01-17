

volatile int cp,divis=5;
volatile int tput=0;
void setup() {
  // put your setup code here, to run once:
pinMode(2,INPUT);
pinMode(7,OUTPUT);
DDRB = B00000000;

     bitSet(EIFR,INTF0);  
     attachInterrupt(0,fonction_transition, CHANGE); 
   
}
void loop(){ }
void fonction_transition() {
       cp++;
       if(cp>=PINB) {tput=1-tput;digitalWrite(7,tput);
   cp=0;    } 
       
}
