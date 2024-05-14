// object representing one partcile on the grid
class Particle{
  // variables
  int parType, posID;
  boolean selected, moved;
  color base;
  float posX, posY;
  
  // constructor
  Particle(int id){
    posID = id;
    parType = int(random(1, 7));
    selected = false;
    moved = false;
    if(parType == 1){
      base = #FF00BB;
    } else if(parType == 2){
      base = #FFFF00;
    } else if(parType == 3){
      base = #00FF00;
    } else if(parType == 4){
      base = #00FFFF;
    } else if(parType == 5){
      base = #FF7700;
    } else if(parType == 6){
      base = #BB00FF;
    }
    posX = -280 + ((id % 8)*80);
    posY = -280 + (int(id / 8)*80);
  }
  
  // update
  void update(){    
    // mouse proximity check
    if(state == 5 && abs(mouseX-posX-(width/2)) < 40 && abs(mouseY-posY-(height/2)) < 40){
      selected = true;
    } else {
      selected = false;
    }
    
    // position correction (used during particle swap)
    if(posX > -280 + ((posID % 8)*80)){
      posX -= 16;
    }
    if(posX < -280 + ((posID % 8)*80)){
      posX += 16;
    }
    if(posY > -280 + (int(posID / 8)*80)){
      posY -= 16;
    }
    if(posY < -280 + (int(posID / 8)*80)){
      posY += 16;
    }
    
    // visual generation - base
    ellipseMode(CENTER);
    fill(base);
    noStroke();
    circle(posX, posY, 49);
    
    // visual generation - gradient
    imageMode(CENTER);
    image(partGradient, posX+5, posY-5);
    
    // immediately match checking after a move is completed
    if(moved && posX == -280 + ((posID % 8)*80) && posY == -280 + (int(posID / 8)*80)){
      this.matchCheck();
    }
  }
  
  // particle swap: selected particle
  void give(){
    int goalID = 64;
    if(selected == true){
      if(key == 'w' || keyCode == UP && posID - 8 >= 0){
        goalID = posID - 8;
        gravDir = "up";
      } else if(key == 'a' || keyCode == LEFT && posID % 8 != 0){
        goalID = posID - 1;
        gravDir = "left";
      } else if(key == 's' || keyCode == DOWN && posID + 8 < 64){
        goalID = posID + 8;
        gravDir = "down";
      } else if(key == 'd' || keyCode == RIGHT && (posID+1) % 8 != 0){
        goalID = posID + 1;
        gravDir = "right";
      } 
      if(goalID < 64 && goalID >= 0){
        int goalType = gameParts[goalID].parType;
        int goalBase = gameParts[goalID].base;
        float goalX = gameParts[goalID].posX;
        float goalY = gameParts[goalID].posY;
        gameParts[goalID].take(posID);
        parType = goalType;
        base = goalBase;
        posX = goalX;
        posY = goalY;
        moved = true;
      }
    }
  }
  
  // particle swap: goal particle
  void take(int giveID){
    parType = gameParts[giveID].parType;
    base = gameParts[giveID].base;
    posX = gameParts[giveID].posX;
    posY = gameParts[giveID].posY;
    moved = true;
  }
  
  // function to calculate match
  void matchCheck(){
    // initialize variables for the IDs of adjacent particles
    int upID = 64, leftID = 64, downID = 64, rightID = 64;
    
    // let the rest of the program know we're matching right now
    matchingNow = true;
    
    // check if adjacent particles exist, then check if they match
    if(posID - 8 >= 0){
      // determine ID of particle above
      upID = posID - 8;
      
      // check if the particle above matches and hasn't been accounted for yet
      if(parType == gameParts[upID].parType && gameParts[upID].moved == false){
        // call this function in the particle above
        gameParts[upID].moved = true;
        gameParts[upID].matchCheck();
        match++;
      }
    }
    if(posID % 8 != 0){
      // determine ID of particle to the left
      leftID = posID - 1;
      
      // check if the particle to the left matches and hasn't been accounted for yet
      if(parType == gameParts[leftID].parType && gameParts[leftID].moved == false){
        // call this function in the particle to the left
        gameParts[leftID].moved = true;
        gameParts[leftID].matchCheck();
        match++;
      }
    }
    if(posID + 8 < 64){
      // determine ID of particle below
      downID = posID + 8;
      
      // check if the particle below matches and hasn't been accounted for yet
      if(parType == gameParts[downID].parType && gameParts[downID].moved == false){
        // call this function in the particle below
        gameParts[downID].moved = true;
        gameParts[downID].matchCheck();
        match++;
      }
    }
    if((posID+1) % 8 != 0){
      // determine ID of particle to the right
      rightID = posID + 1;
      
      // check if the particle above matches and hasn't been accounted for yet
      if(parType == gameParts[rightID].parType && gameParts[rightID].moved == false){
        // call this function in the particle above
        gameParts[rightID].moved = true;
        gameParts[rightID].matchCheck();
        match++;
      }
    }
    
    // reset moved to false
    moved = false;
  }
}
