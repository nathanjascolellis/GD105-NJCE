// THE PLAN IS SIMPLE:
// Set up canvas
// Make background white
// Draw outline
// Use a loop (?????) to draw the stripes within each shape
// Source Art: "12 Forms Derived From A Cube 46" Sol LeWitt, 1984
void setup(){
  size(800, 800);
}

void draw(){
  background(245);
  int stripe1XA = 300;
  int stripe1XB = 700;
  int stripe1Y = 100;
  int stripe2X = 100;
  int stripe2Y = 310;
  
  // Outer Outline
  line(300, 100, 700, 100);
  line(700, 100, 700, 500);
  line(700, 500, 500, 700);
  line(500, 700, 100, 700);
  line(100, 700, 100, 300);
  line(100, 300, 300, 100);
  
  // Inner Outline
  line(100, 300, 300, 300);
  line(300, 300, 600, 200);
  line(600, 200, 700, 100);
  line(300, 300, 500, 700);
  line(600, 200, 500, 700);
  
  // The Hard Part
  while (stripe1Y <= 200){
    line(stripe1XA, stripe1Y, stripe1XB, stripe1Y);
    stripe1Y += 5;
    stripe1XA -= 5;
    stripe1XB -= 5;
  }
  
  stripe1XB -= 10;
  
  while (stripe1Y <= 300){
    line(stripe1XA, stripe1Y, stripe1XB, stripe1Y);
    stripe1Y += 5;
    stripe1XA -= 5;
    stripe1XB -= 15;
  }
  
  while (stripe2X <= 300){
    line(stripe2X, 300, stripe2X, 700);
    stripe2X += 5;
  }
  
  while (stripe2X < 500){
    line(stripe2X, stripe2Y, stripe2X, 700);
    stripe2X += 5;
    stripe2Y += 10;
  }
  
  // Output
  if (frameCount == 1){
    save("NJCE_LinePiece.png");
  }
}
