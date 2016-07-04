//3 bit SISO shift register using D FFs
//in a SISO shift register, input is given to the MSB, it shifts rightwards with positive clock pulses and output is seen at LSB

int D2=0; //input to FF2, given by user
int D1=0; //input to FF1, output of FF2
int D0=0; //input to FF0, output of FF1

int Q=0; //output of FF0 (LSB) i.e. serial output


int pinstate=0; //clock or enable, common to all FFs
int lastpinstate=0;

void setup() {
  // put your setup code here, to run once:

pinMode(5,INPUT); //Serial input to FF2
pinMode(2,INPUT); //clock or enable to FF2,FF1,FF0

pinMode(9,OUTPUT); //Q, data out


Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
  
if (D0==0){digitalWrite(9,LOW); delay(100);}
if (D0==1){digitalWrite(9,HIGH); delay(100);}

pinstate=digitalRead(2); //read the state of clock

//clock is common for all FFs thus only 1 'if statement' is required for detecting positive edge of clock for all FFs

  //negative edge
 if (pinstate!=lastpinstate){
  if(pinstate==HIGH){
     

    //order of FFs: FF2-FF1-FF0-serial output    
   //FF0 (LSB FF, i.e. third FF)
      if (D0==0){
        Q=0;
        }
      else {
        Q=1;
        }
       
   //FF1   (middle bit FF i.e. second FF)
      if (D1==0){
        D0=0;
        }
      else {
        D0=1;
        }
    
  //FF2 (MSB FF i.e first FF)
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
