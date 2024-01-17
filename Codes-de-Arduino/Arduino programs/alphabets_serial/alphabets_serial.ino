void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
}

void loop() {
  Serial.write('A');
  delay(1000);
  Serial.write('B');
  delay(1000);
  Serial.write('C');
  delay(1000);
  Serial.write('D');
  delay(1000);
  Serial.write('E');
  delay(1000);
  Serial.write('F');
  delay(1000);
  Serial.write(13);
  delay(1000);
}
