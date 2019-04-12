import peasy.*;
import peasy.org.apache.commons.math.*;
import peasy.org.apache.commons.math.geometry.*;


void setup()
{
  size(600, 600, P3D);  
  lights();
  fill(100, 200, 0);
}

void draw()
{
  background(255);
  drawCylinder(new PVector(300, 300, -100), new PVector(600, 600, -500), 30, 100);
}


void drawCylinder(PVector top, PVector bottom, int sides, float r)
{
  PVector centre = new PVector((top.x + bottom.x)/2, (top.y + bottom.y)/2, (top.z + bottom.z)/2);
    //noStroke();
  float angle = 360 / sides;
  float halfHeight = sqrt(pow((top.x - bottom.x),2) + pow((top.y - bottom.y),2) + pow((top.z - bottom.z),2));

  // draw top of the tube
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r + centre.x;
    float y = sin( radians( i * angle ) ) * r + centre.y;
    float z = -halfHeight + centre.z;
    vertex( x, y, z);
  }
  endShape(CLOSE);

  // draw bottom of the tube
  beginShape();
  for (int i = 0; i < sides; i++) {
    float x = cos( radians( i * angle ) ) * r + centre.x;
    float y = sin( radians( i * angle ) ) * r + centre.y;
    float z =  halfHeight + centre.z;
    vertex( x, y, z);
  }
  endShape(CLOSE);

  // draw sides
  beginShape(TRIANGLE_STRIP);
  for (int i = 0; i < sides + 1; i++) {
    float x = cos( radians( i * angle ) ) * r + centre.x;
    float y = sin( radians( i * angle ) ) * r + centre.y;
    float z = halfHeight + centre.z;
    vertex( x, y, z);
    z = -halfHeight + centre.z;
    vertex( x, y, z);
  }
  endShape(CLOSE);
}
