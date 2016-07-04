int T=0;

//assume initial outputs
int Q=0;
int Qbar=1;

int temp=0;

int TPin=5;
int QPin=9;
int QbarPin=10;
int clockPin=2; //external clock

void setup() {
  // put your setup code here, to run once:

pinMode(TPin,INPUT); //T
pinMode(clockPin,INPUT); //clock

pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT);//Qbar

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
if (Q==0){digitalWrite(QPin,LOW); digitalWrite(QbarPin,HIGH); delay(100);}
if (Q==1){digitalWrite(QPin,HIGH); digitalWrite(QbarPin,LOW); delay(100);}

if(digitalRead(clockPin)==HIGH){  //this will execute only when clock input is high i.e. positive level
  T=digitalRead(TPin);
  
  
  //toggle state 
  if(T==1){
    temp=Q;
    Q=Qbar;
    Qbar=temp;
    }
}
    

}
