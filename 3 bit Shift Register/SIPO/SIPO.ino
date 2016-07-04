//3 bit SIPO shift register using D FFs
//input by user is given to FF2 (MSB FF). It then shifts rightwards serially and is eventually lost through FF0 (LSB FF) after 3 clock pulses
//outputs of all FFs (all bits) are obtained at all instances 

int D2=0; //input by user is given to FF2 (MSB FF), output of FF2=input of FF1
int D1=0; //D1=Q2, FF1 (middle bit FF), output of FF1=input of FF0
int D0=0; //D0=Q1, FF0 (LSB FF), output of FF0 = Q0
int Q0=0; //Q=Q0

int pinstate=0; //clock or enable, common to all FFs
int lastpinstate=0;

void setup() {
  // put your setup code here, to run once:

pinMode(5,INPUT); //Serial input to FF2
pinMode(2,INPUT); //clock or enable to FF2,FF1,FF0

pinMode(9,OUTPUT); //Q0 = LSB 
pinMode(10,OUTPUT); //Q1 = middle bit
pinMode(11,OUTPUT); //Q2 = MSB


Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
if (D0==0){digitalWrite(9,LOW);} else {digitalWrite(9,HIGH);}delay(100); //LSB
if (D1==0){digitalWrite(10,LOW);} else {digitalWrite(10,HIGH);}delay(100); //middle bit
if (D2==0){digitalWrite(11,LOW);} else {digitalWrite(11,HIGH);}delay(100); //MSB

pinstate=digitalRead(2); //read the state of clock

//clock is common for all FFs thus only 1 if statement for detecting positive edge of clock

 if (pinstate!=lastpinstate){
  if(pinstate==HIGH){
     
  //order of FFs; FF2-FF1-FF0
  
   //FF0
      if (D0==0){
        Q0=0;
        }
      else {
        Q0=1;
        }
       
   //FF1   
      if (D1==0){
        D0=0;
        }
      else {
        D0=1;
        }
    
  //FF2
    if (D2==0){
      D1=0;
      }
    else {
      D1=1;
      }
      
    D2=digitalRead(5); //input is given to D of FF2 (MSB FF) 
    }
           
   delay(50);
   }
 lastpinstate=pinstate;
       
       
}
