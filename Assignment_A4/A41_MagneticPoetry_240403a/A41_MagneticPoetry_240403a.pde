// Nathan Ellis 4/3/2024
// THE PLAN IS SIMPLE:
// create a class for word blocks
// within word blocks:
// rectangle and text
// ability to follow mouse if it's clicked
// ability to connect to nearby words if released

// word block array
WordBlock[] poem = new WordBlock[7];

// shared variables
boolean equipped;
int inc;

void setup(){
  size(800, 800);
  
  // adding words to poem array
  poem[0] = new WordBlock("according", 60, 70);
  poem[1] = new WordBlock("to", 205, 70);
  poem[2] = new WordBlock("all", 238, 70);
  poem[3] = new WordBlock("known", 280, 70);
  poem[4] = new WordBlock("laws", 375, 70);
  poem[5] = new WordBlock("of", 447, 70);
  poem[6] = new WordBlock("aviation", 490, 70);
  
  // resetting the mouse to not be carrying anything
  equipped = false;
}

void draw(){
  // initial setup
  background(240, 240, 255);
  
  // updating blocks
  for(inc=0; inc<poem.length; inc++){
    poem[inc].update();
  }
}

void mouseClicked(){
  // because the code runs each word block's grab function in order, the words earlier on in the original order have port priority
  for(inc=0; inc<poem.length; inc++){
    poem[inc].grab();
  }
}
