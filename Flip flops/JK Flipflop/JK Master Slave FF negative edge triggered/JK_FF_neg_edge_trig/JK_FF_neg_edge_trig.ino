
int J=0;
int K=0;
int S=0;
int R=1; //since we assume initially Qbar=1

int pre=0;
int clr=0;

int pinstate=0; //clock
int lastpinstate=0;

int Q=0;
int Qbar=1;
//assuming initially Q=0 & Qbar=1

int temp=0;

int JPin=5;
int KPin=6;

int QPin=9;
int QbarPin=10;

int clockPin=2;

int prePin=3; //Preset
int clrPin=4; //Clear
//Preset and clear are active low inputs


void setup() {
  // put your setup code here, to run once:
pinMode(JPin,INPUT); //J
pinMode(KPin,INPUT); //K
pinMode(clockPin,INPUT); //enable or clock(provided externally)

pinMode(QPin,OUTPUT); //Q
pinMode(QbarPin,OUTPUT); //Qbar

Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
if (Q==0){digitalWrite(QPin,LOW); digitalWrite(QbarPin,HIGH); delay(100);}
if (Q==1){digitalWrite(QPin,HIGH); digitalWrite(QbarPin,LOW); delay(100);}

pre=digitalRead(prePin);
clr=digitalRead(clrPin);

if(pre==0 & clr==1){
  Q=1;
}
else if (pre==1 & clr==0){
  Q=0;
}
else if (pre==1 & clr==1){
  
  pinstate=digitalRead(clockPin); //external clock or enable
  
  if(pinstate!=lastpinstate){
    
     if(pinstate==LOW){ 
         J=digitalRead(JPin);
          K=digitalRead(KPin);
        
        if (J==0 & K==1){
          //digitalWrite(9,LOW);
          Q=0;
          //digitalWrite(10,HIGH);
          Qbar=1;
          //delay(100);
          
          }
          
        else if (J==1 & K==0){
          //digitalWrite(9,HIGH);
          Q=1;
          //digitalWrite(10,LOW);
          Qbar=0;
          //delay(100);
          
          }
        
        // toggle state  
       else if(J==1 & K==1){
          
            temp=Q;
            Q=Qbar;
            Qbar=temp;
            
         }
      
                
          
          }
          
          delay(50);
         
    
  
  }
  lastpinstate=pinstate;
  }
 
 }
