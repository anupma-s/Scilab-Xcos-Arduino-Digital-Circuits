int pinstate=0;
int lastpinstate=0;
int i=0;
void setup()  {  
  // put your setup code here, to run once:
  pinMode(5,INPUT);
  
  pinMode(9,OUTPUT);     
  pinMode(10,OUTPUT);  
  pinMode(11,OUTPUT);  
 // pinMode(12,OUTPUT);
 }  
 void loop(){  
   // put your main code here, to run repeatedly:
 pinstate=digitalRead(5); 
 
 //negative edge
if(pinstate!=lastpinstate){
  if(pinstate==LOW)
    {i++;} //counter
    delay(50);
    }
    lastpinstate=pinstate;
    
   int a=i%2;      // calculate LSB   
   int b=(i/2) %2;     // calculate middle bit  
   int c=(i/4) %2;     // calculate MSB  
  // int d=(i/8) %2; //  for 4 bit counter
  
   digitalWrite(9,a);   //LSB
   digitalWrite(10,b);   
   digitalWrite(11,c);   //MSB
  // digitalWrite(12,d);  
     
      
    
   if(i>7){i=0;}
   
   //if(i>15){i=0;}
 }  
