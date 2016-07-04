//3 bit PIPO shift register using D FFs

int D2=0; //input to MSB FF2
int D1=0; //D1=Q2, input to middle bit FF1, output of FF2 (MSB)
int D0=0; //D0=Q1, input to LSB FF0, output of FF1 (middle bit)
int Q0=0; //output of FF0 (LSB)

int pinstate=0; //clock or enable, common to all FFs
int lastpinstate=0;

void setup() {
  // put your setup code here, to run once:

pinMode(5,INPUT); //parallel i/p FF0 (LSB)
pinMode(6,INPUT); //parallel i/p FF1 (middle bit)
pinMode(7,INPUT); //parallel i/p FF2 (MSB)

pinMode(2,INPUT); //clock or enable to FF2,FF1,FF0

pinMode(9,OUTPUT); //Q0 = LSB 
pinMode(10,OUTPUT); //Q1 = middle bit
pinMode(11,OUTPUT); //Q2 = MSB


Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
if (Q0==0){digitalWrite(9,LOW);} else {digitalWrite(9,HIGH);}delay(100); //LSB
if (D0==0){digitalWrite(10,LOW);} else {digitalWrite(10,HIGH);}delay(100); //middle bit
if (D1==0){digitalWrite(11,LOW);} else {digitalWrite(11,HIGH);}delay(100); //MSB

pinstate=digitalRead(2); //read the state of clock

//clock is common for all FFs thus only 1 if statement for detecting positive edge of clock

 if (pinstate!=lastpinstate){
  if(pinstate==HIGH){
    
    D0=digitalRead(5); //LSB input to FF0  
    D1=digitalRead(6); //middle bit input to FF1
    D2=digitalRead(7); //MSB input to FF2

    //order of FFs: FF2-FF1-FF0
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
      
    
    }
           
   delay(50);
   }
 lastpinstate=pinstate;
       
       
}
