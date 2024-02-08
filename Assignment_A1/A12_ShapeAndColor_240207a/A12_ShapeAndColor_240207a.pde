// Nathan Ellis 2024-02-07
// THE PLAN IS SIMPLE:
// set background
// create center & corner coordinates
// assign outer diamond corners to those coordinates
// assign inner diamond corners to some fraction of coordinates
// use tweak mode to do the coolest thing in recorded history
// Piece: "Pinacoteca do Estado de São Paulo" 
// by Willys de Castro, 1962
void setup(){
  size(600, 900);
}

void draw(){
  // initializing background and variables
  background(235);
  float corner1X = 200.0;
  float corner1Y = 265.0;
  float corner2X = 363.6;
  float corner2Y = 286.7;
  float corner3X = 500.0;
  float corner3Y = 466.8;
  float corner4X = 360.0;
  float corner4Y = 627.1;
  float corner5X = 194.5;
  float corner5Y = 641.8;
  float corner6X = 70.0;
  float corner6Y = 440.0;
  float centerX = 334.3;
  float centerY = 469.0;
  float scale = 0.5;
  
  // more variables, but this time with equations
  float inCorner1X = centerX - (centerX - corner1X) * scale;
  float inCorner1Y = centerY - (centerY - corner1Y) * scale;
  float inCorner2X = centerX + (corner2X - centerX) * scale;
  float inCorner2Y = centerY + (corner2Y - centerY) * scale;
  float inCorner3X = centerX + (corner3X - centerX) * scale;
  float inCorner3Y = centerY + (corner3Y - centerY) * scale;
  float inCorner4X = centerX + (corner4X - centerX) * scale;
  float inCorner4Y = centerY + (corner4Y - centerY) * scale;
  float inCorner5X = centerX - (centerX - corner5X) * scale;
  float inCorner5Y = centerY - (centerY - corner5Y) * scale;
  float inCorner6X = centerX - (centerX - corner6X) * scale;
  float inCorner6Y = centerY - (centerY - corner6Y) * scale;
  
  // creating outer diamonds
  fill(#000000);
  stroke(#000000);
  quad(corner1X, corner1Y, centerX, centerY, corner5X, corner5Y, corner6X, corner6Y);
  fill(#2a5a8e);
  stroke(#2a5a8e);
  quad(corner1X, corner1Y, centerX, centerY, corner3X, corner3Y, corner2X, corner2Y);
  fill(#203e56);
  stroke(#203e56);
  quad(corner3X, corner3Y, centerX, centerY, corner5X, corner5Y, corner4X, corner4Y);
  
  // creating inner diamonds (not done yet)
  fill(#d9e5d5);
  stroke(#d9e5d5);
  quad(inCorner1X, inCorner1Y, centerX, centerY, inCorner5X, inCorner5Y, inCorner6X, inCorner6Y);
  fill(#bfd4bf);
  stroke(#bfd4bf);
  quad(inCorner1X, inCorner1Y, centerX, centerY, inCorner3X, inCorner3Y, inCorner2X, inCorner2Y);
  fill(#889a82);
  stroke(#889a82);
  quad(inCorner3X, inCorner3Y, centerX, centerY, inCorner5X, inCorner5Y, inCorner4X, inCorner4Y);
  
  // output
  if (frameCount == 1){
    save("ShapeAndColor.png");
  }
  
}
