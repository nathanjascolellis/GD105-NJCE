class WordBlock{
  // variables
  String word;
  int sz, i;
  float posX, posY, centerX, centerY;
  boolean held;
  color blockBG, blockOutL;
  
  // initial input assignment
  WordBlock(String w, float x, float y){
    word = w;
    sz = w.length()*16;
    posX = x;
    centerX = posX+(sz/2);
    posY = y;
    centerY = posY-15;
    held = false;
    blockBG = color(100, 100, 255);
    blockOutL = color(100, 100, 255);
    for(i=0; i<w.length(); i++){
      if(w.charAt(i) == 'i' || w.charAt(i) == 'j' || w.charAt(i) == 'l' || w.charAt(i) == 't'){
        sz -= 8;
      }
      if(w.charAt(i) == 'w'){
        sz += 6;
      }
    }
  }
  
  // updating block
  void update(){
    // static update
    if(held == false){
      // block outline reverts to default
      blockOutL = color(100, 100, 255);
    }
    // dynamic update
    if(held == true){
      // block outline change to indicate held status
      blockOutL = color(255, 100, 100);
      
      // position update
      if (centerX > mouseX){
        posX -= (centerX-mouseX)/20;
      }
      if (centerX < mouseX){
        posX += (mouseX-centerX)/20;
      }
      if (centerY > mouseY){
        posY -= (centerY-mouseY)/20;
      }
      if (centerY < mouseY){
        posY += (mouseY-centerY)/20;
      }
    }
    
    // update block center data
    centerX = posX+(sz/2);
    centerY = posY-15;
    
    // generate block visually
    roundCornerRect(posX, posY-30, sz, 30, 5, 5, blockBG, blockOutL);
    textSize(30);
    textAlign(CENTER);
    fill(0);
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
}
