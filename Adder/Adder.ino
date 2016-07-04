int A=0;//input 
int B=0;//input 
int P=0; //Pi
int G=0; //Gi
int C=0;//input
int temp=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
pinMode(5,INPUT); //input A
pinMode(6,INPUT); //input B
pinMode(3,INPUT); //Carry in
pinMode(9,OUTPUT);//sum
pinMode(10,OUTPUT);//carry

}

void loop() {
  // put your main code here, to run repeatedly:
A=digitalRead(5);
B=digitalRead(6);
C=digitalRead(3);

//As according to the logic gates circuit of Adder
//to get Pi : XOR of A & B
if (A==0 & B==0){
  P=0;
  }
else if (A==1 & B==1) {
  P=0;
  }
  else{
    P=1;
    }
    
//to get Gi : AND of A & B   
if (A==1 & B==1){
  G=1;
 // delay(5);
  }
else {
  G=0;
 // delay(5);
  }

//to get Sum : XOR of Pi & Cin
if (P==0 & C==0){
  digitalWrite(9,LOW); //Logic 0
  }
else if (P==1 & C==1) {
  digitalWrite(9,LOW); //Logic 0
  }
  else{
    digitalWrite(9,HIGH); //Logic 1
    }
 
 //to get Carry out (Cout)
 //AND of Pi & Cin
if (P==1 & C==1){
  temp=1;
  //delay(5);
  }
else {
  temp=0;
 // delay(5);
  } 
 
 //OR of Gi & temp
 if (G==0 & temp==0){
  digitalWrite(10,LOW);
  }
else {
  digitalWrite(10,HIGH);
  }
}
