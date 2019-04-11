class Sphere {
  int detail, rayon;
  PVector[][] globe;
  color colorS;
  PVector centre;

  Sphere(int detail, int rayon, color colorS, PVector centre) {
    this.detail = detail;
    this.rayon = rayon;
    this.colorS = colorS;
    this.centre = centre;
    globe = new PVector[rayon+1][rayon+1];
  }

  Sphere(int detail, int rayon, PVector centre) {
    this.detail = detail;
    this.rayon = rayon;
    this.colorS=color(random(0, 255), random(0, 255), random(0, 255));
    this.centre = centre;
    globe = new PVector[rayon+1][rayon+1];
  }

  float getX() {
    return this.centre.x;
  }

  float getY() {
    return this.centre.y;
  }

  float getZ() {
    return this.centre.z;
  }

  void move(PVector centre)
  {
    this.centre.x = centre.x;
    this.centre.y = centre.y;
    this.centre.z = centre.z;
  }

  void changeRandRay() {
    this.rayon+=(int)random(-this.rayon, this.rayon);
    this.globe = new  PVector[this.rayon+1][this.rayon+1];
  }

  void changeRandColor() { 
    this.colorS=color(random(0, 255), random(0, 255), random(0, 255));
  }

  void drawSphere() {
    noStroke();
    fill(colorS);
    for (int i = 0; i <= rayon; i++) {
      float lat = map(i, 0, rayon, 0, PI);
      for (int j = 0; j <= rayon; j++) {
        float lon = map(j, 0, rayon, 0, TWO_PI);

        float x = rayon * sin(lat) * cos(lon) + this.centre.x;
        float y = rayon * sin(lat) * sin(lon) + this.centre.y;
        float z = rayon * cos(lat) + this.centre.z;
        globe[i][j] = new PVector(x, y, z);
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
