// function to create a block containing text that is movable by the user
class WordBlock{
  // variables
  String word;
  int sz, i, txtSz;
  float posX, posY, centerX, centerY;
  boolean held;
  color blockBG, blockOutL, txtCol;
  PFont blockFont;
  
  // initial input assignment
  WordBlock(String w, float x, float y, int pt, color r, color t, PFont f){
    // variable assignment
    word = w;
    sz = w.length()*(pt/2);
    posX = x;
    centerX = posX+(sz/2);
    posY = y;
    centerY = posY-(pt/2);
    held = false;
    blockBG = r;
    blockOutL = r;
    txtCol = t;
    txtSz = pt;
    blockFont = f;
    
    // length adjustment for narrow and wide letters
    for(i=0; i<w.length(); i++){
      
      if(w.charAt(i) == 'i' || w.charAt(i) == 'j' || w.charAt(i) == 'l' || w.charAt(i) == 't'){
        sz -= (1*txtSz)/8;
      }
      
      if(w.charAt(i) == 'w'){
        sz += (3*txtSz)/5;
      }
    }
  }
  
  // updating block
  void update(){
    // static update
    if(held == false){
      // block outline reverts to default
      blockOutL = blockBG;
    }
    // dynamic update
    if(held == true){
      // block outline change to indicate held status
      blockOutL = color(255, 100, 100);
      
      // position update
      if (centerX > mouseX){
        posX -= (centerX-mouseX)/10;
      }
      if (centerX < mouseX){
        posX += (mouseX-centerX)/10;
      }
      if (centerY > mouseY){
        posY -= (centerY-mouseY)/10;
      }
      if (centerY < mouseY){
        posY += (mouseY-centerY)/10;
      }
    }
    
    // update block center data
    centerX = posX+(sz/2);
    centerY = posY-15;
    
    // generate block visually
    roundCornerRect(posX, posY-15, sz, 15, 5, 3, blockBG, blockOutL);
    textFont(blockFont);
    textAlign(CENTER);
    fill(txtCol);
    text(word, centerX, posY);
  }
  
  // block hold toggle
  void grab(){
    // if statement use check
    boolean toggled = false;
    
    // un-holding code
    if(held == true){
      held = false;
      equipped = false;
      toggled = true;
      // println(posX, posY); // tweak mode doesn't like me so i positioned my words like this instead
    }
    
    // holding code
    if(held == false && equipped == false && toggled == false && abs(mouseX-centerX) <= sz/2 && abs(mouseY-centerY) <= 15){
      held = true;
      equipped = true;
    }
  }
  
  // magnet function WIP
  void magnet(){
    // if statement use check
    boolean toggled = false;
    
    // activate gravity when moused over
    if(abs(centerX-mouseX) < 20 && abs(centerY-mouseY) < 20){
      held = true;
    }
  }
}
