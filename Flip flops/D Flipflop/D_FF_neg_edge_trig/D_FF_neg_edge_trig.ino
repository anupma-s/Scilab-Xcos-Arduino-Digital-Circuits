int D=0;

int Q=0;
int Qbar=1;

int pinstate=0;
int lastpinstate=0;

int QPin=9; //output Q is obtained from this pin
int QbarPin=10; //output Qbar is obtained from this pin

int DPin=5; //input D is given to this pin

int clockPin=2; //external clock is given to this pin

void setup() {
  // put your setup code here, to run once:

pinMode(DPin,INPUT); //D
pinMode(clockPin,INPUT); //clock or enable

pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT);//Qbar

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
if (Q==0){digitalWrite(QPin,LOW); digitalWrite(QbarPin,HIGH); delay(100);}
if (Q==1){digitalWrite(QPin,HIGH); digitalWrite(QbarPin,LOW); delay(100);}

pinstate=digitalRead(clockPin);

if (pinstate!=lastpinstate){
  if(pinstate==LOW){
    D=digitalRead(DPin);

    if (D==0){
      Q=0;
      }
      
    else {
      Q=1;
      }
      }
      delay(50);
      }
      lastpinstate=pinstate;


}
