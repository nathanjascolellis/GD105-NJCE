// Nathan Ellis 3/7/2024
// THE PLAN IS SIMPLE:
// import images
// create repeating structure function
// assign images to list (if possible)
// repeatedly call function using different images from the list
// flowers???
PImage backdrop;
PImage flor;
PImage fan;
StringList flowers;
StringList fans;

void setup(){
  size(500, 800);
  
  // load background
  backdrop = loadImage("backgroundflowers.jpg");
}

void draw(){
  // create background
  scale(0.28);
  image(backdrop, 0, -124);
  scale(1);
  translate(250, 0);
  
  // create lists
  flowers = new StringList();
  flowers.append("calendula.png");
  flowers.append("iris.png");
  flowers.append("daffodil.png");
  fans = new StringList();
  fans.append("fan1.png");
  fans.append("fan2.png");
  fans.append("fan3.png");
  
  // create simple variables
  int i;
  int y = 100;
  float smol = 0.28;
  
  // loading images the intended way to see if thats the problem
  flor = loadImage("calendula.png");
  fan = loadImage("fan1.png");
  
  while(y < 500){
    for(i=0; i<=2; i+=1){
      translate(0, y);
      scale(smol);
      // flor = loadImage(flowers.get(i));
      // fan = loadImage(fans.get(i));
      image(flor, 0, -50);
      rotate(0.5);
      image(flor, 0, -50);
      rotate(-0.25);
      image(flor, 0, -50);
      rotate(-0.5);
      image(flor, 0, -50);
      rotate(-0.25);
      image(flor, 0, -50);
      rotate(0.5);
      image(fan, 0, 0);
      scale(1);
      translate(0, (y*-1));
      y+=50;
      smol-=0.01;
    }
  }
}
