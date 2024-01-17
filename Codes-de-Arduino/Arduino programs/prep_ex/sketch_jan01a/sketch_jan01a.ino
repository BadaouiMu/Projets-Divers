void setup() {
Serial.begin(9600);
Serial.setTimeout(2000);
}

void loop() {
char B[3] ;int i;
Serial.readBytesUntil(' ',B,3);
for(i=0;i<2;i++)
{Serial.println(B[i]);
}}
