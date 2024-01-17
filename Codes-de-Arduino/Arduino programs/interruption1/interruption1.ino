#define   BP1  2
#define   BP2  3
#define   LED1  8
#define   LED2  9
volatile boolean LED1_STATE=false, LED2_STATE=false;
void setup() {
     pinMode(BP1,INPUT_PULLUP);
     pinMode(BP2,INPUT_PULLUP);
     pinMode(LED1,OUTPUT);
     pinMode(LED2,OUTPUT);
     digitalWrite(LED1,LED1_STATE);
     digitalWrite(LED2,LED2_STATE);
     bitSet(EIFR,INTF0);  // baisser le drapeau de INT0
     bitSet(EIFR,INTF1);  // baisser le drapeau de INT1
     attachInterrupt(0,led1_isr, FALLING); 
     attachInterrupt(1,led2_isr, FALLING);     
}
void loop() { }
void led1_isr(){
    LED1_STATE = !LED1_STATE;
    digitalWrite(LED1,LED1_STATE);
}
void led2_isr(){
    LED2_STATE = !LED2_STATE;
    digitalWrite(LED2,LED2_STATE);
}
