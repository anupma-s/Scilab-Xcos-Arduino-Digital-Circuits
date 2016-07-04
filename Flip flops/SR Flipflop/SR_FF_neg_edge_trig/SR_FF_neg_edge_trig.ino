int S=0;
int R=0;
int Q=0;
int Qbar=1;
//assuming initially Q=0 & Qbar=1;
int pinstate=0;//read the state of clockPin
int lastpinstate=0;

int SPin=5;
int RPin=6;

int QPin=9;
int QbarPin=10;

int clockPin=2;//external clock

void setup() {
  // put your setup code here, to run once:
pinMode(SPin,INPUT); //S
pinMode(RPin,INPUT); //R

pinMode(clockPin,INPUT);//clock or enable

pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT);//Qbar

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:

if (Q==0){digitalWrite(QPin,LOW);}
if(Qbar==1){digitalWrite(QbarPin,HIGH);delay(100);}
if(Q==1){digitalWrite(QPin,HIGH);}
if(Qbar==0){digitalWrite(QbarPin,LOW);delay(100);}

pinstate=digitalRead(clockPin);

if(pinstate!=lastpinstate){
  if(pinstate==LOW){
    S=digitalRead(SPin);
    R=digitalRead(RPin);

      if (S==0 & R==1){
        Q=0;
        Qbar=1;}
        
      else if (S==1 & R==0){
        Q=1;
        Qbar=0;}
        
      else if (S==1 & R==1){
          Q=0;
          Qbar=0;}
          
          }
          delay(50);
          }
          lastpinstate=pinstate;
    
}

