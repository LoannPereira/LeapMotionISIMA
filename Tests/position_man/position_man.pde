import java.awt.*;
import java.awt.event.*;
import com.leapmotion.leap.*;

Controller controller;
com.leapmotion.leap.Frame frame;
HandList hands;

void setup() {
  size(300, 300, P3D);

}

void draw(){
  background(0);
  lights();
  noStroke();
  controller = new Controller();
  frame = controller.frame();
  hands = frame.hands();
  text("X= "+hands.frontmost().wristPosition().getX(),10,10);
  text("Y= "+hands.frontmost().wristPosition().getY(),10,30);
  
}
