int i=0;
int j=0;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
pinMode(5,INPUT);
pinMode(6,INPUT);
pinMode(9,OUTPUT);

    
}

void loop() {
  // put your main code here, to run repeatedly:
i=digitalRead(5);
j=digitalRead(6);
if (i==0 & j==0){
  digitalWrite(9,LOW);
  }
else {
  digitalWrite(9,HIGH);
  }
  Serial.println(i);
}
