// Nathan Ellis 3/10/2024
// THE PLAN IS SIMPLE:
// import an image with transparent eyes
// create eyes on canvas
// make eyes follow mouse, but constrain them to their eye sockets
// load image ABOVE the moving eyes
PImage poster;

void setup(){
  size(670, 800);
  
  // initialize image
  poster = loadImage("marioplusrabbids.PNG");
}

void draw(){
  // initialize background
  background(255);
  
  // initialize variables
  int marioX = constrain(mouseX, 345, 366);
  int marioY = constrain(mouseY, 250, 280);
  int marioH = 30;
  int marioV = -3;
  int marioS = 15;
  int sparkX = constrain(mouseX, 565, 577);
  int sparkY = constrain(mouseY, 173, 177);
  int sparkH = -22;
  int sparkV = 6;
  int sparkS = 5;
  int peachX = constrain(mouseX, 460, 475);
  int peachY = constrain(mouseY, 575, 584);
  int peachH = 48;
  int peachV = 16;
  int peachS = 10;
  int edgeX = constrain(mouseX, 153, 170);
  int edgeY = constrain(mouseY, 510, 522);
  int edgeH = 34;
  int edgeV = -4;
  int edgeS = 12;
  
  // draw eyes
  drawEyes(marioX, marioY, marioH, marioV, marioS);
  drawEyes(sparkX, sparkY, sparkH, sparkV, sparkS);
  drawEyes(peachX, peachY, peachH, peachV, peachS);
  drawEyes(edgeX, edgeY, edgeH, edgeV, edgeS);
  
  // draw image
  image(poster, 0, 0);
}

void drawEyes(int x, int y, int h, int v, int s){
  fill(#37bffe);
  stroke(#053aa7);
  strokeWeight(2);
  circle(x+h, y+v, s*1.6);
  circle(x-h, y-v, s*1.6);
  fill(0);
  noStroke();
  circle(x+h, y+v, s);
  circle(x-h, y-v, s);
}
