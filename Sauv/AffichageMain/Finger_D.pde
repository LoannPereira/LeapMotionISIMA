class Finger_D {
  Sphere sl[] = new Sphere[8];
  color colorF;
  PVector joints[] = new PVector[8];
  PVector offset;

  int coefZ=-2;
  
  Finger_D(Finger f, int cali[], color colorH, PVector offset) {
    this.offset = offset;
    int i=0;
    Bone bone = null;
    for (Bone.Type boneType : Bone.Type.values()) {
      bone = f.bone(boneType);
      joints[i]=new PVector(bone.prevJoint().getX(), cali[3]-bone.prevJoint().getY(),bone.prevJoint().getZ());
      joints[i+4]=new PVector(bone.nextJoint().getX(), cali[3]-bone.nextJoint().getY(),bone.nextJoint().getZ());
      i++;
    }
    //joints[3]=new PVector(bone.nextJoint().getX(), bone.nextJoint().getY(),bone.nextJoint().getZ());
    i=0;
    for (PVector xav : joints) {
      xav.z*=coefZ;
      xav.x = map(xav.x, cali[0], cali[1], 0, cali[1] - cali[0]);
      xav.y = map(xav.y, cali[2], cali[3], 0, cali[3] - cali[2]);
      
      xav.x = xav.x + this.offset.x;
      xav.y = xav.y + this.offset.y;
      
      //xav.x = map( xav.x, cali[0], cali[1], 0, width);
      //xav.y = map( cali[3]-xav.y, cali[2], cali[3], 0, height);
      sl[i] = new Sphere(30, 5, colorH, xav);
      i++;
    }
  }

  void drawFinger() {
    for(int i=0;i<4;i++){
     sl[i].drawSphere();
     beginShape();
      vertex(sl[i].getX(), sl[i].getY(),sl[i].getZ());
      vertex(sl[i].getX()+3, sl[i].getY(),sl[i].getZ());
      vertex(sl[i+4].getX()+3, sl[i+4].getY(),sl[i].getZ());
      vertex(sl[i+4].getX(), sl[i+4].getY(),sl[i].getZ());
     endShape(CLOSE);
    }
    sl[7].drawSphere();
  }
}
