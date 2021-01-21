
int val;
int xRes = 3;
int yRes = 3;

int outVal;
int inf = 150;
int sup = 400;

int pixelDelay = 20;
int frameDelay = 50;

int digitalPins[] = {2,3,4};
int analogPins[] = {A0,A2,A1}; //1 and 2 are inverted because i inverted two columns in my circuit while soldering
void setup() {
  Serial.begin(9600);
  setPixels(yRes);
}

void loop() {
  refreshPixels(xRes,yRes);
  
  
}

void refreshPixels(int xRes,int yRes){
  for(int l=0; l< yRes; l++){
    digitalWrite(digitalPins[l],HIGH);
    delay(5);
    for(int c=0; c<xRes; c++){
      val = analogRead(analogPins[c]);
      Serial.print(val);
      Serial.print(",");
    }
    digitalWrite(digitalPins[l],LOW);
    delay(pixelDelay);
  }
  Serial.print("\n");
  delay(frameDelay);
}

void setPixels(int yRes){
  for(int l=0; l< yRes; l++){
  pinMode(digitalPins[l],OUTPUT);
  digitalWrite(digitalPins[l],LOW);
  }
}
