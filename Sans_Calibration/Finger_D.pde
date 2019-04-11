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
      xp = zoom*(map(xp, -150, 150, 0, width));
      yp = zoom*(height-map(yp, 65, 275, 0, height));
      float xn =bone.nextJoint().getX();
      float yn= bone.nextJoint().getY();
      xn = zoom*(map(xn, -150, 150, 0, width));
      yn= zoom*(height-map(yn, 65, 275, 0, height));
      joints[i]=new PVector(xp,yp,bone.prevJoint().getZ());
      joints[i+4]=new PVector(xn,yn,bone.nextJoint().getZ());
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

  void drawFingerRot() {
    for(int i=0;i<4;i++){
      sl[i].drawSphere();
     beginShape();
      vertex(rotation[i].x-largeur/2, rotation[i].y,rotation[i].z);
      vertex(rotation[i].x+largeur/2, rotation[i].y,rotation[i].z);
      vertex(rotation[i+4].x+largeur/2, rotation[i+4].y,rotation[i+4].z);
      vertex(rotation[i+4].x-largeur/2, rotation[i+4].y,rotation[i+4].z);
     endShape(CLOSE);
    }
  sl[7].drawSphere();
  }
  
  void drawFinger() {
    for(int i=0;i<4;i++){
     sl[i].drawSphere();
     beginShape();
      vertex(sl[i].getX(), sl[i].getY(),sl[i].getZ());
      vertex(sl[i].getX()+largeur, sl[i].getY(),sl[i].getZ());
      vertex(sl[i+4].getX()+largeur, sl[i+4].getY(),sl[i].getZ());
      vertex(sl[i+4].getX(), sl[i+4].getY(),sl[i].getZ());
     endShape(CLOSE);
    }
    sl[7].drawSphere();
    
    
  }

  void afficherTailleEtPos(Bone bo, int i){
    print("Taille doigt[",i,"]: ",bo.length(),"  ");
    print("X de [",i,"]: ",joints[i].x);
    print(" X de [",i+4,"]: ",joints[i+4].x);
    
  }
  
  float lenghtBone(Bone bo){
    print("Taille doigt(en mm):",bo.length() ,"\n");
    return bo.length();
  }
}
