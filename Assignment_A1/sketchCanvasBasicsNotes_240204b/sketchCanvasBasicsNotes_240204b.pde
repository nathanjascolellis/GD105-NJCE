// Setup block: Code runs once immediately when the program is activated
void setup(){
  println("Hello, world!");
  frameRate(5);
  size(800, 800); // can ONLY be run in setup
}

// Draw block: Code runs repeatedly, once each frame
void draw(){
  println(frameCount);
  background(220); // Can use hex values, but need a # in front of them
}
