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
  frameRate(50); // for gif making purposes
}

void draw(){
  // set background
  background(#444466);
  
  // fish movement
  translate(350-leftDist, 400+downDist);
  
  // fish tail
  fill(#dfda8c);
  stroke(#330055);
  strokeWeight(30);
  ellipse(hParallax, -250-vParallax, -(hParallax*2.5), 200);
  point(hParallax, -350-vParallax);
  
  // fish body
  stroke(#220022);
  strokeWeight(4);
  arc(0, 0, 500, 500, 0, PI);
  
  fill(#330055);
  stroke(#220022);
  arc(0, 0, 500, 500, PI, TAU);
  
  noStroke();
  arc(0, 0, 500, 200+(2*vParallax), 0, PI);
  
  // fish mouth
  fill(#ce40ca);
  stroke(#91268e);
  ellipse(0-hParallax, 100+vParallax, 130, 90);
  
  noFill();
  strokeWeight(8);
  arc(0-hParallax, 170+vParallax, 130, 150, PI+HALF_PI-0.6, PI+HALF_PI+0.6); 
  
  // fish eyes
  fill(#ce40ca);
  strokeWeight(4);
  arc(100-hParallax, -30+vParallax, 100, 180, -0.4, PI);
  arc(-100-hParallax, -30+vParallax, 100, 180, 0, PI+0.4);
  
  fill(#330055);
  arc(100-hParallax, -40+vParallax, 100, 150, -0.35, PI);
  arc(-100-hParallax, -40+vParallax, 100, 150, 0, PI+0.35);
  
  // side spike rims
  stroke(#220022);
  arc(230, 10, 25+(hParallax*0.5), 100, HALF_PI, PI);
  arc(-230, 10, 25-(hParallax*0.5), 100, TAU, PI*2.5);
  
  // spikes - head
  spikeDraw(50, 100, -50, 100, 0, -330, 0);
  spikeDraw(50, 100, -50, 100, 330, 10, HALF_PI);
  spikeDraw(50, 100, -50, 100, -330, 10, (HALF_PI*-1));
  spikeDraw(50, 100, -50, 100, 230, -230, PI*0.25);
  spikeDraw(50, 100, -50, 100, -230, -230, TAU-(PI*0.25));
  
  // headphones - bridge
  fill(#753103);
  noStroke();
  quad(-2-(hParallax*0.6), -245+(vParallax*0.6), 2-(hParallax*0.6), -245+(vParallax*0.6), 2-(hParallax*0.6), -210+(vParallax*0.6), -2-(hParallax*0.6), -210+(vParallax*0.6));
  
  stroke(#a54403);
  arc(0-(hParallax*0.6), -70+(vParallax*0.6), 400+(hParallax*0.2), 350, PI*1.1, PI*1.5);
  arc(0-(hParallax*0.6), -70+(vParallax*0.6), 400-(hParallax*0.2), 350, PI*1.5, PI*1.9);
  
  fill(#330055);
  noStroke();
  quad(-2-(hParallax*0.6), -40+(vParallax*0.6), 2-(hParallax*0.6), -40+(vParallax*0.6), 2-(hParallax*0.6), -210+(vParallax*0.6), -2-(hParallax*0.6), -210+(vParallax*0.6));
  
  stroke(#a54403);
  arc(0-(hParallax*0.6), -40+(vParallax*0.6), 340+(hParallax*0.6), 340, PI*1.14, PI*1.5);
  arc(0-(hParallax*0.6), -40+(vParallax*0.6), 340-(hParallax*0.6), 340, PI*1.5, PI*1.86);
  
  // spikes - brow
  fill(#330055);
  noStroke();
  triangle(85-hParallax, -85+vParallax, 130-hParallax, -80+vParallax, 140-hParallax, -150+vParallax);
  triangle(-85-hParallax, -85+vParallax, -130-hParallax, -80+vParallax, -140-hParallax, -150+vParallax);
  
  stroke(#220022);
  noFill();
  line(130-hParallax, -80+vParallax, 140-hParallax, -150+vParallax);
  line(140-hParallax, -150+vParallax, 85-hParallax, -85+vParallax);
  line(-130-hParallax, -80+vParallax, -140-hParallax, -150+vParallax);
  line(-140-hParallax, -150+vParallax, -85-hParallax, -85+vParallax);
  
  // spikes - belly
  fill(#dfda8c);
  noStroke();
  triangle(170, 240, 160, 150, 85, 205);
  triangle(-170, 240, -160, 150, -85, 205);
  
  stroke(#220022);
  line(170, 240, 160, 150);
  line(170, 240, 85, 205);
  line(-170, 240, -160, 150);
  line(-170, 240, -85, 205);
  
  // headphone pads
  stroke(#fed0a6);
  strokeWeight(10);
  line(210-(hParallax*0.6), -70+(vParallax*0.6), 190-(hParallax*0.7), -120+(vParallax*0.6));
  line(-210-(hParallax*0.6), -70+(vParallax*0.6), -190-(hParallax*0.7), -120+(vParallax*0.6));
  
  fill(#db641b);
  stroke(#db641b);
  strokeWeight(2);
  quad(190-(hParallax*0.6), 110+(vParallax*0.6), 190-(hParallax*0.6), -90+(vParallax*0.6), 200-(hParallax*0.6), -90+(vParallax*0.6), 200-(hParallax*0.6), 110+(vParallax*0.6));
  quad(200-(hParallax*0.6), -90+(vParallax*0.6), 200-(hParallax*0.6), 110+(vParallax*0.6), 220-(hParallax*0.6), 85+(vParallax*0.6), 220-(hParallax*0.6), -65+(vParallax*0.6));
  quad(-190-(hParallax*0.6), 110+(vParallax*0.6), -190-(hParallax*0.6), -90+(vParallax*0.6), -200-(hParallax*0.6), -90+(vParallax*0.6), -200-(hParallax*0.6), 110+(vParallax*0.6));
  quad(-200-(hParallax*0.6), -90+(vParallax*0.6), -200-(hParallax*0.6), 110+(vParallax*0.6), -220-(hParallax*0.6), 85+(vParallax*0.6), -220-(hParallax*0.6), -65+(vParallax*0.6));
  
  stroke(#a54403);
  strokeWeight(4);
  line(190-(hParallax*0.6), 110+(vParallax*0.6), 200-(hParallax*0.6), 110+(vParallax*0.6));
  line(190-(hParallax*0.6), -90+(vParallax*0.6), 200-(hParallax*0.6), -90+(vParallax*0.6));
  line(-190-(hParallax*0.6), 110+(vParallax*0.6), -200-(hParallax*0.6), 110+(vParallax*0.6));
  line(-190-(hParallax*0.6), -90+(vParallax*0.6), -200-(hParallax*0.6), -90+(vParallax*0.6));
  line(200-(hParallax*0.6), 110+(vParallax*0.6), 220-(hParallax*0.6), 85+(vParallax*0.6));
  line(200-(hParallax*0.6), -90+(vParallax*0.6), 220-(hParallax*0.6), -65+(vParallax*0.6));
  line(-200-(hParallax*0.6), 110+(vParallax*0.6), -220-(hParallax*0.6), 85+(vParallax*0.6));
  line(-200-(hParallax*0.6), -90+(vParallax*0.6), -220-(hParallax*0.6), -65+(vParallax*0.6));
  
  arc(190-(hParallax*0.6), 10+(vParallax*0.6), 30+(hParallax*0.65), 200, HALF_PI, PI*1.5);
  arc(-190-(hParallax*0.6), 10+(vParallax*0.6), 30-(hParallax*0.65), 200, PI*1.5, PI*2.5);
  
  fill(#f89c4b);
  ellipse(220-(hParallax*0.6), 10+(vParallax*0.6), 30+(hParallax*0.5), 150);
  ellipse(-220-(hParallax*0.6), 10+(vParallax*0.6), 30-(hParallax*0.5), 150);
  
  stroke(#fed0a6);
  strokeWeight(10);
  line(190-(hParallax*0.7), -60+(vParallax*0.6), 158-(hParallax*0.9), -110+(vParallax*0.6));
  line(-190-(hParallax*0.7), -60+(vParallax*0.6), -158-(hParallax*0.9), -110+(vParallax*0.6));
  
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
  
  // output
  if(frameCount <= 40){
    saveFrame("frames/##.png");
  }
}

void spikeDraw(int aX, int aY, int bX, int bY, int cX, int cY, float r){
  // reposition
  translate(cX, cY);
  rotate(r);
  
  // inner fill of spike
  fill(#330055);
  noStroke();
  triangle(aX, aY, bX, bY, 0, 0);
  
  //create midpoints
  float mAX = midpoint(aX, 0);
  float mAY = midpoint(aY, 0);
  float mBX = midpoint(bX, 0);
  float mBY = midpoint(bY, 0);
  
  // increment
  float i = mBX;
  float j = 0;
  
  // tip
  fill(#ce40ca);
  triangle(mAX, mAY, mBX, mBY, 0, 0);
  
  // add curved tip border here
  strokeWeight(10);
  
  stroke(#330055);
  for(i=mBX; i <= mAX-1; i+=1){
    point(i, (cos(j)*10)+mAY+5);
    j+=0.15;
  }
  j=0;
  
  stroke(#ce40ca);
  for(i=mBX+1; i <= mAX-2; i+=1){
    point(i, (cos(j)*10)+mAY-5);
    j+=0.15;
  }
  j=0;
  
  stroke(#91268e);
  for(i=mBX; i <= mAX-1; i+=1){
    point(i, (cos(j)*10)+mAY);
    j+=0.15;
  }
  
  // outer border
  strokeWeight(4);
  stroke(#220022);
  line(aX, aY, 0, 0);
  line(bX, bY, 0, 0);
  
  // restore original position
  rotate(r*-1);
  translate(-cX, -cY);
}

float midpoint(int a, int b){
  return b-((b-a)/2);
}
