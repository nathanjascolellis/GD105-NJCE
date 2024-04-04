// Nathan Ellis 4/3/2024
// THE PLAN IS SIMPLE:
// create a class for word blocks
// within word blocks:
// rectangle and text
// ability to follow mouse if it's clicked
// ability to connect to nearby words if released
WordBlock hello = new WordBlock("hello", 300, 300);
WordBlock world = new WordBlock("world", 300, 340);
boolean equipped;

void setup(){
  size(800, 800);
  
  // resetting the mouse to not be carrying anything
  equipped = false;
}

void draw(){
  // initial setup
  background(240, 240, 255);
  
  // blocks
  hello.update();
  world.update();
}

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
    }
    
    // holding code
    if(held == false && equipped == false && toggled == false && abs(mouseX-centerX) <= sz/2 && abs(mouseY-centerY) <= 15){
      held = true;
      equipped = true;
    }
  }
}

void mouseClicked(){
  // because the code runs each word block's grab function in order, the words earlier on in the original order have port priority
  hello.grab();
  world.grab();
}

void roundCornerRect(float xPos, float yPos, float xSz, float ySz, float cornerRad, int borderSz, color fillCol, color strkCol){
  // position variable calculation
  float xStart = xPos + cornerRad;
  float xEnd = xPos + xSz - cornerRad;
  float yStart = yPos + cornerRad;
  float yEnd = yPos + ySz - cornerRad;
  
  // inner quads
  noStroke();
  fill(fillCol);
  quad(xStart, yPos, xEnd, yPos, xEnd, yPos+ySz, xStart, yPos+ySz);
  quad(xPos, yStart, xPos, yEnd, xPos+xSz, yEnd, xPos+xSz, yStart);
  
  // arcs
  stroke(strkCol);
  strokeWeight(borderSz);
  arc(xStart, yStart, cornerRad*2, cornerRad*2, PI, PI*1.5);
  arc(xEnd, yStart, cornerRad*2, cornerRad*2, PI*1.5, TAU);
  arc(xEnd, yEnd, cornerRad*2, cornerRad*2, 0, PI*0.5);
  arc(xStart, yEnd, cornerRad*2, cornerRad*2, PI*0.5, PI);
  
  // outline
  line(xStart, yPos, xEnd, yPos);
  line(xPos+xSz, yStart, xPos+xSz, yEnd);
  line(xStart, yPos+ySz, xEnd, yPos+ySz);
  line(xPos, yStart, xPos, yEnd);
}
