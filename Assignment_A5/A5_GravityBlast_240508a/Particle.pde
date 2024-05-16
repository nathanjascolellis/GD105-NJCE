// object representing one partcile on the grid
class Particle{
  // variables
  int parType, blastType, posID, blastState = 0, upID = 64, leftID = 64, downID = 64, rightID = 64;
  boolean selected = false, moved = false, matched = false, refilled = false;
  color base;
  float posX, posY, blastPosX, blastPosY;
  
  // constructor
  Particle(int id){
    // variable assignment
    posID = id;
    parType = int(random(1, 7));
    blastType = parType;
    
    // use particle type to assign base color
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
    
    // use ID to assign position in grid
    posX = -280 + ((id % 8)*80);
    blastPosX = posX;
    posY = -280 + (int(id / 8)*80);
    blastPosY = posY;
    
    // check if adjacent particles exist, and assign their IDs
    if(posID - 8 >= 0){
      // determine ID of particle above
      upID = posID - 8;
    }
    if(posID % 8 != 0){
      // determine ID of particle to the left
      leftID = posID - 1;
    }
    if(posID + 8 < 64){
      // determine ID of particle below
      downID = posID + 8;
    }
    if((posID+1) % 8 != 0){
      // determine ID of particle to the right
      rightID = posID + 1;
    }
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
      // prevent a new move from starting while one is already happening
      movingNow = true;
      
      //update position
      posX -= 16;
    }
    if(posX < -280 + ((posID % 8)*80)){
      // prevent a new move from starting while one is already happening
      movingNow = true;
      
      //update position
      posX += 16;
    }
    if(posY > -280 + (int(posID / 8)*80)){
      // prevent a new move from starting while one is already happening
      movingNow = true;
      
      //update position
      posY -= 16;
    }
    if(posY < -280 + (int(posID / 8)*80)){
      // prevent a new move from starting while one is already happening
      movingNow = true;
      
      //update position
      posY += 16;
    }
    if(posX == -280 + ((posID % 8)*80) && posY == -280 + (int(posID / 8)*80)){
      // re-enable moves when the animation is complete
      movingNow = false;
    }
    
    // visual generation - particle base
    ellipseMode(CENTER);
    fill(base);
    noStroke();
    circle(posX, posY, 49);
    
    // visual generation - gradient
    imageMode(CENTER);
    image(partGradient, posX+5, posY-5);
    
    // visual generation - blast effect
    if(blastState > 0){
      // blast effect generation
      imageMode(CENTER);
      tint(255, 200-(blastState*8));
      image(blastEffects[(blastType-1)], blastPosX, blastPosY);
      noTint();
      // increment blast state to fade out blast effect
      blastState++;
      
      // reset blast state if it is fully faded out
      if(blastState == 26){
        blastState = 0;
        blastType = parType;
      }
    }
    
    // immediately match checking after a move is completed
    if(moved && posX == -280 + ((posID % 8)*80) && posY == -280 + (int(posID / 8)*80)){
      this.matchCheck();
    }
    
    // if the particle type changed, update its color
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
  }
  
  // particle swap: selected particle
  void give(){
    int goalID = 64;
    if(selected == true){
      if((key == 'w' || keyCode == UP) && posID - 8 >= 0){
        goalID = posID - 8;
        gravDir = "up";
      } else if((key == 'a' || keyCode == LEFT) && posID % 8 != 0){
        goalID = posID - 1;
        gravDir = "left";
      } else if((key == 's' || keyCode == DOWN) && posID + 8 < 64){
        goalID = posID + 8;
        gravDir = "down";
      } else if((key == 'd' || keyCode == RIGHT) && (posID+1) % 8 != 0){
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
        gameParts[goalID].moved = true;
      }
    }
  }
  
  // particle swap: goal particle
  void take(int giveID){
    parType = gameParts[giveID].parType;
    base = gameParts[giveID].base;
    posX = gameParts[giveID].posX;
    posY = gameParts[giveID].posY;
  }
  
  // function to calculate match
  void matchCheck(){
    // let the rest of the program know we're matching right now
    matchingNow = true;
    
    // check if adjacent particles exist, then check if they match
    if(upID != 64){
      // check if the particle above matches
      if(parType == gameParts[upID].parType){
        // activate matched status
        matched = true;
        
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[upID].matched == false){
          // call this function in the particle above
          gameParts[upID].matchCheck();
        }
      }
    }
    if(leftID != 64){
      // check if the particle to the left matches
      if(parType == gameParts[leftID].parType){
        // activate matched status
        matched = true;
        
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[leftID].matched == false){
          // call this function in the particle to the left
          gameParts[leftID].matchCheck();
        }
      }
    }
    if(downID != 64){
      // check if the particle below matches
      if(parType == gameParts[downID].parType){
        // activate matched status
        matched = true;
        
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[downID].matched == false){
          // call this function in the particle below
          gameParts[downID].matchCheck();
        }
      }
    }
    if(rightID != 64){
      // check if the particle to the right matches
      if(parType == gameParts[rightID].parType){
        // activate matched status
        matched = true;
        
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[rightID].matched == false){
          // call this function in the particle to the right
          gameParts[rightID].matchCheck();
        }
      }
    }
    
    // score particle if matched
    if(matched == true){
      match++;
    }
    
    // reset moved to false
    moved = false;
  }
  
  // refill the board when any particles are blasted
  void refill(){
    
    // initialize the ID of the particle to take from
    int goalID = posID;
    
    // start replacement chain in the opposite direction of the current gravity
    if(gravDir == "down"){
      // move goal ID up in the grid until it hits one that hasn't been refilled
      while(goalID >= 8 && (gameParts[goalID].refilled == true || gameParts[goalID].matched == true)){
        goalID -= 8;
      }
      if(goalID < 8 && gameParts[goalID].refilled == true || goalID == posID){
        // if a wall has been hit, create a random new particle
        parType = int(random(1, 7));
        posY = gameParts[goalID].posY;
      } else {
        // take from particle at goal ID
        this.take(goalID);
        gameParts[goalID].refilled = true;
      }
    }
    if(gravDir == "up"){
      while(goalID < 56 && (gameParts[goalID].refilled == true || gameParts[goalID].matched == true)){
        goalID += 8;
      }
      if(goalID >= 56 && gameParts[goalID].refilled == true || goalID == posID){
        parType = int(random(1, 7));
        posY = gameParts[goalID].posY;
      } else {
        this.take(goalID);
        gameParts[goalID].refilled = true;
      }
    }
    if(gravDir == "left"){
      while((goalID + 1) % 8 > 0 && (gameParts[goalID].refilled == true || gameParts[goalID].matched == true)){
        goalID ++;
      }
      if((goalID + 1) % 8 == 0 && gameParts[goalID].refilled == true || goalID == posID){
        parType = int(random(1, 7));
        posY = gameParts[goalID].posY;
      } else {
        this.take(goalID);
        gameParts[goalID].refilled = true;
      }
    }
    if(gravDir == "right"){
      while(goalID % 8 > 0 && (gameParts[goalID].refilled == true || gameParts[goalID].matched == true)){
        goalID --;
      }
      if(goalID % 8 == 0 && gameParts[goalID].refilled == true || goalID == posID){
        parType = int(random(1, 7));
        posY = gameParts[goalID].posY;
      } else {
        this.take(goalID);
        gameParts[goalID].refilled = true;
      }
    }
    
    refilled = false;
  }
}
