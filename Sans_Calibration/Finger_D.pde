class Finger_D {
  Sphere sl[] = new Sphere[8];

  color colorF;
  PVector joints[] = new PVector[8];
  PVector rotation[] = new PVector[8];
  PVector offset;
  float ech;
  int largeur=20;
  Finger_D(Finger f, color colorH, PVector offset) {
    this.offset = offset;
    int i=0;
    Bone bone = null;
    for (Bone.Type boneType : Bone.Type.values()) {
      bone = f.bone(boneType);
      float xp =bone.prevJoint().getX();
      float yp= bone.prevJoint().getY();
      float zp = bone.prevJoint().getZ();
      xp = map(xp, -150, 150, 0, width);
      yp = height-map(yp, 65, 275, 0, height);
      zp-=zoom1;
      float xn = bone.nextJoint().getX();
      float yn = bone.nextJoint().getY();
      float zn = bone.nextJoint().getY();
      xn = map(xn, -150, 150, 0, width);
      yn= height-map(yn, 65, 275, 0, height);
      zn-=zoom1;
      joints[i]=new PVector(xp, yp, zp);
      joints[i+4]=new PVector(xn, yn, zn);
      //afficherTailleEtPos(bone,i);
      i++;
      //print("\n");
    }

    i=0;
    for (PVector xav : joints) {
      sl[i] = new Sphere(30, 15, colorH, xav);
      i++;
    }
  }

  void drawFinger() {
    for (int i=0; i<4; i++) {
      sl[i].drawSphere();
      
    }
    sl[7].drawSphere();
  }
  
  void drawPhalange(Sphere sl[], int i){
    beginShape();
      vertex(sl[i].getX()-largeur/2, sl[i].getY(), sl[i].getZ());
      vertex(sl[i].getX()+largeur/2, sl[i].getY(), sl[i].getZ());
      vertex(sl[i+4].getX()+largeur, sl[i+4].getY(), sl[i].getZ());
      vertex(sl[i+4].getX()-largeur/2, sl[i+4].getY(), sl[i].getZ());
      endShape(CLOSE);
  }

  void afficherTailleEtPos(Bone bo, int i) {
    print("Taille doigt[", i, "]: ", bo.length(), "  ");
    print("X de [", i, "]: ", joints[i].x);
    print(" X de [", i+4, "]: ", joints[i+4].x);
  }

  float lenghtBone(Bone bo) {
    print("Taille doigt(en mm):", bo.length(), "\n");
    return bo.length();
  }
}
