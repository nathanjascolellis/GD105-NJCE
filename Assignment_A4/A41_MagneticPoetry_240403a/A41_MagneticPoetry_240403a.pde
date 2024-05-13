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
WordBlock[] body = new WordBlock[84];

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
  textCol = color(120, 0, 255);
  rectCol = color(50, 20, 93);
  
  body[0] = new WordBlock("All", 262, 265, 15, rectCol, textCol, bodyGaramond);
  body[1] = new WordBlock("power", 287, 265, 15, rectCol, textCol, bodyGaramond);
  body[2] = new WordBlock("is", 235, 285, 15, rectCol, textCol, bodyGaramond);
  body[3] = new WordBlock("one", 254, 285, 15, rectCol, textCol, bodyGaramond);
  body[4] = new WordBlock("in", 282, 285, 15, rectCol, textCol, bodyGaramond);
  body[5] = new WordBlock("source", 303, 285, 15, rectCol, textCol, bodyGaramond);
  body[6] = new WordBlock("and", 353, 285, 15, rectCol, textCol, bodyGaramond);
  body[7] = new WordBlock("end,", 227, 305, 15, rectCol, textCol, bodyGaramond);
  body[8] = new WordBlock("I", 263, 305, 15, rectCol, textCol, bodyGaramond);
  body[9] = new WordBlock("think.", 278, 305, 15, rectCol, textCol, bodyGaramond);
  body[10] = new WordBlock("Years", 325, 305, 15, rectCol, textCol, bodyGaramond);
  body[11] = new WordBlock("and", 366, 305, 15, rectCol, textCol, bodyGaramond);
  body[12] = new WordBlock("distances,", 220, 325, 15, rectCol, textCol, bodyGaramond);
  body[13] = new WordBlock("stars", 288, 325, 15, rectCol, textCol, bodyGaramond);
  body[14] = new WordBlock("and", 328, 325, 15, rectCol, textCol, bodyGaramond);
  body[15] = new WordBlock("candles,", 358, 325, 15, rectCol, textCol, bodyGaramond);
  body[16] = new WordBlock("water", 202, 345, 15, rectCol, textCol, bodyGaramond);
  body[17] = new WordBlock("and", 261, 345, 15, rectCol, textCol, bodyGaramond);
  body[18] = new WordBlock("wind", 287, 345, 15, rectCol, textCol, bodyGaramond);
  body[19] = new WordBlock("and", 328, 345, 15, rectCol, textCol, bodyGaramond);
  body[20] = new WordBlock("wizardry,", 356, 345, 15, rectCol, textCol, bodyGaramond);
  body[21] = new WordBlock("the", 50, 365, 15, rectCol, textCol, bodyGaramond);
  body[22] = new WordBlock("craft", 78, 365, 15, rectCol, textCol, bodyGaramond);
  body[23] = new WordBlock("in", 122, 365, 15, rectCol, textCol, bodyGaramond);
  body[24] = new WordBlock("a", 145, 365, 15, rectCol, textCol, bodyGaramond);
  body[25] = new WordBlock("man's", 161, 365, 15, rectCol, textCol, bodyGaramond);
  body[26] = new WordBlock("hand", 204, 365, 15, rectCol, textCol, bodyGaramond);
  body[27] = new WordBlock("and", 241, 365, 15, rectCol, textCol, bodyGaramond);
  body[28] = new WordBlock("the", 270, 365, 15, rectCol, textCol, bodyGaramond);
  body[29] = new WordBlock("wisdom", 297, 365, 15, rectCol, textCol, bodyGaramond);
  body[30] = new WordBlock("in", 402, 365, 15, rectCol, textCol, bodyGaramond);
  body[31] = new WordBlock("a", 421, 365, 15, rectCol, textCol, bodyGaramond);
  body[32] = new WordBlock("tree's", 70, 385, 15, rectCol, textCol, bodyGaramond);
  body[33] = new WordBlock("root:", 114, 385, 15, rectCol, textCol, bodyGaramond);
  body[34] = new WordBlock("they", 150, 385, 15, rectCol, textCol, bodyGaramond);
  body[35] = new WordBlock("all", 183, 385, 15, rectCol, textCol, bodyGaramond);
  body[36] = new WordBlock("arise", 208, 385, 15, rectCol, textCol, bodyGaramond);
  body[37] = new WordBlock("together.", 247, 385, 15, rectCol, textCol, bodyGaramond);
  body[38] = new WordBlock("My", 313, 385, 15, rectCol, textCol, bodyGaramond);
  body[39] = new WordBlock("name,", 335, 385, 15, rectCol, textCol, bodyGaramond);
  body[40] = new WordBlock("and", 406, 385, 15, rectCol, textCol, bodyGaramond);
  body[41] = new WordBlock("yours,", 90, 405, 15, rectCol, textCol, bodyGaramond);
  body[42] = new WordBlock("and", 138, 405, 15, rectCol, textCol, bodyGaramond);
  body[43] = new WordBlock("the", 165, 405, 15, rectCol, textCol, bodyGaramond);
  body[44] = new WordBlock("true", 193, 405, 15, rectCol, textCol, bodyGaramond);
  body[45] = new WordBlock("name", 226, 405, 15, rectCol, textCol, bodyGaramond);
  body[46] = new WordBlock("of", 260, 405, 15, rectCol, textCol, bodyGaramond);
  body[47] = new WordBlock("the", 280, 405, 15, rectCol, textCol, bodyGaramond);
  body[48] = new WordBlock("sun,", 307, 405, 15, rectCol, textCol, bodyGaramond);
  body[49] = new WordBlock("or", 342, 405, 15, rectCol, textCol, bodyGaramond);
  body[50] = new WordBlock("a", 110, 425, 15, rectCol, textCol, bodyGaramond);
  body[51] = new WordBlock("spring", 126, 425, 15, rectCol, textCol, bodyGaramond);
  body[52] = new WordBlock("of", 177, 425, 15, rectCol, textCol, bodyGaramond);
  body[53] = new WordBlock("water,", 197, 425, 15, rectCol, textCol, bodyGaramond);
  body[54] = new WordBlock("or", 257, 425, 15, rectCol, textCol, bodyGaramond);
  body[55] = new WordBlock("an", 277, 425, 15, rectCol, textCol, bodyGaramond);
  body[56] = new WordBlock("unborn", 298, 425, 15, rectCol, textCol, bodyGaramond);
  body[57] = new WordBlock("child,", 130, 445, 15, rectCol, textCol, bodyGaramond);
  body[58] = new WordBlock("all", 175, 445, 15, rectCol, textCol, bodyGaramond);
  body[59] = new WordBlock("are", 200, 445, 15, rectCol, textCol, bodyGaramond);
  body[60] = new WordBlock("syllables", 226, 445, 15, rectCol, textCol, bodyGaramond);
  body[61] = new WordBlock("of", 292, 445, 15, rectCol, textCol, bodyGaramond);
  body[62] = new WordBlock("the", 312, 445, 15, rectCol, textCol, bodyGaramond);
  body[63] = new WordBlock("great", 100, 465, 15, rectCol, textCol, bodyGaramond);
  body[64] = new WordBlock("word",141, 465, 15, rectCol, textCol, bodyGaramond);
  body[65] = new WordBlock("that", 184, 465, 15, rectCol, textCol, bodyGaramond);
  body[66] = new WordBlock("is", 217, 465, 15, rectCol, textCol, bodyGaramond);
  body[67] = new WordBlock("very", 236, 465, 15, rectCol, textCol, bodyGaramond);
  body[68] = new WordBlock("slowly", 270, 465, 15, rectCol, textCol, bodyGaramond);
  body[69] = new WordBlock("spoken", 70, 485, 15, rectCol, textCol, bodyGaramond);
  body[70] = new WordBlock("by", 118, 485, 15, rectCol, textCol, bodyGaramond);
  body[71] = new WordBlock("the", 161, 485, 15, rectCol, textCol, bodyGaramond);
  body[72] = new WordBlock("shining", 189, 485, 15, rectCol, textCol, bodyGaramond);
  body[73] = new WordBlock("of", 242, 485, 15, rectCol, textCol, bodyGaramond);
  body[74] = new WordBlock("the", 262, 485, 15, rectCol, textCol, bodyGaramond);
  body[75] = new WordBlock("stars.", 50, 505, 15, rectCol, textCol, bodyGaramond);
  body[76] = new WordBlock("There", 181, 505, 15, rectCol, textCol, bodyGaramond);
  body[77] = new WordBlock("is", 225, 505, 15, rectCol, textCol, bodyGaramond);
  body[78] = new WordBlock("no", 247, 505, 15, rectCol, textCol, bodyGaramond);
  body[79] = new WordBlock("other", 38, 525, 15, rectCol, textCol, bodyGaramond);
  body[80] = new WordBlock("power.", 197, 525, 15, rectCol, textCol, bodyGaramond);
  body[81] = new WordBlock("No", 27, 545, 15, rectCol, textCol, bodyGaramond);
  body[82] = new WordBlock("other", 208, 545, 15, rectCol, textCol, bodyGaramond);
  body[83] = new WordBlock("name.", 250, 545, 15, rectCol, textCol, bodyGaramond);
  
  // resetting the mouse to not be carrying anything
  equipped = false;
}

void draw(){
  // initial setup
  background(93, 38, 168);
  
  // ground
  // ground color (expand on later)
  color groundCol = #117700;
  fill(groundCol);
  noStroke();
  ellipse(300, 720, 1200, 300);
  quad(0, 750, 0, 900, 600, 900, 600, 750);
  
  // pond
  // pond color (expand on later)
  color pondCol = #0099DD;
  fill(pondCol);
  ellipse(0, 750, 800, 300);
  
  // tree
  // tree color (expand on later)
  color treeCol = #225533;
  fill(treeCol);
  quad(600, 299, 600, 405, 0, 891, 0, 700);
  
  // updating blocks - body
  for(inc=0; inc<body.length; inc++){
    body[inc].update();
  }
  
  // statement used to make demonstration GIF, but it lags the program, so only uncomment if needed
  /*
  if(frameCount <= 60){
    saveFrame("frames/##.png");
  }
  */
}

void mouseClicked(){
  // because the code runs each word block's grab function in order, the words earlier on in the original order have port priority
  for(inc=0; inc<body.length; inc++){
    body[inc].grab();
  }
}

void mouseDragged(){
  for(inc=0; inc<body.length; inc++){
    body[inc].magnet();
  }
}
