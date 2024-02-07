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
  background(245);
  float corner1X = 195.0;
  float corner1Y = 250.0;
  float corner2X = 419.8;
  float corner2Y = 295.0;
  float corner3X = 550.0;
  float corner3Y = 450.0;
  float corner4X = 400.0;
  float corner4Y = 600.0;
  float corner5X = 200.0;
  float corner5Y = 625.0;
  float corner6X = 100.0;
  float corner6Y = 458.2;
  float centerX = 350.0;
  float centerY = 450.0;
  float scale = 0.4;
  
  //probably a bad idea
  strokeWeight(0);
  
  // creating outer diamonds
  fill(#000000);
  quad(corner1X, corner1Y, centerX, centerY, corner5X, corner5Y, corner6X, corner6Y);
  fill(#2a5a8e);
  quad(corner1X, corner1Y, centerX, centerY, corner3X, corner3Y, corner2X, corner2Y);
  fill(#203e56);
  quad(corner3X, corner3Y, centerX, centerY, corner5X, corner5Y, corner4X, corner4Y);
  
  // creating inner diamonds (not done yet)
  fill(#d9e5d5);
  quad(corner1X, corner1Y, centerX, centerY, corner5X, corner5Y, corner6X, corner6Y);
  fill(#bfd4bf);
  quad(corner1X, corner1Y, centerX, centerY, corner3X, corner3Y, corner2X, corner2Y);
  fill(#889a82);
  quad(corner3X, corner3Y, centerX, centerY, corner5X, corner5Y, corner4X, corner4Y);
}
