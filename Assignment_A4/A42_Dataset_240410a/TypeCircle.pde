class TypeCircle{
  // variables
  String name;
  PImage icon;
  int baseSz;
  float posX, posY;
  
  // constructor
  TypeCircle(String n, String i, int b, float x, float y){
    name = n;
    icon = loadImage(i);
    baseSz = b;
    posX = x;
    posY = y;
  }
  
  // update function
  void update(){
    // size update (work on later)
    float finalSz = baseSz;
    
    // visual creation
    noStroke();
    fill(150, 255, 150, 100);
    ellipseMode(CENTER);
    ellipse(posX, posY, finalSz, finalSz);
    imageMode(CENTER);
    image(icon, posX, posY, finalSz, finalSz);
  }
}
