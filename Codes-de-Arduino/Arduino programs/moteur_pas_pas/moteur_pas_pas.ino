byte b;int k;
void setup() {
 
  Serial.begin(9600);
    DDRB = B1111;
    PORTB = B0000001;
    pinMode(2,OUTPUT);
    digitalWrite(2,LOW);
}
void loop() {if(Serial.available()>0){b=Serial.read();
   if(b=='A') {k=Serial.parseInt(); gauche(k, 500);}
   if(b=='B') {k=Serial.parseInt(); droite(k, 500);}
   if(b=='C') digitalWrite(2,HIGH) ;
   if(b=='D') digitalWrite(2,LOW) ;
}

}

void gauche(int N, int T){
    for(int i =0; i<N; i++){
        PORTB <<= 1;
        if( PORTB == B00010000) PORTB = B00000001;  
       delay(T);
    }    
}
void droite(int N, int T){
    for(int i =0; i<N; i++){
        PORTB >>= 1;
        if(PORTB ==B00000000) PORTB = B00010000; 
        delay(T);
    }    
}
