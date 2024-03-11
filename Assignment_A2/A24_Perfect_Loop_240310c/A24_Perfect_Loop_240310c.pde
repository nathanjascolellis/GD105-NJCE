// Nathan Ellis 3/10/2024
// THE PLAN IS SIMPLE:
// illustrate image
// set up booleans for movement direction
// move image accordingly
// qwilfish jammin to the tunes
int leftDist = 0;
int downDist = 0;
int state = 0;
int hParallax = 0;
int vParallax = 0;

void setup(){
  size(700, 700);
  // frameRate(10); // in case i need to look in slow motion
}

void draw(){
  // set background
  background(#444466);
  
  // fish movement
  translate(350-leftDist, 400+downDist);
  
  // fish body
  fill(#dfda8c);
  stroke(#220022);
  strokeWeight(3);
  arc(0, 0, 500, 500, 0, PI);
  
  fill(#330033);
  stroke(#220022);
  arc(0, 0, 500, 500, PI, TWO_PI);
  
  noStroke();
  arc(0, 0, 500, 200+(2*vParallax), 0, PI);
  
  // fish mouth
  fill(#ce40ca);
  stroke(#91268e);
  ellipse(0-hParallax, 100+vParallax, 130, 90);
  
  noFill();
  arc(0-hParallax, 110+vParallax, 50, 50, PI+HALF_PI-0.6, PI+HALF_PI+0.6); 
  
  // make rest of fish later
  
  // update state
  if(leftDist == 50 && downDist == 50){
    state = 1;
  }
  if(downDist == 0 && state == 1){
    state = 2;
  }
  if(leftDist == -50 && downDist == 50){
    state = 3;
  }
  if(downDist == 0 && state == 3){
    state = 0;
  }
  
  // update distance
  if(state == 0){
    leftDist+=5;
    hParallax+=2;
    downDist+=5;
    vParallax+=2;
  }
  if(state == 1){
    leftDist-=5;
    hParallax-=2;
    downDist-=5;
    vParallax-=2;
  }
  if(state == 2){
    leftDist-=5;
    hParallax-=2;
    downDist+=5;
    vParallax+=2;
  }
  if(state == 3){
    leftDist+=5;
    hParallax+=2;
    downDist-=5;
    vParallax-=2;
  }
  
}
