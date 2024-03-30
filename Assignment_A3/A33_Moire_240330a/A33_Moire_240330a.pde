// Nathan Ellis 3/30/2024
// THE PLAN IS SIMPLE:
// add image of card
// distort card slightly based on mouse position (fake 3D)
// add moire pattern as a holographic effect
// also distort moire pattern based on mouse position
// see what happens
PImage hrcnCard;
PVector[] cardCorners = new PVector[4];

void setup(){
  size(800, 800);
}

void draw(){
  // create background
  background(50, 100, 150);
  
  // test of my idea with blank square
  translate(width/2, height/2);
  
  fill(36, 175, 215);
  noStroke();
  
  // shape distortion variables
  float xDist = -0.05*(mouseY-400);
  float yDist = 0.07*(mouseX-400);
  float xPress = 0.05*(mouseX-400);
  float yPress = 0.07*(mouseY-400);
  
  // adding corners into the list
  cardCorners[0] = new PVector(-250+xDist-xPress, -350-yDist-yPress);
  cardCorners[1] = new PVector(250-xDist-xPress, -350+yDist-yPress);
  cardCorners[2] = new PVector(250+xDist-xPress, 350-yDist-yPress);
  cardCorners[3] = new PVector(-250-xDist-xPress, 350+yDist-yPress);
  
  // shape
  quad(cardCorners[0].x, cardCorners[0].y, cardCorners[1].x, cardCorners[1].y, cardCorners[2].x, cardCorners[2].y, cardCorners[3].x, cardCorners[3].y);
  
  // moire lines - color
  fill(95, 207, 244);
  
  // moire lines - slower set
  // moireLines(cardCorners[0], cardCorners[1], cardCorners[2], cardCorners[3], 0.1, 0.05, 0.05);
  
  // moire lines - faster set
  moireLines(cardCorners[0], cardCorners[1], cardCorners[2], cardCorners[3], 0.2, 0.05, 0.03);
}

void moireLines(PVector a, PVector b, PVector c, PVector d, float dsplc, float sz, float buffer){
  // increment and difference variables
  float topEdge = b.x - a.x;
  float botEdge = c.x - d.x;
  float topYDiff = b.y - a.y;
  float botYDiff = c.y - d.y;
  dsplc = dsplc*(mouseX-400);
  float i = a.x-dsplc;
  float iTrue;
  float iEnd;
  float j = d.x-dsplc;
  float jTrue;
  float jEnd;
  i = i-(topEdge*2*(sz+buffer));
  j = j-(botEdge*2*(sz+buffer));
  float iY = a.y;
  float iEndY = a.y;
  float jY = d.y;
  float jEndY = d.y;
  int reps = -2;
  
  // draw lines
  while(i < b.x-1 || j < c.x-1){
    // limiting x values to within rectangle
    iTrue = constrain(i, a.x, b.x);
    jTrue = constrain(j, d.x, c.x);
    iEnd = constrain(i+(topEdge*sz), a.x, b.x);
    jEnd = constrain(j+(botEdge*sz), d.x, c.x);
    
    // reading x values to assign y values
    iY = a.y+(topYDiff*reps*(sz+buffer));
    iEndY = iY+(topYDiff*sz);
    jY = d.y+(botYDiff*reps*(sz+buffer));
    jEndY = jY+(botYDiff*sz);
    
    // drawing rectangle, if applicable
    if(iEnd > iTrue || jEnd > jTrue){
      quad(iTrue, iY, iEnd, iEndY, jEnd, jEndY, jTrue, jY);
    }
    
    // updating distance
    i = i+(topEdge*(sz+buffer));
    j = j+(botEdge*(sz+buffer));
    reps += 1;
  }
}
