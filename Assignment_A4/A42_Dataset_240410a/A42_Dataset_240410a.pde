// Nathan Ellis 4/10/2024
// THE PLAN IS SIMPLE:
// Gather Pokemon GO Regional Championship Usage Data from Fall 2022 to Spring 2024
// Create set of shapes that represent each type
// The more times a type occurs in the top 12 pokemon...
// ...that type's symbol gets bigger, and other symbols move out of its way
// Create movable scale bar to look at different times

// type circle array
TypeCircle[] types = new TypeCircle[12];

// increment variable
int inc;

// slider variables
float sliderPos = -360;
boolean dragging = false;

void setup(){
  size(800, 800);
  
  int standardSz = 80;
  
  // adding type circles to array
  types[0] = new TypeCircle("normal", #AAAAAA, standardSz, 50, 0);
  types[1] = new TypeCircle("fighting", #AAAAAA, standardSz, -50, 0);
  types[2] = new TypeCircle("flying", #AAAAAA, standardSz, 0, 50);
  types[3] = new TypeCircle("poison", #AAAAAA, standardSz, 0, -50);
  types[4] = new TypeCircle("ground", #AAAAAA, standardSz, 150, 0);
  types[5] = new TypeCircle("rock", #AAAAAA, standardSz, 75, 75);
  types[6] = new TypeCircle("bug", #AAAAAA, standardSz, 0, 150);
  types[7] = new TypeCircle("ghost", #AAAAAA, standardSz, -75, 75);
  types[8] = new TypeCircle("steel", #AAAAAA, standardSz, -150, 0);
  types[9] = new TypeCircle("fire", #AAAAAA, standardSz, -75, -75);
  types[10] = new TypeCircle("water", #AAAAAA, standardSz, 0, -150);
  types[11] = new TypeCircle("grass", #AAAAAA, standardSz, 75, -75);
}

void draw(){
  // creating background
  background(55, 203, 36);
  
  // origin to center
  translate(width/2, height/2);
  
  // update type circles
  for(inc=0; inc<types.length; inc++){
    types[inc].update();
  }
  
  // slider position update
  if(mousePressed == false){
    dragging = false;
  }
  
  if(mousePressed && mouseY-(height/2) <= 380 && mouseY-(height/2) >= 360){
    dragging = true;
  }
  
  if(dragging){
    sliderPos = constrain(mouseX-(width/2), -360, 360);
  }
  
  // scale bar - base
  roundCornerRect(-360, 360, 720, 10, 4, 2, #AAAAAA, #CCCCCC);
  
  // scale bar - slider
  fill(#BBBBBB);
  ellipse(sliderPos, 365, 20, 20);
}
