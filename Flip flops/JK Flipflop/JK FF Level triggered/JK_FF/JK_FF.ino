int J=0;
int K=0;

//assuming initial outputs
int Q=0;
int Qbar=1;

int temp=0;

int pre=0; 
int clr=0;

int JPin=5; //input J is given to pin 5
int KPin=6; // input K is given to pin 6

int QPin=9; //output Q is seen at pin 9
int QbarPin=10; //output Qbar is seen at pin 10

int prePin=3; //Preset input is given to pin 3
int clrPin=4; //Clear input is given to pin 4
//Preset and Clear are asynchronous inputs (independent of clock)

int clockPin=2; //external clock is given to pin 2

void setup() {
  // put your setup code here, to run once:
pinMode(JPin,INPUT); //J
pinMode(KPin,INPUT); //K
pinMode(clockPin,INPUT); //external clock
pinMode(prePin,INPUT); //Preset
pinMode(clrPin,INPUT); //Clear


pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT);//Qbar

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

if (Q==0){digitalWrite(QPin,LOW); digitalWrite(QbarPin,HIGH); delay(100);}
if (Q==1){digitalWrite(QPin,HIGH); digitalWrite(QbarPin,LOW); delay(100);}

J=digitalRead(JPin);
K=digitalRead(KPin);
    
pre=digitalRead(prePin);
clr=digitalRead(clrPin);
//Preset and Clear are active low inputs, i.e, flip flop functions normally when pre==HIGH & clr==HIGH

if (pre==LOW & clr==HIGH){
  Q=1;
  Qbar=0;}
else if(pre==HIGH & clr==LOW){
    Q=0;
    Qbar=1;}
else if(pre==HIGH & clr==HIGH){
  
  if(digitalRead(clockPin)==HIGH){ //Reads the input at clockPin and executes only if input is high
    
    if (J==0 & K==1){
      Q=0;
      Qbar=1;
      }
      
    if (J==1 & K==0){
      Q=1;
      Qbar=0;
     
      }
    
    // toggle state  
    if(J==1 & K==1){
      temp=Q;
      Q=Qbar;
      Qbar=temp;
      
        }
      
      
    
      }
      }
      }
