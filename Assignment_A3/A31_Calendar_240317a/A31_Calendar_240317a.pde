// Nathan Ellis 3/17/2024
// THE PLAN IS SIMPLE:
// a sine wave
// amplitude = month
// color = day
// movement speed = year
color[] dayCols = new color[31];
PVector[] monAmps = new PVector[12];

void setup(){
  // canvas
  size(800, 800);
  frameRate(abs(year()-2000));
  
  // setup variables
  int dayRed = 209;
  int dayBlu = 0;
  int dayGrn = 0;
  float monInc = 1.80;
  float monIncInc = 0.15;
  int i;
  
  // arrays
  for(i=0; i<31; i++){
    dayCols[i] = color(dayRed, dayBlu, dayGrn);
    if(dayRed > 0 && dayBlu == 0){
      dayRed -= 19;
      dayGrn += 19;
    } else if(dayGrn > 0 && dayRed == 0){
      dayGrn -= 19;
      dayBlu += 19;
    } else if(dayBlu > 0 && dayGrn == 0){
      dayBlu -= 19;
      dayRed += 19;
    }
  }
  
  for(i=11; i>=0; i--){
    monAmps[i] = new PVector(monInc, monIncInc);
    monInc -= 0.1;
    monIncInc -= 0.01;
  }
}

void draw(){
  // set background
  background(230);
  
  // inner border for style points
  noStroke();
  fill(190);
  quad(150, 50, 650, 50, 650, 750, 150, 750);
  quad(50, 150, 50, 650, 750, 650, 750, 150);
  arc(150, 150, 200, 200, PI, 1.5*PI);
  arc(650, 150, 200, 200, 1.5*PI, TAU);
  arc(650, 650, 200, 200, 0, 0.5*PI);
  arc(150, 650, 200, 200, 0.5*PI, PI);
  
  // let's just see if I can even make the sine wave I want
  translate(0, height/2);
  stroke(dayCols[day()-1]);
  strokeWeight(5);
  
  int wavX = 51;
  int PwavX = 50;
  float ampl = 12.0;
  float amplInc = monAmps[month()-1].x;
  float amplIncInc = monAmps[month()-1].y;
  
  while(wavX <= 750){
    line(PwavX, sin((PwavX*0.15)+frameCount)*ampl, wavX, sin((wavX*0.15)+frameCount)*ampl);
    wavX++;
    PwavX++;
    if(wavX <= 400){
      ampl += amplInc;
      if(PwavX % 30 == 0){
        amplInc -= amplIncInc;
      }
    }
    if(wavX > 400){
      ampl -= amplInc;
      if(PwavX % 30 == 0){
        amplInc += amplIncInc;
      }
    }
  }
  
  // rectangles for neatness
  noStroke();
  fill(230);
  quad(0, -100, 50, -100, 50, 100, 0, 100);
  quad(750, -100, 800, -100, 800, 100, 750, 100);
}
