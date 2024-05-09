// Nathan Ellis 5/8/2024
// THE PLAN IS SIMPLE:
// grid space object array
// particle object array
// mouse reactive move indicator
// enable both drag/drop and key controls
int state = 0;

// animation progress variable
int anim = 0;

void setup(){
  size(800,800);
}

void draw(){
  background(0);
  translate(width/2, height/2);
  
  // outline variables
  int hStart = 0;
  int hFinish = 0;
  int w = 0;
  int inc = 0;
  
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
}

// progress state if mouse is clicked
void mouseClicked(){
  if(state == 0 || state == 2){
    state++;
  }
}

// function to create the style of border used in the game
void border(float x, float y, int h, int w, int margin){
  noFill();
  stroke(255);
  strokeWeight(2);
  
  // top corners
  line(x-(w/2), y-(h/2), x-(w/2)+margin, y-(h/2));
  line(x-(w/2), y-(h/2), x-(w/2), y-(h/2)+constrain(margin, 0, h));
  line(x+(w/2), y-(h/2), x+(w/2)-margin, y-(h/2));
  line(x+(w/2), y-(h/2), x+(w/2), y-(h/2)+constrain(margin, 0, h));
  
  // bottom corners
  line(x-(w/2), y+(h/2), x-(w/2)+margin, y+(h/2));
  line(x-(w/2), y+(h/2), x-(w/2), y+(h/2)-constrain(margin, 0, h));
  line(x+(w/2), y+(h/2), x+(w/2)-margin, y+(h/2));
  line(x+(w/2), y+(h/2), x+(w/2), y+(h/2)-constrain(margin, 0, h));
}
