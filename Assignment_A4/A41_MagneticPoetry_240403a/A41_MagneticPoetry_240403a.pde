// Nathan Ellis 4/3/2024
// THE PLAN IS SIMPLE:
// create a class for word blocks
// within word blocks:
// rectangle and text
// ability to follow mouse if it's clicked
// ability to connect to nearby words if released
// "magnet function" if mouse is held down
/* visual display:
- person made of good text
- cape and sword made of bad text
- title card at the bottom
*/

// fonts
PFont bodyGaramond;
PFont titleAgency;
PFont titleVenus;

// word block array
WordBlock[] body = new WordBlock[7];

// shared variables
boolean equipped;
int inc;

// text preset variables
color textCol;
color rectCol;

void setup(){
  size(600, 900);
  
  // initializing fonts
  bodyGaramond = loadFont("Garamond-Bold-15.vlw");
  titleAgency = loadFont("AgencyFB-Bold-55.vlw");
  titleVenus = loadFont("VenusRisingRg-Regular-20.vlw");
  
  // adding words to body array
  textCol = color(255, 120, 0);
  rectCol = color(129, 39, 21);
  
  body[0] = new WordBlock("according", 60, 70, 15, rectCol, textCol, bodyGaramond);
  body[1] = new WordBlock("to", 150, 70, 15, rectCol, textCol, bodyGaramond);
  body[2] = new WordBlock("all", 170, 70, 15, rectCol, textCol, bodyGaramond);
  body[3] = new WordBlock("known", 190, 70, 15, rectCol, textCol, bodyGaramond);
  body[4] = new WordBlock("laws", 220, 70, 15, rectCol, textCol, bodyGaramond);
  body[5] = new WordBlock("of", 260, 70, 15, rectCol, textCol, bodyGaramond);
  body[6] = new WordBlock("aviation", 280, 70, 15, rectCol, textCol, bodyGaramond);
  
  // resetting the mouse to not be carrying anything
  equipped = false;
}

void draw(){
  // initial setup
  background(113, 35, 20);
  
  
  // updating blocks - body
  for(inc=0; inc<body.length; inc++){
    body[inc].update();
  }
}

void mouseClicked(){
  // because the code runs each word block's grab function in order, the words earlier on in the original order have port priority
  for(inc=0; inc<body.length; inc++){
    body[inc].grab();
  }
}
