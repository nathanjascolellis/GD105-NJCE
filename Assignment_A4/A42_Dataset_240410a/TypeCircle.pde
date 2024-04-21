class TypeCircle{
  // variables
  String name;
  color typeCol;
  int baseSz;
  float posX, posY;
  
  // constructor
  TypeCircle(String n, color c, int b, float x, float y){
    name = n;
    typeCol = c;
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
    fill(typeCol);
    ellipseMode(CENTER);
    ellipse(posX, posY, finalSz, finalSz);
  }
}
