// Class for buttons in the title screens
class TitleButton{
  // variables
  float posX, posY, xSz, ySz, colState = 0.0;
  color base, highlight;
  String buttonTxt = "";
  PImage buttonImg;
  boolean isImage, selected = false;
  
  // constructor - text button
  TitleButton(float x, float y, float xSize, float ySize, color b, color h, String c){
    posX = x;
    posY = y;
    xSz = xSize;
    ySz = ySize;
    base = b;
    highlight = h;
    buttonTxt = c;
    isImage = false;
  }
  
  // constructor - image button
  TitleButton(float x, float y, float xSize, float ySize, color b, color h, PImage i){
    posX = x;
    posY = y;
    xSz = xSize;
    ySz = ySize;
    base = b;
    highlight = h;
    buttonImg = i;
    isImage = true;
  }
  
  // update
  void update(){
    // mouse select indication
    if(abs(mouseX-(width/2)-posX) < xSz/2 && abs(mouseY-(height/2)-posY) < ySz/2){
      selected = true;
      // color state update if needed
      if(colState < 1.0){
        colState += 0.2;
      }
    } else {
      selected = false;
      // color state update if needed
      if(colState > 0.0){
        colState -= 0.2;
      }
    }
    
    // visual generation setup
    noStroke();
    rectMode(CENTER);
    if(isImage == false){
      textAlign(CENTER);
      textSize(ySz * 0.75);
    }
    fill(lerpColor(base, highlight, colState));
    
    // visual generation
    rect(posX, posY, xSz, ySz);
    if(isImage == false){
      fill(255);
      text(buttonTxt, posX, posY+(ySz/4));
    } else {
      imageMode(CENTER);
      image(buttonImg, 0, 0);
    }
  }
}
