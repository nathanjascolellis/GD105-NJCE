// Nathan Ellis 3/30/2024
// THE PLAN IS SIMPLE:
// add background for a card
// distort card slightly based on mouse position (fake 3D)
// add moire pattern as a holographic effect
// also distort moire pattern based on mouse position
// add card features over the background
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
  moireLines(cardCorners[0], cardCorners[1], cardCorners[2], cardCorners[3], 0.1, 0.05, 0.05);
  
  // moire lines - faster set
  moireLines(cardCorners[0], cardCorners[1], cardCorners[2], cardCorners[3], 0.2, 0.05, 0.03);
  
  // card image - variables
  float pullX = (mouseX-400);
  float pullY = (mouseY-400);
  
  // card image - center circle
  noFill();
  stroke(203, 233, 251, 170);
  strokeWeight(120);
  ellipseMode(CENTER);
  ellipse(pullX*0.04, pullY*0.04, 180, 180);
  
  // card image - inner small clouds
  translate(pullX*0.06, pullY*0.06);
  noStroke();
  fill(203, 233, 251, 170);
  ellipseMode(CORNER);
  int n;
  for(n=0; n<3; n+=1){
    rotate(PI/3);
    ellipse(0, 140, 50, 30);
    ellipse(0, -140, -50, -30);
  }
  rotate(PI*-1);
  translate(pullX*-0.06, pullY*-0.06);
  
  // card image - inner big clouds
  translate(pullX*0.02, pullY*0.02);
  rotate(PI/6);
  int cloudW = 120;
  int cloudH = 80;
  for(n=0; n<3; n+=1){
    rotate(PI/3);
    ellipse(0, 120, cloudW, cloudH);
    ellipse(0, -120, cloudW*-1, cloudH*-1);
    cloudW -= 20;
    cloudH -= 20;
  }
  rotate((PI*-7)/6);
  translate(pullX*-0.02, pullY*-0.02);
}

void moireLines(PVector a, PVector b, PVector c, PVector d, float dsplc, float sz, float buffer){
  // initialize variables
  dsplc = dsplc*(mouseX-400);
  float alpha = -1-(dsplc/200);
  
  PVector topStart;
  PVector botStart;
  PVector topEnd;
  PVector botEnd;
  
  float topStartX;
  float topStartY = a.y;
  float topEndX;
  float topEndY = a.y;
  float botStartX;
  float botStartY = d.y;
  float botEndX;
  float botEndY = d.y;
  
  // draw bars
  while(alpha < 1){
    topStart = linterp(a, b, alpha);
    botStart = linterp(d, c, alpha);
    topEnd = linterp(a, b, alpha+sz);
    botEnd = linterp(d, c, alpha+sz);
    
    topStartX = constrain(topStart.x, a.x, b.x);
    topEndX = constrain(topEnd.x, a.x, b.x);
    botStartX = constrain(botStart.x, d.x, c.x);
    botEndX = constrain(botEnd.x, d.x, c.x);
    
    if(a.y < b.y){
      topStartY = constrain(topStart.y, a.y, b.y);
      topEndY = constrain(topEnd.y, a.y, b.y);
    }
    
    if(a.y > b.y){
      topStartY = constrain(topStart.y, b.y, a.y);
      topEndY = constrain(topEnd.y, b.y, a.y);
    }
    
    if(d.y < c.y){
      botStartY = constrain(botStart.y, d.y, c.y);
      botEndY = constrain(botEnd.y, d.y, c.y);
    }
    
    if(d.y > c.y){
      botStartY = constrain(botStart.y, c.y, d.y);
      botEndY = constrain(botEnd.y, c.y, d.y);
    }
    
    if(topStartX >= a.x || botStartX >= d.x){
      quad(topStartX, topStartY, topEndX, topEndY, botEndX, botEndY, botStartX, botStartY);
    }
    alpha += sz+buffer;
  }
}

// linear interpolation function
PVector linterp(PVector a, PVector b, float p){
  float ptX = a.x+(p*(b.x-a.x));
  float ptY = a.y+(p*(b.y-a.y));
  
  PVector pt = new PVector(ptX, ptY);
  return pt;
}
