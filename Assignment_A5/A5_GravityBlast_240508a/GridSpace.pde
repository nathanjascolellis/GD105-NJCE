// object representing one space on the grid
class GridSpace{
  // variables
  float posX, posY, colState;
  int spaceState;
  color lineCol;
  
  // constructor
  GridSpace(float id){
    posX = -280 + ((id % 8)*80);
    posY = -280 + (int(id / 8)*80);
    lineCol = #656565;
    spaceState = 0;
    colState = 0.0;
  }
  
  // update function
  void update(){
    // mouse proximity check
    if(abs(selectX-posX-(width/2)) < 40 && abs(selectY-posY-(height/2)) < 40){
      if(colState < 1.0){
        colState += 0.1;
      }
    } else if((abs(selectX-posX-(width/2)) < 40 
              && abs(selectY-posY-(height/2)) < 120) 
              || (abs(selectX-posX-(width/2)) < 120 
              && abs(selectY-posY-(height/2)) < 40)){
      if(colState < 0.5){
        colState += 0.1;
      } else if(colState > 0.5){
        colState -= 0.1;
      }
    } else {
      if(colState > 0.0){
        colState -= 0.1;
      }
    }
    
    // determine line color through interpolation
    lineCol = lerpColor(#656565, #EEEEEE, colState);
    
    // visual generation
    stroke(lineCol);
    strokeWeight(2);
    noFill();
    ellipseMode(CENTER);
    circle(posX, posY, 50);
    strokeWeight(3);
    circle(posX, posY, 72);
  }
}
