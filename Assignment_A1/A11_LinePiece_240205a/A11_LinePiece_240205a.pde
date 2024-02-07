// Nathan Ellis 2024-02-05
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
  background(255);
  int stripe1AX = 300;
  int stripe1BX = 700;
  int stripe1Y = 100;
  int stripe2X = 100;
  int stripe2Y = 310;
  float tria1AX = 350.0;
  float tria1AY = 400.0;
  float tria1BX = 600.0;
  float tria1BY = 200.0;
  float tria2AX = 350.0;
  float tria2AY = 400.0;
  float tria2BX = 600.0;
  float tria2BY = 200.0;
  float tria3AX = 600.0;
  float tria3AY = 200.0;
  float tria3BY = 250.0;
  float tria4AX = 555.0;
  float tria4AY = 425.0;
  float tria4BX = 700.0;
  float tria4BY = 500.0;
  float stripe3AX = 555.0;
  float stripe3AY = 425.0;
  float stripe3BY = 500.0;
  
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
    line(stripe1AX, stripe1Y, stripe1BX, stripe1Y);
    stripe1Y += 5;
    stripe1AX -= 5;
    stripe1BX -= 5;
  }
  
  stripe1BX -= 10;
  
  while (stripe1Y <= 300){
    line(stripe1AX, stripe1Y, stripe1BX, stripe1Y);
    stripe1Y += 5;
    stripe1AX -= 5;
    stripe1BX -= 15;
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
  
  while (stripe3BY > 250){
    line(stripe3AX, stripe3AY, 700, stripe3BY);
    stripe3AX += 0.8;
    stripe3AY -= 4.0;
    stripe3BY -= 4.5;
  }
  
  while (tria1AY < 700){
    triangle(500, 700, tria1AX, tria1AY, tria1BX, tria1BY);
    tria1AX += 1.7;
    tria1AY += 3.4;
    tria1BX -= 1.1;
    tria1BY += 5.6;
  }
  
  while (tria2AY > 300){
    triangle(300, 300, tria2AX, tria2AY, tria2BX, tria2BY);
    tria2AX -= 2.0;
    tria2AY -= 4.0;
    tria2BX -= 12.0;
    tria2BY += 4.0;
  }
  
  while (tria3BY > 100){
    triangle(700, 100, tria3AX, tria3AY, 700, tria3BY);
    tria3AX += 3.0;
    tria3AY -= 3.0;
    tria3BY -= 4.5;
  }
  
  while (tria4AY < 700){
    triangle(500, 700, tria4AX, tria4AY, tria4BX, tria4BY);
    tria4AX -= 1.1;
    tria4AY += 5.3;
    tria4BX -= 3.8;
    tria4BY += 3.8;
  }
  
  // Output
  if (frameCount == 1){
    save("NJCE_LinePiece.png");
  }
}
