//gives as many inputs high for as long as push button is pressed (as according to serial monitor)
// if if push button is pressed for long such that we get 2 consecutive '1's on serial monitor, implies 2 consecutive '1's are given as input)

int pinstate=0;
int lastpinstate=0;
byte data=0;

int dataPin=11;
int clockPin=9;
int latchPin=10;


void setup() {
  // put your setup code here, to run once:
pinMode(5,INPUT); // push button input (serial input)


pinMode(9,OUTPUT); // shift register clock input pin 11 of 74HC595
pinMode(10,OUTPUT); // storage regitser/latch clock input pin 12 of 74HC595
pinMode(11,OUTPUT); //Serial data in pin 14 of 74HC595

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:


pinstate=digitalRead(5);

if(pinstate==HIGH){
  
  
  data=data+0b10000000;
  
  }
  


digitalWrite(latchPin,LOW); //turn off the output so the pins dont light up while we are shifting bits
shiftOut(dataPin,clockPin,MSBFIRST,data);
digitalWrite(latchPin,HIGH);

delay(500);
data=data/2;

Serial.println(pinstate);
}
