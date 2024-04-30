// Nathan Ellis 4/10/2024
// THE PLAN IS SIMPLE:
// Gather Pokemon GO Regional Championship Usage Data from Fall 2022 to Spring 2024
// Create set of shapes that represent each type
// The more times a type occurs in the top 12 pokemon...
// ...that type's symbol gets bigger
// Create movable scale bar to look at different times
// Symbols are from Pokemon GO's Medal system

// type circle array
TypeCircle[] types = new TypeCircle[18];

// initialize data table
Table typeData;

// table row object
TableRow tourney;

// increment variable
int inc;

// variable for which row is displayed
int rowDisplayed = 1;

// size modifier variable
float szMod = 1.0;

// slider variables
float sliderPos = -360;
boolean dragging = false;

void setup(){
  size(800, 800);
  
  int standardSz = 80;
  
  // read type data to table
  typeData = loadTable("PoGoUsageData.csv", "header");
  
  // adding type circles to array
  types[0] = new TypeCircle("Normal", "pkmnType-01.png", standardSz, 50, 0);
  types[1] = new TypeCircle("Fighting", "pkmnType-15.png", standardSz, -50, 0);
  types[2] = new TypeCircle("Flying", "pkmnType-02.png", standardSz, 0, 50);
  types[3] = new TypeCircle("Poison", "pkmnType-03.png", standardSz, 0, -50);
  types[4] = new TypeCircle("Ground", "pkmnType-04.png", standardSz, 150, 0);
  types[5] = new TypeCircle("Rock", "pkmnType-16.png", standardSz, 75, 75);
  types[6] = new TypeCircle("Bug", "pkmnType-05.png", standardSz, 0, 150);
  types[7] = new TypeCircle("Ghost", "pkmnType-07.png", standardSz, -75, 75);
  types[8] = new TypeCircle("Steel", "pkmnType-17.png", standardSz, -150, 0);
  types[9] = new TypeCircle("Fire", "pkmnType-18.png", standardSz, -75, -75);
  types[10] = new TypeCircle("Water", "pkmnType-08.png", standardSz, 0, -150);
  types[11] = new TypeCircle("Grass", "pkmnType-09.png", standardSz, 75, -75);
  types[12] = new TypeCircle("Electric", "pkmnType-10.png", standardSz, -175, 95);
  types[13] = new TypeCircle("Psychic", "pkmnType-11.png", standardSz, -250, 0);
  types[14] = new TypeCircle("Ice", "pkmnType-13.png", standardSz, -175, -95);
  types[15] = new TypeCircle("Dragon", "pkmnType-12.png", standardSz, 175, 95);
  types[16] = new TypeCircle("Dark", "pkmnType-06.png", standardSz, 250, 0);
  types[17] = new TypeCircle("Fairy", "pkmnType-14.png", standardSz, 175, -95);
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
  
  // divide slider into as many segments as there are rows
  float rowInc = 720/(typeData.getRowCount()-1);
  
  // update row displayed to match slider position
  rowDisplayed = int((sliderPos+360)/rowInc);
  tourney = typeData.getRow(rowDisplayed);
  
  // scale bar - base
  roundCornerRect(-360, 360, 720, 10, 4, 2, #AAAAAA, #CCCCCC);
  
  // scale bar - sliders
  fill(#BBBBBB);
  ellipse(sliderPos, 365, 20, 20);
  
  // text
  String tourneyName = tourney.getString("Tournaments");
  textAlign(CENTER);
  textSize(30);
  fill(255);
  text(tourneyName, 0, -360);
  
  // update type circles
  for(inc=0; inc<types.length; inc++){
    szMod = tourney.getInt(types[inc].name);
    types[inc].update();
  }
}
