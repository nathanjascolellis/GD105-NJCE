// Nathan Ellis 3/18/2024
// THE PLAN IS SIMPLE: 
// draw a book
// animation of a page turning that takes exactly 60 seconds
// each page has the minute number, 0-59
// pages for new hours will have "chapter" and the hour number
// 24 hour clock
int state = 0;
int frameR = 30;
float frameC = 0.0;
int sec = 0;

void setup(){
  size(900, 600);
  frameRate(frameR);
}

void draw(){
  background(60, 35, 0);
  
  // reset page increment, only when second changes over
  if(second() != sec){
    frameC = 0.0;
    sec = second();
  }
  
  // initialize variables for dynamic page
  float botX = 300-(second()*10)-frameC;
  float topX = 210-(second()*7)-(frameC*0.7);
  
  // desk (replace with a photo later)
  noStroke();
  fill(220, 140, 40);
  quad(0, 200, 900, 200, 900, 600, 0, 600);
  
  // book - cover
  stroke(80, 50, 10);
  strokeWeight(3);
  fill(201, 82, 24);
  quad(100, 550, 800, 550, 700, 180, 200, 180);
  quad(120, 530, 780, 530, 690, 187, 210, 187);
  
  // book - backbone
  translate(width/2, 0);
  noStroke();
  quad(-50, 553, 50, 553, 35, 517, -35, 517);
  
  stroke(80, 50, 10);
  strokeWeight(3);
  arc(0, 550, 100, 60, 0, PI);
  
  //static pages
  translate((-width/2), 0);
  fill(255, 241, 174);
  strokeWeight(2);
  quad(130, 520, 420, 520, 420, 180, 220, 180);
  quad(135, 515, 420, 515, 420, 175, 225, 175);
  quad(140, 510, 420, 510, 420, 170, 230, 170);
  quad(145, 505, 420, 505, 420, 165, 235, 165);
  quad(150, 500, 420, 500, 420, 160, 240, 160);
  
  translate(width, 0);
  quad(-130, 520, -420, 520, -420, 180, -220, 180);
  quad(-135, 515, -420, 515, -420, 175, -225, 175);
  quad(-140, 510, -420, 510, -420, 170, -230, 170);
  quad(-145, 505, -420, 505, -420, 165, -235, 165);
  quad(-150, 500, -420, 500, -420, 160, -240, 160);
  
  // page arcs
  translate((-width/2), 0);
  noStroke();
  quad(-32, 550, 32, 550, 32, 190, -32, 190);
  
  stroke(80, 50, 10);
  strokeWeight(2);
  arc(-32, 190, 63, 60, 1.5*PI, TAU);
  arc(32, 190, 63, 60, PI, 1.5*PI);
  
  noFill();
  arc(-32, 530, 63, 60, 1.5*PI, TAU);
  arc(32, 530, 63, 60, PI, 1.5*PI);
  arc(-32, 535, 63, 60, 1.5*PI, TAU);
  arc(32, 535, 63, 60, PI, 1.5*PI);
  arc(-32, 540, 63, 60, 1.5*PI, TAU);
  arc(32, 540, 63, 60, PI, 1.5*PI);
  arc(-32, 545, 63, 60, 1.5*PI, TAU);
  arc(32, 545, 63, 60, PI, 1.5*PI);
  
  fill(201, 82, 24);
  arc(-32, 550, 63, 60, 1.5*PI, TAU);
  arc(32, 550, 63, 60, PI, 1.5*PI);
  
  line(0, 190, 0, 550);
  
  // book backbone - last arc for neatness
  strokeWeight(3);
  noFill();
  arc(0, 530, 80, 50, 0, PI);
  
  // static page numbers
  fill(80, 50, 10);
  textSize(40);
  textAlign(CENTER);
  text(minute()-1, -250, 480);
  text(minute()+1, 250, 480);
  
  // dynamic page fill
  fill(255, 241, 174);
  noStroke();
  if(botX > 0){
    arc(topX, 190, 2*topX, 120, PI, PI*1.5);
    triangle(topX, 130, botX, 450, topX, 450);
  }
  if(botX < 0){
    arc(topX, 190, abs(2*topX), 120, PI*1.5, TAU);
    triangle(topX, 130, botX, 450, topX, 450);
  }
  if(abs(topX) > 50){
    quad(topX, 190, 0.5*topX, 190, 0.5*topX, 450, topX, 450);
  }
  
  // extra line to fix a gap in the dyamic page
  stroke(255, 241, 174);
  strokeWeight(1);
  line(topX, 130, topX, 450);
  
  // dynamic page outline
  stroke(80, 50, 10);
  strokeWeight(2);
  noFill();
  line(botX, 450, topX, 130);
  
  if(botX > 0){
    arc(botX, 530, 2*botX, 160, PI, PI*1.5);
    arc(topX, 190, 2*topX, 120, PI, PI*1.5);
  }
  if(botX < 0){
    arc(botX, 530, abs(2*botX), 160, PI*1.5, TAU);
    arc(topX, 190, abs(2*topX), 120, PI*1.5, TAU);
  }
  
  // update page increment, unless second changes over
  if(sec == second()){
    frameC += 10.0/frameR;
  }
}
