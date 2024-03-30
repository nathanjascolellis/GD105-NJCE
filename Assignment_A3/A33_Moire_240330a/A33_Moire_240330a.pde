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
  
  fill(0, 150, 200);
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
  
  // moire lines
  fill(20, 170, 220);
  
  float i = cardCorners[0].x;
  float j = cardCorners[3].x;
  float topXDiff = cardCorners[1].x - cardCorners[0].x;
  float botXDiff = cardCorners[2].x - cardCorners[3].x;
  while(i < cardCorners[1].x-1){
    quad(i, cardCorners[0].y, i+(topXDiff*0.05), cardCorners[0].y, j+(botXDiff*0.05), cardCorners[3].y, j, cardCorners[3].y);
    i = i+(topXDiff*0.1);
    j = j+(botXDiff*0.1);
  }
}
