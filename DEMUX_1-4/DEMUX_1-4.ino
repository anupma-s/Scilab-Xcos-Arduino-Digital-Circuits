//input
int i=0;

//select lines
int a=0;
int b=0;

void setup() {
  // put your setup code here, to run once:

//select lines
pinMode(6,INPUT); //select line a (MSB)
pinMode(7,INPUT); //select line b (LSB)

//input pin
pinMode(5,INPUT);

//output pins
pinMode(8,OUTPUT); //output 1 LSB
pinMode(9,OUTPUT); //output 2
pinMode(10,OUTPUT); //output 3
pinMode(11,OUTPUT); //output 4 MSB

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:

i=digitalRead(5); //reads input

a=digitalRead(6); //reads input to select line a, MSB
b=digitalRead(7); //LSB

if (i==0){ //all outputs will be zero irrespective of which one is selected
  digitalWrite(11,LOW);
  digitalWrite(10,LOW);
  digitalWrite(9,LOW);
  digitalWrite(8,LOW);
  delay(100);
 }
 else if (i==1){
   if (a==0 & b==0){ //input i is seen at first output pin (LSB)
     digitalWrite(11,LOW);
     digitalWrite(10,LOW);
     digitalWrite(9,LOW);
     digitalWrite(8,HIGH);
     delay(100);
     }
    else if (a==0 & b==1){ //input i is seen at second output pin
     digitalWrite(11,LOW);
     digitalWrite(10,LOW);
     digitalWrite(9,HIGH);
     digitalWrite(8,LOW);
     delay(100);
     }
     else if (a==1 & b==0){ //input i is seen at third output pin
     digitalWrite(11,LOW);
     digitalWrite(10,HIGH);
     digitalWrite(9,LOW);
     digitalWrite(8,LOW);
     delay(100);
     }
     else if (a==1 & b==1){ //input i is seen at fourth output pin (MSB)
     digitalWrite(11,HIGH);
     digitalWrite(10,LOW);
     digitalWrite(9,LOW);
     digitalWrite(8,LOW);
     delay(100);
     }
     }
       
       
      
 
 
}
