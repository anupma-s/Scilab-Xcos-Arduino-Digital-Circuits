int i=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
pinMode(5,INPUT);
pinMode(9,OUTPUT);

    
}

void loop() {
  // put your main code here, to run repeatedly:
i=digitalRead(5); //Reads state of input pin 5
if (i==0){
  digitalWrite(9,HIGH); //gives output to pin 9 as HIGH
  }
else {
  digitalWrite(9,LOW);
  }
  Serial.println(i);
}
