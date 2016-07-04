int T=0;

int temp=0;

//assume initial states 
int Q=0;
int Qbar=1;

int pinstate=0; //indicates the state of clockPin
int lastpinstate=0;

int TPin=5;
int QPin=9;
int QbarPin=10;
int clockPin=2;


void setup() {
  // put your setup code here, to run once:

pinMode(TPin,INPUT); //T
pinMode(clockPin,INPUT); //external clock

pinMode(QPin,OUTPUT);
pinMode(QbarPin,OUTPUT);

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
if (Q==0){digitalWrite(QPin,LOW); digitalWrite(QbarPin,HIGH); delay(50);}
if (Q==1){digitalWrite(QPin,HIGH); digitalWrite(QbarPin,LOW); delay(50);}
 
pinstate=digitalRead(clockPin); //reads input given to clockPin


  
  //negative edge
  if(pinstate!=lastpinstate){
    if(pinstate==LOW){ 
      T=digitalRead(TPin); //reads input T
      if(T==1){ //when input given is high
      
      //toggle
    temp=Q;
    Q=Qbar;
    Qbar=temp; 
    }
    else {}
     
    }
    delay(50);
    
}
lastpinstate=pinstate;
    
}

