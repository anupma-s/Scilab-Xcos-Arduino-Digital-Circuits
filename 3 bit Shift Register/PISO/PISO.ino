//3 bit PISO shift register using D FFs

int D2=0;//MSB input
int D1=0;//middle bit input
int D0=0;//LSB input

int Q=0;
//int Qbar=1;

int pinstate=0; //clock or enable, common to all FFs
int lastpinstate=0;

int sl=0; //shift/!Load

void setup() {
  // put your setup code here, to run once:

pinMode(7,INPUT); //parallel input to FF2 (MSB)
pinMode(6,INPUT); //middle bit input
pinMode(5,INPUT); //LSB input

pinMode(3,INPUT); //Shift/!Load

pinMode(2,INPUT); //clock or enable to FF2,FF1,FF0

pinMode(9,OUTPUT); //Q0

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
if (D0==0){digitalWrite(9,LOW);} else {digitalWrite(9,HIGH);}delay(100); //Serial output

sl=digitalRead(3); //reads the state of Shift/!Load
pinstate=digitalRead(2); //reads the state of clock



//clock is common for all FFs thus only 1 if statement is required for detecting positive edge of clock

  //positive edge
 if (pinstate!=lastpinstate){
  if(pinstate==HIGH){
          
    
if (sl==0){ //Parallel load mode
  //Reads and stores the parallel load
  D2=digitalRead(7); //MSB
  D1=digitalRead(6); //middle bit
  D0=digitalRead(5); //LSB
}

if (sl==1){ //Serial shift mode
    //Shifts the bits serially
   //FF0
      if (D0==0){
        Q=0;
        }
      else {
        Q=1;
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
     D2=0;
    }
           
  
   }
    delay(50);
 
      } 
     lastpinstate=pinstate;  
}
