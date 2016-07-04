int i=0;
int j=0;
void setup() {
  Serial.begin(9600);
  pinMode(5,INPUT);
pinMode(6,INPUT);
pinMode(9,OUTPUT);
  // put your setup code here, to run once:
}

void loop() {
  // put your main code here, to run repeatedly:


i=digitalRead(5); //Reads state of input pin 5
j=digitalRead(6);
if (i==1 & j==1){
  digitalWrite(9,LOW); //Gives output to pin 9 as LOW
  delay(5);
  }
else {
  digitalWrite(9,HIGH);
  delay(5);
  }
    Serial.println(i);

}
