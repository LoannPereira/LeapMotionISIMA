class Hand_D {
  Sphere palm;
  color colorH;
  int id;
  PVector offset = new PVector();
  Finger_D[] fl = new Finger_D[5];
  int coefZ=-3;


  Hand_D(Hand h, color colorH) 
  {
    this.colorH=colorH;
    this.id=h.id();
    float x = h.palmPosition().getX();
    float y = h.palmPosition().getY();
    float z = h.palmPosition().getZ();
     x = zoom*(map(x, -150, 150, 0, width));
    y = zoom*(height-map(y, 65, 275, 0, height));
    z -=zoom1;
    palm = new Sphere(30, 25, colorH, new PVector(x, y, z));
    int i=0;
    for (Finger fi : h.fingers()) {
      fl[i]=new Finger_D(fi, colorH, offset);
      i++;
    }
  }

  Hand_D(Hand h) 
  {
    this.colorH = color(random(0, 255), random(0, 255), random(0, 255));
    this.id=h.id();
    float x = h .palmPosition().getX();
    float y = h.palmPosition().getY();
    float z = h.palmPosition().getZ();
    x = zoom*(map(x, -150, 150, 0, width));
    y = zoom*(height-map(y, 65, 275, 0, height));
    z -=zoom1;
    palm = new Sphere(30, 15, colorH, new PVector(x, y, z));
    int i =0;
    for (Finger fi : h.fingers()) {
      fl[i]=new Finger_D(fi, colorH, offset);
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
  
  void setColort(color col){
    this.colorH=col;
  }

  void drawHand() {
    drawPalm();
    drawfingers();
    //affichDistInterDoigts();
  }

  void drawPalm() {
    palm.drawSphere();
  }
  
  void affichDistInterDoigts(){ 
      for(int i=1;i<4;i++){
        print(" ||entre doigt[0] doigt["+i+"]= "+fl[0].joints[3].dist(fl[i+1].joints[7]));
    }
    print(" ||entre doigt[0] doigt[4]= "+fl[0].joints[3].dist(fl[4].joints[7]));
    print("\n");
    
  }

  void drawfingers() {
    for (Finger_D fi : fl) {
      fi.drawFinger();
    }
  }
}
