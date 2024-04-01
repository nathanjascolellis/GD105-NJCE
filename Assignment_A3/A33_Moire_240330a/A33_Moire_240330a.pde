// Nathan Ellis 3/30/2024
// THE PLAN IS SIMPLE:
// add background for a card
// distort card slightly based on mouse position (fake 3D)
// add moire pattern as a holographic effect
// also distort moire pattern based on mouse position
// add card features over the background
PVector[] cardCorners = new PVector[4];
boolean outputSaved;

void setup(){
  size(800, 800);
  outputSaved = false;
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
  moireLines(cardCorners[0], cardCorners[1], cardCorners[2], cardCorners[3], 0.1, 0.04, 0.05);
  
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
  
  // card image - outer big clouds
  translate(pullX*0.05, pullY*0.05);
  rotate(PI/4);
  ellipseMode(CENTER);
  ellipse(50, 180, 160, 110);
  ellipse(-50, -180, 160, 110);
  rotate(PI/-4);
  translate(pullX*-0.05, pullY*-0.05);
  
  // card image - outer thin clouds
  translate(pullX*0.07, pullY*0.07);
  rotate(PI/2.5);
  ellipse(120, 200, 135, 50);
  ellipse(-120, -200, 135, 50);
  rotate(PI/-2.5);
  translate(pullX*-0.07, pullY*-0.07);
  
  // card image - outer small clouds
  translate(pullX*0.075, pullY*0.075);
  rotate(PI/5);
  ellipse(80, 245, 65, 40);
  ellipse(-80, -245, 65, 40);
  rotate(PI/-5);
  translate(pullX*-0.075, pullY*-0.075);
  
  // card image - outer tiny clouds
  translate(pullX*0.085, pullY*0.085);
  rotate(PI/10);
  ellipse(70, 240, 40, 20);
  ellipse(-70, -240, 40, 20);
  rotate(PI/-10);
  translate(pullX*-0.085, pullY*-0.085);
  
  // card text boxes
  translate(pullX*0.055, pullY*0.055);
  fill(168, 169, 59, 140);
  quad(-140, -315, -215, -240, -140, -165, -65, -240);
  quad(-50, -240, 215, -240, 155, -300, -110, -300);
  
  fill(137, 60, 169, 140);
  quad(160, -120, 215, -65, 160, -10, 105, -65);
  quad(70, -85, -215, -85, -135, -15, 140, -15);
  quad(-215, -95, -190, -120, -70, -120, -95, -95);
  
  rotate(PI);
  fill(168, 169, 59, 140);
  quad(160, -105, 215, -50, 160, 5, 105, -50);
  quad(70, -70, -215, -70, -135, 0, 140, 0);
  
  fill(60, 121, 169, 140);
  quad(160, -225, 215, -170, 160, -115, 105, -170);
  quad(70, -190, -215, -190, -135, -120, 140, -120);
  
  fill(169, 83, 60, 140);
  quad(160, -345, 215, -290, 160, -235, 105, -290);
  quad(70, -310, -215, -310, -135, -240, 140, -240);
  rotate(PI*-1);
  
  // output
  if(abs(mouseX-400) < 10 && abs(mouseY-400) < 10 && outputSaved == false){
    save("MoireTradingCard.png");
    outputSaved = true;
  }
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
