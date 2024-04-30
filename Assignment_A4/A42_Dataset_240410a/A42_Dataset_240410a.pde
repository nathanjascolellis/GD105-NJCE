// Nathan Ellis 4/10/2024
// THE PLAN IS SIMPLE:
// Gather Pokemon GO Regional Championship Usage Data from Fall 2022 to Spring 2024
// Create set of shapes that represent each type
// The more times a type occurs in the top 12 pokemon...
// ...that type's symbol gets bigger
// Create movable scale bar to look at different times

// type circle array
TypeCircle[] types = new TypeCircle[18];

// increment variable
int inc;

// slider variables
float sliderPos = -360;
boolean dragging = false;

void setup(){
  size(800, 800);
  
  int standardSz = 80;
  
  // adding type circles to array
  types[0] = new TypeCircle("normal", "pkmnType-01.png", standardSz, 50, 0);
  types[1] = new TypeCircle("fighting", "pkmnType-15.png", standardSz, -50, 0);
  types[2] = new TypeCircle("flying", "pkmnType-02.png", standardSz, 0, 50);
  types[3] = new TypeCircle("poison", "pkmnType-03.png", standardSz, 0, -50);
  types[4] = new TypeCircle("ground", "pkmnType-04.png", standardSz, 150, 0);
  types[5] = new TypeCircle("rock", "pkmnType-16.png", standardSz, 75, 75);
  types[6] = new TypeCircle("bug", "pkmnType-05.png", standardSz, 0, 150);
  types[7] = new TypeCircle("ghost", "pkmnType-07.png", standardSz, -75, 75);
  types[8] = new TypeCircle("steel", "pkmnType-17.png", standardSz, -150, 0);
  types[9] = new TypeCircle("fire", "pkmnType-18.png", standardSz, -75, -75);
  types[10] = new TypeCircle("water", "pkmnType-08.png", standardSz, 0, -150);
  types[11] = new TypeCircle("grass", "pkmnType-09.png", standardSz, 75, -75);
  types[12] = new TypeCircle("electric", "pkmnType-10.png", standardSz, -175, 95);
  types[13] = new TypeCircle("psychic", "pkmnType-11.png", standardSz, -250, 0);
  types[14] = new TypeCircle("ice", "pkmnType-13.png", standardSz, -175, -95);
  types[15] = new TypeCircle("dragon", "pkmnType-12.png", standardSz, 175, 95);
  types[16] = new TypeCircle("dark", "pkmnType-06.png", standardSz, 250, 0);
  types[17] = new TypeCircle("fairy", "pkmnType-14.png", standardSz, 175, -95);
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
