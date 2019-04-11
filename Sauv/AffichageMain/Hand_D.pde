class Hand_D {
  Sphere palm;
  color colorH;
  int id;
  PVector offset = new PVector();
  Finger_D[] fl = new Finger_D[5];
  int coefZ=-2;


  Hand_D(Hand h, int[] cali, color colorH) 
  {
    this.colorH=colorH;
    this.id=h.id();
    float x = h .palmPosition().getX();
    float y = cali[3]-h.palmPosition().getY();
    float z = coefZ*h.palmPosition().getZ();
    
    x = map(x, cali[0], cali[1], 0, cali[1] - cali[0]);
    y = map(y, cali[2], cali[3], 0, cali[3] - cali[2]);
    
    offset.x = map(x, 0, cali[1] - cali[0], 0, width);
    offset.y = map(y, 0, cali[3] - cali[2], 0, height);
    
    // mise à l'échelle
    x += offset.x;
    y += offset.y;
    palm = new Sphere(30, 15, colorH, new PVector(x, y, z));
    int i=0;
    for (Finger fi : h.fingers()) {
      fl[i]=new Finger_D(fi, cali, colorH, offset);
      i++;
    }
  }

  Hand_D(Hand h, int[] cali) 
  {
    this.colorH = color(random(0, 255), random(0, 255), random(0, 255));
    this.id=h.id();
    float x = h .palmPosition().getX();
    float y = cali[3]-h.palmPosition().getY();
    float z = coefZ*h.palmPosition().getZ();
    
    x = map(x, cali[0], cali[1], 0, cali[1] - cali[0]);
    y = map(y, cali[2], cali[3], 0, cali[3] - cali[2]);
    
    offset.x = map(x, 0, cali[1] - cali[0], 0, width);
    offset.y = map(y, 0, cali[3] - cali[2], 0, height);
    
    // mise à l'échelle
    x += offset.x;
    y += offset.y;
    palm = new Sphere(30, 15, colorH, new PVector(x, y, z));
    int i =0;
    for (Finger fi : h.fingers()) {
      fl[i]=new Finger_D(fi, cali, colorH, offset);
      i++;
    }
  }

  void movePalm(PVector v)
  {
    this.palm = new Sphere(50, 50, colorH, v);
    //this.float move(v);
  }

  int getId() {
    return this.id;
  }

  color getColor() {
    return this.colorH;
  }

  void drawHand() {
    drawPalm();
    drawfingers();
  }

  void drawPalm() {
    palm.drawSphere();
  }

  void drawfingers() {
    for (Finger_D fi : fl) {
      fi.drawFinger();
    }
  }
}
