// Nathan Ellis 5/8/2024
// THE PLAN IS SIMPLE:
// grid space object array
// particle object array
// mouse reactive move indicator
// enable both drag/drop and key controls

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

void setup(){
  // set window size
  size(800,800);
  
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
  /* 
  // temporarily commenting this out because it made the game lag which was very sad
  rectMode(CENTER);
  noFill();
  stroke(0, 20);
  strokeWeight(20);
  for(i=0; i<100; i++){
    square(0, 0, 740+(2*i));
  }
  */
  
  // opening title - outline
  if(state == 0){
    hStart = 0+anim;
    hFinish = 100;
    w = 600;
    inc = 10;
    border(0, 0, hStart, w, 30);
    if(hStart < hFinish){
      anim += inc;
    }
  }
  if(state == 1){
    hStart = 0+anim;
    hFinish = 0;
    w = 600;
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
    textSize(90);
    fill(255);
    text("GRAVITY BLAST", 0, 30);
  }
  
  // speed select - outline
  if(state == 2){
    hStart = 0+anim;
    hFinish = 300;
    w = 400;
    inc = 20;
    border(0, 0, hStart, w, 30);
    if(hStart < hFinish){
      anim += inc;
    }
  }
  if(state == 3){
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
  
  // speed select - text
  if(state == 2 && hStart == hFinish){
    textAlign(CENTER);
    textSize(30);
    fill(255);
    text("Select your Speed:", 0, -120);
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
    // maintain border
    border(0, 0, 640, 640, 60);
    
    // update objects
    for(i=0; i<64; i++){
      gameGrid[i].update();
    }
    for(i=0; i<64; i++){
      gameParts[i].update();
    }
  }
}

// progress state through title screen if mouse is clicked
void mouseClicked(){
  if(state == 0 || state == 2){
    state++;
  }
}

// key pressed actions
void keyPressed(){
  if(state == 5){
    for(i=0; i<64; i++){
      gameParts[i].give();
    }
  }
}
