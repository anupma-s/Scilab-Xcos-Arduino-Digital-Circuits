int temp1=0;
int temp2=0;
int temp3=0;

int pinstate0=0; //enable or clock pulse for FF1, FF1 gives LSB of output
int lastpinstate0=0;

int pinstate1=0; // Q of FF1 & enable or clock pulse for FF2, FF2 gives middle bit of output
int lastpinstate1=0;

int pinstate2=0; // Q of FF2 & enable or clock pulse for FF3, FF3 give MSB of output
int lastpinstate2=0;

int pinstate3=0; // Q of FF3
int lastpinstate3=0;




void setup() {
  // put your setup code here, to run once:

//input pin
pinMode(5,INPUT);

//output pins
pinMode(9,OUTPUT); //LSB
pinMode(10,OUTPUT); //middle bit
pinMode(11,OUTPUT); //MSB

Serial.begin(9600);

}

void loop() {
  // put your main code here, to run repeatedly:
if (pinstate1==0){digitalWrite(9,LOW);delay(100);}else if(pinstate1==1){digitalWrite(9,HIGH);delay(100);} //LSB
if (pinstate2==0){digitalWrite(10,LOW);delay(100);}else if(pinstate2==1){digitalWrite(10,HIGH);delay(100);} //middle bit
if (pinstate3==0){digitalWrite(11,LOW);delay(100);}else if(pinstate3==1){digitalWrite(11,HIGH);delay(100);} //MSB
 
pinstate0=digitalRead(5); //reads the state of clock
  
  //negative edge of clock pulse to FF1
  if(pinstate0!=lastpinstate0){
    if(pinstate0==0){                   
        if(pinstate1==0){pinstate1=1;}      //toggling the state 
        else{pinstate1=0;}
    }
    else {}
    delay(50);
    }
    lastpinstate0=pinstate0;
    
    //negative edge of clock pulse to FF2
    if(pinstate1!=lastpinstate1){
    if(pinstate1==0){
        if(pinstate2==1){pinstate2=0;}        //toggling the state
        else if(pinstate2==0){pinstate2=1;}
    }
    else {}
    delay(50);
    }
    lastpinstate1=pinstate1;
    
    //negative edge of clock pulse to FF3
    if(pinstate2!=lastpinstate2){
    if(pinstate2==0){
        if (pinstate3==1){pinstate3=0;}          //toggling the state
        else if(pinstate3==0){pinstate3=1;}
    }
    else {}   
    delay(50);
    }
     lastpinstate2=pinstate2;
    
    Serial.print("pin0="); Serial.println(pinstate0);
    Serial.print("Q3="); Serial.println(pinstate3);
    Serial.print("Q2="); Serial.println(pinstate2);
    Serial.print("Q1="); Serial.println(pinstate1);
  
}

