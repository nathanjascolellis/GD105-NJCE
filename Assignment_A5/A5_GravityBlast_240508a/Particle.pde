// object representing one partcile on the grid
class Particle{
  // variables
  int parType, posID;
  boolean selected;
  color base;
  float posX, posY;
  
  // constructor
  Particle(int id){
    posID = id;
    parType = int(random(1, 7));
    selected = false;
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
    fill(255, 15);
    int gradReps = 0;
    while(gradReps < 25){
      circle(posX+5, posY-5, 45-(gradReps*1.5));
      gradReps++;
    }
  }
  
  // particle swap: selected particle
  void give(){
    int goalID = 64;
    if(selected == true){
      if(key == 'w' && posID - 8 >= 0){
        goalID = posID - 8;
        gravDir = "up";
      } else if(key == 'a' && posID % 8 != 0){
        goalID = posID - 1;
        gravDir = "left";
      } else if(key == 's' && posID + 8 < 64){
        goalID = posID + 8;
        gravDir = "down";
      } else if(key == 'd' && (posID+1) % 8 != 0){
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
    // check if each adjacent particle matches
    // update match size, then call function in the other particle
  }
}
