import com.leapmotion.leap.*;
void setup(){
  size(500, 500, P3D); 
}
float r=0;
void draw(){
  background(0);
  Controller controller = new Controller();
  Frame frame = controller.frame();
  Hand hand = frame.hands().frontmost();
  Arm arm = hand.arm();
  String desc = arm.toString();
  drawCylinder(20,10);
  translate(mouseX, mouseY,0);
  rotate(r);
  r+=0.1;
  box(30);
}

void drawCylinder(int sides, float r)
{
    float angle = 360 / sides;
    beginShape();
    for (int i = 0; i < sides; i++) {
        float x = cos( radians( i * angle ) ) * r;
        float y = sin( radians( i * angle ) ) * r;
        vertex( x, y );        
    }
    endShape(CLOSE);
} 
