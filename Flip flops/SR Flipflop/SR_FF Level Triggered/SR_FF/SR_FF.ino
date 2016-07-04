int S=0;
int R=0;
int Q=0;
int Qbar=1;
//assuming initially Q=0 & Qbar=1;
int SPin=5;
int RPin=6;

int QPin=9;
int QbarPin=10;

int clockPin=2;

void setup() {
  // put your setup code here, to run once:
//inputs
pinMode(SPin,INPUT); //S
pinMode(RPin,INPUT); //R
pinMode(clockPin,INPUT); //external clock

//outputs
pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT);//Qbar

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

if (Q==0){digitalWrite(QPin,LOW);} //Gives low output at Pin corresponding to Q
if (Q==1){digitalWrite(QPin,HIGH);}
if (Qbar==0){digitalWrite(QbarPin,LOW);}
if (Qbar==1){digitalWrite(QbarPin,HIGH);}

S=digitalRead(SPin); //reads input given to S
R=digitalRead(RPin); //reads input given to R

if(digitalRead(clockPin)==HIGH){ //this is executed only when the input at clockPin is high i.e. only during positive level of clock pulse
if (S==0 & R==1){
  Q=0;
  Qbar=1;}
  
else if (S==1 & R==0){
  Q=1;
  Qbar=0;}
  
else if (S==1 & R==1){ //We assume that this state does not occur
    Q=0;
    Qbar=0;}}
    
    
}

