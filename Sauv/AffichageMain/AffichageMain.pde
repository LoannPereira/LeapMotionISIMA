import java.awt.*;
import java.awt.event.*;
import com.leapmotion.leap.*;

//Leap Motion
Controller controller;
com.leapmotion.leap.Frame frame;
HandList hands;

//calibration
static int[] cali;

boolean isCali = false;
boolean isHand = true;
int coefZ=-2;
//affichage mains
ArrayList<Integer> ids = new ArrayList<Integer>();
ArrayList<Integer> oldsIds = new ArrayList<Integer>();
ArrayList<Integer> colors = new ArrayList<Integer>();
ArrayList<Integer> oldsColors = new ArrayList<Integer>();
FingerList fl= new FingerList();
int handsCount;


void setup() {
  size(1000, 700, P3D);

  
  // Leap Motion
  controller = new Controller();
  frame = controller.frame();

  //calibration (détermination de topLeft et bottomRight)
  hands = frame.hands();
  while (hands.isEmpty()) {
    delay(100);
    frame = controller.frame();
    hands = frame.hands();
  }
  cali = calibration();
  while (cali[0] == -1) cali = calibration();
}

void draw() {
  background(0);
  lights();
  noStroke();

  //Leap Motion
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
     Hand_D h = new Hand_D(hands.get(i), cali,oldsColors.get(i));
     colors.add(h.getColor());
     h.drawHand();
   }
   else {
    Hand_D h = new Hand_D(hands.get(i), cali);
    colors.add(h.getColor());
    h.drawHand();
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

void keyPressed() {
  switch(key) {
  case ESC:
    exit();
    break;
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

int[] calibration() {
  PVector topLeft = new PVector();
  PVector bottomRight = new PVector();
  
  frame = controller.frame();
  hands = frame.hands();
  
  topLeft.x = hands.frontmost().wristPosition().getX();
  topLeft.y = hands.frontmost().wristPosition().getY();
  bottomRight.x = hands.frontmost().wristPosition().getX();
  bottomRight.y = hands.frontmost().wristPosition().getY();
  int retour[] = new int[4];
  retour[0] = -1;

  print("La calibration va commencer dans 3 secondes\n");
  for (int i = 0; i < 3; i++) {
    print(i,"\n");
    delay(1000*i);
  }

  print("Début de la calibration pendant 5 sec\n");
  thread("rebour");

  while (isCali != true && !hands.isEmpty()) {
    if (topLeft.x > hands.frontmost().wristPosition().getX()) {
      topLeft.x = hands.frontmost().wristPosition().getX();
    }
    if (topLeft.y > hands.frontmost().wristPosition().getY()) {
      topLeft.y = hands.frontmost().wristPosition().getY();
    }
    if (bottomRight.x < hands.frontmost().wristPosition().getX()) {
      bottomRight.x = hands.frontmost().wristPosition().getX();
    }
    if (bottomRight.y < hands.frontmost().wristPosition().getY()) {
      bottomRight.y = hands.frontmost().wristPosition().getY();
    }
    frame = controller.frame();
    hands = frame.hands();
  }

  if (isHand != true) {
    print("Problème de calibration. Redémarrer le programme\n");
    print("Nouvelle essai\n");
    return cali;
  } else
  {
    print("Top left X : ", topLeft.x, "\n");
    print("Top left Y : ", topLeft.y, "\n");
    print("BottomRight X : ", bottomRight.x, "\n");
    print("BottomRight Y : ", bottomRight.y, "\n");
    retour[0]=(int)topLeft.x;
    retour[1]=(int)bottomRight.x;
    retour[2]=(int)topLeft.y;
    retour[3]=(int)bottomRight.y;
    return retour;
  }
}

void rebour() {
  for (int i = 1; i <=5; i++) {
    delay(1000);
    print("il reste encore ", 5-i, "sec\n");
  }
  isCali = true;
}
