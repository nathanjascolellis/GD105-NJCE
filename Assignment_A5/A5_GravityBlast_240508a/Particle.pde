// object representing one partcile on the grid
class Particle{
  // variables
  int parType, posID, blastState, upID = 64, leftID = 64, downID = 64, rightID = 64;
  boolean selected, moved, matched;
  color base;
  float posX, posY;
  
  // constructor
  Particle(int id){
    posID = id;
    parType = int(random(1, 7));
    selected = false;
    moved = false;
    matched = false;
    blastState = 0;
    
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
    posY = -280 + (int(id / 8)*80);
    
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
    
    // visual generation - not blasted
    if(blastState == 0){
      // visual generation - base
      ellipseMode(CENTER);
      fill(base);
      noStroke();
      circle(posX, posY, 49);
      
      // visual generation - gradient
      imageMode(CENTER);
      image(partGradient, posX+5, posY-5);
    }
    
    // visual generation - blasted
    if(blastState > 0){
      // blast effect generation
      imageMode(CENTER);
      tint(255, 200-(blastState*8));
      image(blastEffects[(parType-1)], posX, posY);
      noTint();
      // increment blast state to fade out blast effect
      blastState++;
      
      // reset blast state if it is fully faded out
      if(blastState == 26){
        blastState = 0;
      }
    }
    
    // immediately match checking after a move is completed
    if(moved && posX == -280 + ((posID % 8)*80) && posY == -280 + (int(posID / 8)*80)){
      this.matchCheck();
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
    // let the rest of the program know we're matching right now
    matchingNow = true;
    
    // check if adjacent particles exist, then check if they match
    if(upID != 64){
      // check if the particle above matches
      if(parType == gameParts[upID].parType){
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[upID].moved == false){
          // call this function in the particle above
          gameParts[upID].moved = true;
          gameParts[upID].matchCheck();
        }
        // update match value
        match++;
        blastState = 1;
      }
    }
    if(leftID != 64){
      // check if the particle to the left matches
      if(parType == gameParts[leftID].parType){
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[leftID].moved == false){
          // call this function in the particle to the left
          gameParts[leftID].moved = true;
          gameParts[leftID].matchCheck();
        }
        // update match value
        match++;
        blastState = 1;
      }
    }
    if(downID != 64){
      // check if the particle below matches
      if(parType == gameParts[downID].parType){
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[downID].moved == false){
          // call this function in the particle below
          gameParts[downID].moved = true;
          gameParts[downID].matchCheck();
        }
        // update match value
        match++;
        blastState = 1;
      }
    }
    if(rightID != 64){
      // check if the particle to the right matches
      if(parType == gameParts[rightID].parType){
        // check if the adjacent particle hasn't been accounted for yet
        if(gameParts[rightID].moved == false){
          // call this function in the particle to the right
          gameParts[rightID].moved = true;
          gameParts[rightID].matchCheck();
        }
        // update match value
        match++;
        blastState = 1;
      }
    }
    
    // reset moved to false
    moved = false;
  }
}
