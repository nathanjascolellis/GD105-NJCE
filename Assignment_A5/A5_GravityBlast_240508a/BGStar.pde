// object representing one of the stars in the background
class BGStar{
  // variables
  int posX, posY, Sz;
  
  // constructor
  BGStar(){
    posX = int(random(-380, 381));
    posY = int(random(-380, 381));
    Sz = int(random(1, 12));
  }
  
  // update function
  void update(){
    
    // gravity check and appropriate position adjustment
    if(gravDir == "down"){
      posY += 5;
    } else if(gravDir == "left"){
      posX -= 5;
    } else if(gravDir == "up"){
      posY -= 5;
    } else if(gravDir == "right"){
      posX += 5;
    } 
    
    // border check and appropriate position reassignment
    if(posX < -400){
      posX = 400;
    }
    if(posX > 400){
      posX = -400;
    }
    if(posY < -400){
      posY = 400;
    }
    if(posY > 400){
      posY = -400;
    }
    
    // visual generation
    noStroke();
    fill(#FFFFFF);
    ellipseMode(CENTER);
    circle(posX, posY, Sz);
  }
}
