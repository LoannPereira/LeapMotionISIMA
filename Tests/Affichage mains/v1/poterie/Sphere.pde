class Sphere {
  int detail;
  float rayon;
  PVector[][] globe;
  color colorS;
  float x,y,z;
  
  Sphere (int detail, int rayon, color colorS, float x, float y, float z)
  {
    this.detail = detail;
    this.rayon = rayon;
    this.colorS = colorS;
    this.x = x;
    this.y = y;
    this.z = z;
    globe = new PVector[rayon+1][rayon+1];
  }
  
  void move(float x, float y, float z){
    this.x = x;
    this.y = y;
    this.z = z;
  }
  
  void changeRandRay(){
    this.rayon+=random(-5,5);
  }
  
  float getX(){
   return this.x;
  }
  
  float get(){
   return this.x;
  }
  
  float getZ(){
   return this.x;
  }
  
  void changeRandColor(){ 
      this.colorS=color(random(0,255),random(0,255),random(0,255));
  }
  
  void drawSphere(){
    noStroke();
    fill(colorS);
     for (int i = 0; i <= rayon; i++){
       float lat = map(i, 0, rayon, 0, PI);
       for (int j = 0; j <= rayon; j++){
         float lon = map(j, 0, rayon, 0, TWO_PI);
     
         float x = rayon * sin(lat) * cos(lon) + this.x;
         float y = rayon * sin(lat) * sin(lon) + this.y;
         float z = rayon * cos(lat) + this.z;
         globe[i][j] = new PVector(x,y,z);
       }
     }
   
     for (int i = 0; i < rayon; i++) {
       beginShape(TRIANGLE_STRIP);
       for (int j = 0; j < rayon+1; j++) {
         PVector v1 = globe[i][j];
         vertex(v1.x, v1.y, v1.z);
         PVector v2 = globe[i+1][j];
         vertex(v2.x, v2.y, v2.z);
       }
       endShape();
     }
  }
  
}
