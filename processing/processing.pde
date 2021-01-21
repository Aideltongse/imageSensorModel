import processing.serial.*;
import controlP5.*;
int inf = 150;
int sup = 400;
int val = 0;
int rawVal = 0;

boolean showValues = true;

ControlP5 cp5;
String sb;
Serial myPort;
IntList intList;

int xRes = 3;
int yRes = 3;

int xStart = 0;
int yStart = 0;

int pixelSize = 50;

void setup(){
  size(720, 720);
  frameRate(30);
  myPort = new Serial(this,Serial.list()[0],9600);
  cp5 = new ControlP5(this);
  addSliders();
}

void draw() {
  intList = new IntList();
  refreshPixels();
}

void addSliders(){
  cp5.addSlider("inf")
     .setPosition(400,20)
     .setRange(0,1023)
     .setSize(200,40)
     .setMax(400);
     ;
  
  cp5.addSlider("sup")
     .setPosition(400,80)
     .setRange(0,1023)
     .setSize(200,40)
     .setMin(100)
     ;
}

void drawPixels(int xRes, int yRes, int pixelSize, int xStart, int yStart, IntList intList){
  for(int l=0; l < yRes; l++){
    for(int c=0; c<xRes; c++){
      int index = c + l*xRes;
      fill(intList.get(index));
      int xPos = c * pixelSize + xStart;
      int yPos = l * pixelSize + yStart;
      square(xPos,yPos,pixelSize);
      if(showValues == true){
       fill(0,0,255);
       text(intList.get(index),xPos + 15,yPos + 15);      
      }
    }
  }
}

void refreshPixels(){
  //while (myPort.available() > 0){
  
    sb = myPort.readStringUntil('\n');
    
    if(sb == null){
      sb = "0";
    }  else{
      String[] stringList = sb.split(",");
      if(stringList.length < xRes * yRes){ return; } //Cette ligne empeche une désynchronisation au lancement du programme (Avant c'était un break)
      for(int i=0; i<xRes * yRes; i++){
        rawVal = int(trim(stringList[i]));
        if(rawVal <= inf){
          val = 0; 
        } else if(rawVal >= sup){
          val = 255;
        } else{
          val = int(map(rawVal,inf,sup,0,255));
        }
        intList.append(val);
      }
      drawPixels(xRes,yRes,pixelSize,xStart,yStart,intList);
      intList.clear();
      //rawVal = int(trim(sb));
    }
    
  //}
  
}
