
int divis;
void setup() 

{
  // put your setup code here, to run once:
pinMode(4,INPUT);
pinMode(8,OUTPUT);
digitalWrite(8,LOW);
Serial.begin(9600);
Serial.setTimeout(20000);

}
int oldinput=0,newinput,output=0;
void loop() {
  // put your main code here, to run repeatedly:

divis=Serial.parseInt();
int static cp;
newinput= digitalRead(4);

    if(abs(oldinput-newinput)==1 ){ 
       cp++;
       } 
       oldinput=newinput;
    if(cp==5)    
        {output = 1 - output;
        digitalWrite(8,output);
        cp=0;
        }
}
