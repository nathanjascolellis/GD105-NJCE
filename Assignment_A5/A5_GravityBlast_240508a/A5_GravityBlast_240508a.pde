// Nathan Ellis 5/8/2024
// THE PLAN IS SIMPLE:
// grid space object array
// particle object array
// mouse reactive move indicator
// enable both drag/drop and key controls

// game fonts
PFont titleAgency;
PFont bodyAgency;

// game state variable
int state = 0;

// animation progress variable
int anim = 0;

// increment variable
int i = 0;

// mouse selection variables
float selectX = 0;
float selectY = 0;

// grid space array
GridSpace[] gameGrid = new GridSpace[64];

// particle array
Particle[] gameParts = new Particle[64];

// star array
BGStar[] backgroundStars = new BGStar[18];

// gravity direction indicator
String gravDir = "down";

// image objects
PImage bgGradient;
PImage partGradient;

// blast effect image list
PImage[] blastEffects = new PImage[6];

// time and score variables
float timer = 61.0;
float scoreTimeRate = 0.25;
int prevSec = 0;
float match = 0;
int score = 0;
boolean movingNow = false;
boolean matchingNow = false;
boolean refillingNow = false;

// combo variables and list
float combo = 0.0;
IntList comboCol;
boolean displayCombo = false;

// button colors
color buttonBase = color(0, 1);
color buttonHLight = color(150, 150);

// menu buttons
TitleButton slowSpeed = new TitleButton(0, -80, 375, 35, buttonBase, buttonHLight, "Slow");
TitleButton mediSpeed = new TitleButton(0, -40, 375, 35, buttonBase, buttonHLight, "Medium");
TitleButton fastSpeed = new TitleButton(0, -0, 375, 35, buttonBase, buttonHLight, "Fast");
TitleButton turboSpeed = new TitleButton(0, 40, 375, 35, buttonBase, buttonHLight, "Turbo");

// particle color array
color[] parCols = new color[7];

void setup(){
  // set window size
  size(800,800);
  
  // load fonts
  titleAgency = loadFont("AgencyFB-Bold-80.vlw");
  bodyAgency = loadFont("AgencyFB-Bold-30.vlw");
  
  // add grid spaces to array
  for(i=0; i<64; i++){
    gameGrid[i] = new GridSpace(i);
  }
  
  // add partciles to array
  for(i=0; i<64; i++){
    gameParts[i] = new Particle(i);
  }
  
  for(i=0; i<18; i++){
    backgroundStars[i] = new BGStar();
  }
  
  // loading images
  bgGradient = loadImage("BGGradient.png");
  partGradient = loadImage("particleGradient.png");
  
  // loading particle color array
  parCols[0] = #333333;
  parCols[1] = #FF00BB;
  parCols[2] = #FFFF00;
  parCols[3] = #00FF00;
  parCols[4] = #00FFFF;
  parCols[5] = #FF7700;
  parCols[6] = #BB00FF;
  
  // loading blast effect list
  blastEffects[0] = loadImage("BlastEffect1.png");
  blastEffects[1] = loadImage("BlastEffect2.png");
  blastEffects[2] = loadImage("BlastEffect3.png");
  blastEffects[3] = loadImage("BlastEffect4.png");
  blastEffects[4] = loadImage("BlastEffect5.png");
  blastEffects[5] = loadImage("BlastEffect6.png");
  
  // initialize combo color list
  comboCol = new IntList();
  comboCol.append(0);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  // outline variables
  int hStart = 0;
  int hFinish = 0;
  int w = 0;
  int inc = 0;
  
  // update background stars
  for(i=0; i<18; i++){
    backgroundStars[i].update();
  }
  
  // outer gradient
  imageMode(CENTER);
  image(bgGradient, 0, 0);
  
  // opening title - outline
  if(state == 0){
    hStart = 0+anim;
    hFinish = 100;
    w = 420;
    inc = 10;
    border(0, 0, hStart, w, 30);
    if(hStart < hFinish){
      anim += inc;
    }
  }
  if(state == 1){
    hStart = 0+anim;
    hFinish = 0;
    w = 420;
    inc = 10;
    border(0, 0, hStart, w, 30);
    if(hStart > hFinish){
      anim -= inc;
    }
    if(hStart == 0){
      state++;
    }
  }
  
  // opening title - text
  if(state == 0 && hStart == hFinish){
    textAlign(CENTER);
    textFont(titleAgency);
    fill(255);
    text("GRAVITY BLAST", 0, 30);
  }
  
  // speed select & game over screen - outline
  if(state == 2 || state == 7){
    hStart = 0+anim;
    hFinish = 300;
    w = 400;
    inc = 20;
    border(0, 0, hStart, w, 30);
    if(hStart < hFinish){
      anim += inc;
    }
  }
  if(state == 3 || state == 8){
    hStart = 0+anim;
    hFinish = 0;
    w = 400;
    inc = 20;
    border(0, 0, hStart, w, 30);
    if(hStart > hFinish){
      anim -= inc;
    }
    if(hStart == 0){
      state++;
    }
  }
  
  // speed select - text and buttons
  if(state == 2 && hStart == hFinish){
    textAlign(CENTER);
    textFont(bodyAgency);
    fill(255);
    text("Select your Speed:", 0, -120);
    
    slowSpeed.update();
    mediSpeed.update();
    fastSpeed.update();
    turboSpeed.update();
  }
  
  // game - outline
  if(state == 4){
    hStart = 0+anim;
    hFinish = 640;
    w = 640;
    inc = 40;
    border(0, 0, hStart, w, 60);
    if(hStart < hFinish){
      anim += inc;
    }
    if(hStart == hFinish){
      state++;
    }
  }
  
  // select position update
  if(mousePressed == false){
    selectX = mouseX;
    selectY = mouseY;
  }
  
  // update game objects
  if(state == 5){
    // combo colors test
    /*
    textSize(20);
    for(i=0; i<comboCol.size(); i++){
      text(comboCol.get(i), 350, -240+(i*20));
    }
    */
    
    // maintain border
    border(0, 0, 640, 640, 60);
    
    // update objects
    for(i=0; i<64; i++){
      gameGrid[i].update();
    }
    for(i=0; i<64; i++){
      gameParts[i].update();
    }
    
    // count down timer if needed
    if(second() != prevSec){
      timer -= 1.0;
      prevSec = second();
    }
    
    // add match score to timer and total score
    if(matchingNow == true){
      // continuing match unless every particle has completed its movement
      for(i=0; i<64; i++){
        matchingNow = gameParts[i].moved;
      }
      
      // timer and score update
      if(matchingNow == false){
        if(match >= 3){
          score += match;
          timer += match*scoreTimeRate;
          // if score was gained, run all applicable blast and refill scripts
          refillingNow = true;
          if(gravDir == "up" || gravDir == "left"){
            for(i=0; i<64; i++){
              if(gameParts[i].matched == true){
                gameParts[i].blastState = 1;
                gameParts[i].refill();
              }
            }
            while(refillingNow){
              for(i=0; i<64; i++){
                if(gameParts[i].refilled == true){
                  gameParts[i].refill();
                }
                refillingNow = gameParts[i].refilled;
              }
            }
          } else if(gravDir == "down" || gravDir == "right"){
            // run checks in reverse during certain gravity states
            for(i=63; i>=0; i--){
              if(gameParts[i].matched == true){
                gameParts[i].blastState = 1;
                gameParts[i].refill();
              }
            }
            while(refillingNow){
              for(i=63; i>=0; i--){
                if(gameParts[i].refilled == true){
                  gameParts[i].refill();
                }
                refillingNow = gameParts[i].refilled;
              }
            }
          }
          /* commented out combo meter code because it was taking too long to get working properly
          // if applicable, break combo
          if(comboCol.size() > 2){
            if(!(comboCol.get(comboCol.size()-2) == comboCol.get(comboCol.size()-3) || comboCol.get(comboCol.size()-1) == comboCol.get(comboCol.size()-3))){
              combo = 0.0;
            }
            // combo meter text indicator
            if(comboCol.get(comboCol.size()-2) == comboCol.get(comboCol.size()-3) || comboCol.get(comboCol.size()-1) == comboCol.get(comboCol.size()-3)){
              displayCombo = true;
              comboCol.append(comboCol.get(comboCol.size()-3));
              for(i=0; i<comboCol.size()-1; i++){
                comboCol.remove(i);
              }
            } else {
              displayCombo = false;
            }
          } else if(comboCol.size() == 2) {
            if(comboCol.get(comboCol.size()-1) != comboCol.get(comboCol.size()-2)){
              combo = 0.0;
              displayCombo = false;
            }
          }
          combo += 1+(match/10);
          */
        }
        // reset matched status
        for(i=0; i<64; i++){
          gameParts[i].matched = false;
        }
        match = 0;
      }
    }
    
    // display combo if applicable
    if(displayCombo){
      textSize(35);
      textAlign(RIGHT);
      fill(parCols[comboCol.get(comboCol.size()-1)]);
      text(combo + "x Combo!", 320, -330);
    }
    
    // change state if timer runs out. if not, print timer
    if(timer < 0){
      state = 6;
    } else {
      textSize(35);
      textAlign(LEFT);
      fill(#FFFFFF);
      text(int(timer), -320, -330);
    }
  }
  
  // game over state
  if(state == 6){
    // border animation
    hStart = 0+anim;
    hFinish = 0;
    w = 640;
    inc = 40;
    border(0, 0, hStart, w, 60);
    if(hStart > hFinish){
      anim -= inc;
    }
    if(hStart == hFinish){
      state++;
    }
    
    // reset particle positions because the game can end mid-move
    for(i=0; i<64; i++){
      gameParts[i].posX = -280 + ((i % 8)*80);
      gameParts[i].posY = -280 + (int(i / 8)*80);
    }
  }
  
  // game over text
  if(state == 7 && hStart == 300){
    fill(255);
    noStroke();
    textFont(titleAgency);
    textSize(50);
    textAlign(CENTER);
    text("Game Over.", 0, -100);
    textFont(bodyAgency);
    text("Final Score: " + score, 0, 0);
    text("Click anywhere to retry.", 0, 50);
  }
  
  if(state == 9){
    // replay state -- resets everything and immediately jumps to title screen
    gravDir = "down";
    timer = 61.0;
    scoreTimeRate = 0.2;
    prevSec = 0;
    match = 0;
    score = 0;
    movingNow = false;
    matchingNow = false;
    refillingNow = false;
    combo = 0.0;
    comboCol.clear();
    comboCol.append(0);
    displayCombo = false;
    state = 0;
  }
}

// mouse clicked actions
void mouseClicked(){
  // select "speed" aka difficulty
  if(state == 2){
    if(slowSpeed.selected){
      timer = 121.0;
      scoreTimeRate = 0.4;
      state++;
    }
    if(mediSpeed.selected){
      timer = 91.0;
      scoreTimeRate = 0.3;
      state++;
    }
    if(fastSpeed.selected){
      timer = 61.0;
      scoreTimeRate = 0.2;
      state++;
    }
    if(turboSpeed.selected){
      timer = 31.0;
      scoreTimeRate = 0.125;
      state++;
    }
  }
  
  // progress state through title screen and game over screen
  if(state == 0 || state == 7){
    state++;
  }
}

// key pressed actions
void keyPressed(){
  // move a particle if gameplay is happening
  if(state == 5 && movingNow == false){
    for(i=0; i<64; i++){
      gameParts[i].give();
    }
  }
  // screenshot button for testing purposes
  if(key == '1'){
    saveFrame("frames/##.png");
  }
}
