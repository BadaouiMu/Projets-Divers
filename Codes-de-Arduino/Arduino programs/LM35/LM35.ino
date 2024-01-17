int old=millis(),newM;
void setup() {
  analogReference(INTERNAL);
Serial.begin(9600);

}

void loop() {
  if (millis()-old>=2500){
    old=millis();
  int N=analogRead(A5);  
  float V = N * 1.1 /1023.0;  // volts
  float T = V *100 ;  // °C

  Serial.print("T = ");
  Serial.print(T);
  Serial.println(" C");

 }}
