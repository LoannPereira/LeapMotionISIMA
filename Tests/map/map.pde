void setup() {
  size(600, 600);
  noStroke();
}

void draw() {
  background(0);
  float tab[];
  tab = new float[8];
  for(int i = 0; i<8 ; i++){
    tab[i]=map(mouseX,0,width,200-i*50,200+i*50);
    text("x"+i+"= "+tab[i],500,500+10*i);
    ellipse(tab[i]+100, i*50, 1+10*i, 1+10*i);  
  }
}
