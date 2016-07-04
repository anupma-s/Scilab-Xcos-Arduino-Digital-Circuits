//inputs
int i0=0;
int i1=0;
int i2=0;
int i3=0;

//select lines
int a=0;
int b=0;

void setup() {
  // put your setup code here, to run once:
pinMode(2,INPUT); //input i0 (LSB)
pinMode(3,INPUT); //input i1
pinMode(4,INPUT); //input i2
pinMode(5,INPUT); //input i3 (MSB)

pinMode(6,INPUT); // select line A (MSB)
pinMode(7,INPUT); // select line B (LSB)

pinMode(9,OUTPUT); //output Q

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
i0=digitalRead(2); //reads input 1
i1=digitalRead(3 ; //reads input 2
i2=digitalRead(4); //reads input 3
i3=digitalRead(5); //reads input 4

a=digitalRead(6); //reads select line A
b=digitalRead(7); //reads select line B

if (a==0 & b==0){
  //Selects input i0, gives output same as i0
  if (i0==0){
    digitalWrite(9,LOW);
    }
  else {
    digitalWrite(9,HIGH);
    }
 }
 
 if (a==0 & b==1){
   //Selects input i1, gives ouput same as i1
   if (i1==0){
    digitalWrite(9,LOW);
    }
  else {
    digitalWrite(9,HIGH);
    }
 }
 
 if (a==1 & b==0){
   //Selects input i2, gives ouput same as i2
   if (i2==0){
    digitalWrite(9,LOW);
    }
  else {
    digitalWrite(9,HIGH);
    }
 }
 
  if (a==1 & b==1){
   //Selects input i3, gives ouput same as i3
   if (i3==0){
    digitalWrite(9,LOW);
    }
  else {
    digitalWrite(9,HIGH);
    }
 }
 
 
}
