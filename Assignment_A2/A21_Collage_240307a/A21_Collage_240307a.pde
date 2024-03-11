// Nathan Ellis 3/7/2024
// THE PLAN IS SIMPLE:
// import images
// create repeating structure function
// assign images to list (if possible)
// repeatedly call function using different images from the list
// flowers???
PImage backdrop;
PImage flor1;
PImage flor2;
PImage flor3;
PImage fan1;
PImage fan2;
PImage fan3;

void setup(){
  size(500, 800);
  
  // load background
  backdrop = loadImage("backgroundflowers.jpg");
}

void draw(){
  // create background
  image(backdrop, 0, 0, 500, 800);
  translate(250, 0);
  
  // load images
  flor1 = loadImage("calendula.png");
  flor2 = loadImage("iris.png");
  flor3 = loadImage("daffodil.png");
  
  fan1 = loadImage("fan1.png");
  fan2 = loadImage("fan2.png");
  fan3 = loadImage("fan3.png");
  
  // load simple variables
  int yPos = 0;
  int fnScale = 160;
  
  while(yPos < 800 && fnScale > 0){
    bouquet(flor1, fan1, yPos, fnScale);
    yPos += (fnScale*0.75);
    fnScale -= 15;
    bouquet(flor2, fan2, yPos, fnScale);
    yPos += (fnScale*0.75);
    fnScale -= 15;
    bouquet(flor3, fan3, yPos, fnScale);
    yPos += (fnScale*0.75);
    fnScale -= 15;
  }
}

void bouquet(PImage flor, PImage fan, int y, int scaling){
  // positioning
  translate(0, y);
  
  // place images
  image(flor, scaling*-0.5, scaling*-0.1, scaling, scaling);
  rotate(0.5);
  image(flor, scaling*0.82, scaling*-0.31, scaling, scaling);
  rotate(-0.25);
  image(flor, scaling*0.16, scaling*-0.1, scaling, scaling);
  rotate(-0.5);
  image(flor, scaling*-1.16, scaling*-0.1, scaling, scaling);
  rotate(-0.25);
  image(flor, scaling*-1.81, scaling*-0.23, scaling, scaling);
  rotate(0.5);
  image(fan, scaling*-1.30, scaling*0.63, scaling*2.6, scaling*1.5);
  
  // positioning
  translate(0, y*-1);
}
