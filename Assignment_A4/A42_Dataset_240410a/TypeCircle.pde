// class for the icons for each Pokemon Type tracked by the usage data
class TypeCircle{
  // variables
  String name;
  PImage icon;
  int baseSz;
  float posX, posY, dynaSzMod;
  
  // constructor
  TypeCircle(String n, String i, int b, float x, float y){
    name = n;
    icon = loadImage(i);
    baseSz = b;
    posX = x;
    posY = y;
    dynaSzMod = 0.0;
  }
  
  // update function
  void update(){
    // update size dynamically
    if(dynaSzMod < szMod){
      dynaSzMod += (szMod-dynaSzMod)/7;
    }
    if(dynaSzMod > szMod){
      dynaSzMod -= (dynaSzMod-szMod)/7;
    }
    float finalSz = baseSz*dynaSzMod;
    
    // visual creation
    noStroke();
    fill(150, 255, 150, 100);
    ellipseMode(CENTER);
    ellipse(posX, posY, finalSz, finalSz);
    imageMode(CENTER);
    image(icon, posX, posY, finalSz, finalSz);
  }
}
