class Main {
  Sphere paume;
  color couleurM;
  
 Main(color couleurM, int xPaume,int yPaume,int zPaume){
   this.couleurM = couleurM;
   paume = new Sphere(50, 50, couleurM, xPaume, yPaume, zPaume);
 }
 
 void drawMain(){
   drawPaume();
 }
 
 void drawPaume(){
   paume.drawSphere();
 }
 
}
