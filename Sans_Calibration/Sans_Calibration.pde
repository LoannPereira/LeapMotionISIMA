import java.awt.*;
import java.awt.event.*;
import com.leapmotion.leap.*;

Controller controller;
com.leapmotion.leap.Frame frame;
HandList hands;
int handsCount;
ArrayList<Integer> ids = new ArrayList<Integer>();
ArrayList<Integer> oldsIds = new ArrayList<Integer>();
ArrayList<Integer> colors = new ArrayList<Integer>();
ArrayList<Integer> oldsColors = new ArrayList<Integer>();
FingerList fl= new FingerList();
static float zoom=1;
static float zoom1=600;

int[] alreadyPinch = new int[2];


void setup() {
  size(800, 600, P3D);
  alreadyPinch[0] = 0;
  alreadyPinch[1] = 0;

}

void draw() {
  background(0);
  lights();
  noStroke();
  //Leap Motion
  controller = new Controller();
  frame = controller.frame();

  //récupération liste de mains
  hands = frame.hands();
  handsCount = hands.count();

  if(!hands.isEmpty()){
    for(int i = 0; i < handsCount; i++){
      ids.add(hands.get(i).id());
    }
  }
  for(int i = 0; i < handsCount; i++){
   if(idExist(hands.get(i).id())){
     Hand_D h = new Hand_D(hands.get(i),oldsColors.get(i));
     if(isPinched(h) && alreadyPinch[i] == 0){
       h.setColort(color(random(0, 255), random(0, 255), random(0, 255)));
       alreadyPinch[i] = 1;
     }
     else if (!isPinched(h) && alreadyPinch[i] == 1)
     {
      alreadyPinch[i] = 0; 
     }
     h.drawHand();
     colors.add(h.getColor());
   }
   else {
    Hand_D h = new Hand_D(hands.get(i));
    if(isPinched(h) && alreadyPinch[i] == 0){
       h.setColort(color(random(0, 255), random(0, 255), random(0, 255)));
       alreadyPinch[i] = 1;
     }
     else if (!isPinched(h) && alreadyPinch[i] == 1)
     {
      alreadyPinch[i] = 0; 
     }
     h.drawHand();
     colors.add(h.getColor());
 }
  }
  for(int i = oldsIds.size() - 1; i >= 0; i--)
  {
    oldsIds.remove(i);
  }
  for(int i = oldsColors.size() - 1; i >= 0; i--)
  {
   oldsColors.remove(i); 
  }
  
  oldsIds = cloneList(ids);
  oldsColors = cloneList(colors);
  
  for(int i = ids.size() - 1; i >= 0; i--)
  {
   ids.remove(i); 
  }
  for(int i = colors.size() - 1; i >= 0; i--)
  {
   colors.remove(i); 
  }
 
  
}

ArrayList<Integer> cloneList(ArrayList<Integer> list){
 ArrayList<Integer> clone = new ArrayList<Integer>(list.size());
 for(Integer item : list) clone.add(item);
 return clone;
}

boolean idExist(int id){
  boolean retour = false;
  for(int old_id : oldsIds){
    if(old_id == id){
      retour = true;
      break;
    }
  }
  return retour;
}

boolean isPinched(Hand_D h){
  boolean retour=false;
  //int i=0;
  //for(int j=0;j<8;j++){
    print("dist entre = "+h.fl[0].joints[7].dist(h.fl[1].joints[7])+"\n");
  //}
   if(h.fl[0].joints[7].dist(h.fl[1].joints[7])<70){
     print("PINCH\n");
     retour = true;
     
   }
  return retour;
}


void keyPressed() {
  switch(key) {
  case ESC:
    exit();
    break;
  }
}
