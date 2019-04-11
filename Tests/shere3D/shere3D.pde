 import java.awt.*;
import java.awt.event.*;

  float rotX= 0;
  float rotY = 0;
  Point p = getGlobalMouseLocation();

void setup(){
  size(1000, 1000, P3D); 
}
  
void draw() {
  background(0);
  translate(width/2, height/2, 0);
  p= getGlobalMouseLocation();
  rotX=-(float)p.getX() * 0.005;
  rotY=-(float)p.getY() * 0.005;

  rotateX(rotY);
  rotateY(rotX);
  //sphereDetail((int)p.getX()/60);
  sphere(250);
}

void keyPressed() {

}

Point getGlobalMouseLocation() {
 // java.awt.MouseInfo
  PointerInfo pointerInfo = MouseInfo.getPointerInfo();
  Point p = pointerInfo.getLocation();
  return p;  
}
