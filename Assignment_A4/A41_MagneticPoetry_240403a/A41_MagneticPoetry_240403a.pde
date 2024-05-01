// Nathan Ellis 4/3/2024
// THE PLAN IS SIMPLE:
// create a class for word blocks
// within word blocks:
// rectangle and text
// ability to follow mouse if it's clicked
// ability to connect to nearby words if released
// "magnet function" if mouse is held down
/* visual display:
- quote source: "A Wizard of Earthsea" by Ursula K. Le Guin
- bird shape in the center
- outer details made of the environmental objects described in the quote
*/

// fonts
PFont bodyGaramond;
PFont titleAgency;
PFont titleVenus;

// word block array
WordBlock[] body = new WordBlock[16];

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
  
  body[0] = new WordBlock("All", 60, 70, 15, rectCol, textCol, bodyGaramond);
  body[1] = new WordBlock("power", 150, 70, 15, rectCol, textCol, bodyGaramond);
  body[2] = new WordBlock("is", 170, 70, 15, rectCol, textCol, bodyGaramond);
  body[3] = new WordBlock("one", 190, 70, 15, rectCol, textCol, bodyGaramond);
  body[4] = new WordBlock("in", 220, 70, 15, rectCol, textCol, bodyGaramond);
  body[5] = new WordBlock("source", 260, 70, 15, rectCol, textCol, bodyGaramond);
  body[6] = new WordBlock("and", 280, 70, 15, rectCol, textCol, bodyGaramond);
  body[7] = new WordBlock("end,", 300, 70, 15, rectCol, textCol, bodyGaramond);
  body[8] = new WordBlock("I", 60, 80, 15, rectCol, textCol, bodyGaramond);
  body[9] = new WordBlock("think.", 150, 80, 15, rectCol, textCol, bodyGaramond);
  body[10] = new WordBlock("Years", 170, 80, 15, rectCol, textCol, bodyGaramond);
  body[11] = new WordBlock("and", 190, 80, 15, rectCol, textCol, bodyGaramond);
  body[12] = new WordBlock("distances,", 220, 80, 15, rectCol, textCol, bodyGaramond);
  body[13] = new WordBlock("stars", 260, 80, 15, rectCol, textCol, bodyGaramond);
  body[14] = new WordBlock("and", 280, 80, 15, rectCol, textCol, bodyGaramond);
  body[15] = new WordBlock("candles,", 300, 80, 15, rectCol, textCol, bodyGaramond);
  
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
