#include<LiquidCrystal.h>
LiquidCrystal lcd(13,12,11,10,9,8); 
void setup() {int8_t n=B10000010;
lcd.begin(16,2);
lcd.print(n);
}

void loop() {

}
