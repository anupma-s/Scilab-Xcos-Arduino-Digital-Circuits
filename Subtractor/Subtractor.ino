int fsnot=0; //output of not gate of fisrt half subtractor
int fsdiff=0; //first half subtractor difference
int fsb=0; //first half subtractir borrow out
int ssnot=0; //second half subtractor not
int ssand=0; //second half subtractor and
int A=0; //input
int B=0; //input
int Bin=0; //Borrow in

void setup() {
  // put your setup code here, to run once:
Serial.begin(9600);
pinMode(3,INPUT); //Borrow in
pinMode(5,INPUT); //input A
pinMode(6,INPUT); //input B
pinMode(9,OUTPUT); //Output: Difference
pinMode(10,OUTPUT); //Output: Borrow out
}

void loop() {
  // put your main code here, to run repeatedly:
A=digitalRead(5); //Reads input given to pin 5 (iinput A)
B=digitalRead(6);
Bin=digitalRead(3);

//As according to the logic circuit of Full Subtractor

//First half subtractor

  //difference
  //A XOR B
  if (A==0 & B==0){
    fsdiff=0;
    }
  else if (A==1 & B==1) {
    fsdiff=0;
    }
    else{
      fsdiff=1;
      }
  
  //Borrow out
  //A NOT
  if (A==0){
    fsnot=1;
    }
  else {
    fsnot=0;
    }
   
   //B AND fsnot 
  if (B==1 & fsnot==1){
    fsb=1;
    }
  else {
    fsb=0;
    }


//Second half subtractor

  //Final Difference
  //fsdiff XOR Bin
  if (fsdiff==0 & Bin==0){
  digitalWrite(9,LOW);
  }
  else if (fsdiff==1 & Bin==1) {
  digitalWrite(9,LOW);
  }
  else{
    digitalWrite(9,HIGH);
    }
    
   //Final Borrow out
   //fsdiff NOT
    if (fsdiff==0){
    ssnot=1;;
    }
  else {
    ssnot=0;
    }
   
   //ssnot AND Bin 
   if (ssnot==1 & Bin==1){
     ssand=1;  
    }
    else {
      ssand=0;
    }
    
    //ssand OR fsb
    if (ssand==0 & fsb==0){
  digitalWrite(10,LOW);
  }
else {
  digitalWrite(10,HIGH);
  }


}
