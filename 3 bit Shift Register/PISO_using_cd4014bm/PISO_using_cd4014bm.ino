int dataPin=9;
int clockPin=10;
int latchPin=11;

int ledPin=5;
int clockLed=6;

//int data=0;

void setup() {
  // put your setup code here, to run once:
pinMode(9,INPUT); //DataPin
pinMode(10,OUTPUT); //clockPin
pinMode(11,OUTPUT); //latchPin

pinMode(5,OUTPUT); //LED
pinMode(6,OUTPUT); //clockLed

digitalWrite(latchPin,HIGH); //ready to load Parallel inputs

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println("Give input");

delay(1000);
digitalWrite(clockPin,HIGH); //positive edge occurs, parallel inputs are stored
delay(500);
digitalWrite(clockPin,LOW); //negative edge of clock pulse occurs
digitalWrite(latchPin,LOW); //Serial shift mode


shiftin(dataPin,clockPin,ledPin,clockLed);

digitalWrite(latchPin,HIGH); //Parallel Load mode for the next loop
digitalWrite(ledPin,LOW); //to make sure LED is OFF before every loop

}

void shiftin(int datapin, int clockpin, int ledpin, int clockled)
{
  byte value=0;
  int i=0;
  
  
  
  for(i=0;i<8;i++)
  {
     Serial.println(digitalRead(datapin)); //state of dataPin==LSB of parallel input i.e. output at that clock pulse
        if(digitalRead(datapin)==HIGH){digitalWrite(ledPin,HIGH);delay(100);}
    else if(digitalRead(dataPin)==LOW){digitalWrite(ledPin,LOW);delay(100);}
    
    value |= (digitalRead(datapin)<<i);
    
    digitalWrite(clockpin,HIGH); digitalWrite(clockLed,HIGH);
    delay(500);
    digitalWrite(clockpin,LOW);digitalWrite(clockLed,LOW); //Pin 6 = clockLed, shows the clock pulse
    delay(400);   
    
    }
    //after every clock pulse, 1 right shift occurs for every bit
    //thus after 8 clock pulses, the entire parallel input is shifted out, and obtained at the dataPin. Thus we get the bit by bit serial output of the Parallel Load
 Serial.println(value, BIN);
   
    
   
    }
    
