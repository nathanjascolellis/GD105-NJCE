// Nathan Ellis 4/10/2024
// THE PLAN IS SIMPLE:
// Gather Pokemon GO Regional Championship Usage Data from Fall 2022 to Spring 2024
// Create set of shapes that represent each type
// The more times a type occurs in the top 12 pokemon...
// ...that type's symbol gets bigger, and other symbols move out of its way
// Create movable scale bar to look at different times
float sliderPos = -360;
boolean dragging = false;

void setup(){
  size(800, 800);
}

void draw(){
  // creating background
  background(55, 203, 36);
  
  // origin to center
  translate(width/2, height/2);
  
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
