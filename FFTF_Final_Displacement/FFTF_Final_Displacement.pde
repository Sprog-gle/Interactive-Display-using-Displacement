import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import gab.opencv.*;
import processing.video.*;


Capture video, video2;
OpenCV opencv, opencv2;


color strokeColour;


float xpos, ypos;
float strokeSize = 3;

float kickSize, snareSize, hatSize;


void setup() {
  fullScreen();
  video = new Capture(this, width, height);
  opencv = new OpenCV(this, width, height);
  video.start();
  opencv.startBackgroundSubtraction(5, 3, 0.5);
  
}

void draw() {
  background(0);
 //image(video2, 0, 0);  
 
  opencv.loadImage(video);
  opencv.updateBackground();
  opencv.flip(OpenCV.HORIZONTAL);
  opencv.dilate();
  opencv.erode();


  noFill();
  stroke(0,0,255);
  strokeWeight(strokeSize);
  for (Contour contour : opencv.findContours()) {
    contour.draw();
  }
}


void captureEvent(Capture c) {
  c.read();
}

color randomStrokeColour(){
  strokeColour = color(random(255),random(255),random(255));
  
  return strokeColour;
}


//void screenGradient(){

  //if(){
  //   find space on the screen? if x + y within range, will changefade colour to that.
//}
////}