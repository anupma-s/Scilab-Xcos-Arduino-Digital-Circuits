//Decimal to Binary priority encoder (0 to 7)

//decimal inputs
int d1=0; //decimal '1'
int d2=0;
int d3=0;
int d4=0;
int d5=0;
int d6=0;
int d7=0; //decimal '7'

void setup() {
  // put your setup code here, to run once:
  //input in decimal
pinMode(2,INPUT); //decimal '1'
pinMode(3,INPUT); //decimal '2'
pinMode(4,INPUT); //decimal '3'
pinMode(5,INPUT); //decimal '4'
pinMode(6,INPUT); //decimal '5'
pinMode(7,INPUT); //decimal '6'
pinMode(8,INPUT); //decimal '7'

//output in binary
pinMode(10,OUTPUT); //MSB
pinMode(11,OUTPUT);
pinMode(12,OUTPUT); //LSB

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  //reads the inputs (decimal number) at the specified pin number
d1=digitalRead(2); //decimal number '1'
d2=digitalRead(3);
d3=digitalRead(4);
d4=digitalRead(5);
d5=digitalRead(6);
d6=digitalRead(7);
d7=digitalRead(8); //decimal number '7'

//decimal input 0, binary output 000
if (d1==0 & d2==0 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0){
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
  digitalWrite(12,LOW);
  }

//decimal input 1, binary output 001  
else if (d1==1 & d2==0 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0){ 
  digitalWrite(10,LOW);
  digitalWrite(11,LOW);
  digitalWrite(12,HIGH);
  }

//decimal input 2, binary output 010
else if (d2==1 & d3==0 & d4==0 & d5==0 & d6==0 & d7==0){ //since it is a priority encoder, it doesnt matter what the input d1 is
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
  digitalWrite(12,LOW);
  }

//decimal input 3, binary output 011
else if (d3==1 & d4==0 & d5==0 & d6==0 & d7==0){
  digitalWrite(10,LOW);
  digitalWrite(11,HIGH);
  digitalWrite(12,HIGH);
  }
//decimal input 4, binary output 100
else if (d4==1 & d5==0 & d6==0 & d7==0){
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);
  digitalWrite(12,LOW);
  }

//decimal input 5, binary output 101  
else if (d5==1 & d6==0 & d7==0){
  digitalWrite(10,HIGH);
  digitalWrite(11,LOW);
  digitalWrite(12,HIGH);
  }

//decimal input 6, binary output 110  
else if (d6==1 & d7==0){
  digitalWrite(10,HIGH);
  digitalWrite(11,HIGH);
  digitalWrite(12,LOW);
  }

//decimal input 7, binary output 111
else if (d7==1){
  digitalWrite(10,HIGH);
  digitalWrite(11,HIGH);
  digitalWrite(12,HIGH);
  }
  
}
