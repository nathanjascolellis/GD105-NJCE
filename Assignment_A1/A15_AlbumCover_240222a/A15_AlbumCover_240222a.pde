// Nathan Ellis 2/22/2024
// Album Cover Piece: "Endgame" by Rebel Scum and Tasha Baxter
// THE PLAN IS SIMPLE:
// Make background buildings
// Make a gradient (???) for the glow behind the UFO
// Make the shape of the UFO
// Make the etchings
// Add text


void setup(){
  size(800, 800);
}

void draw(){
  // set background
  background(#3d1000);
  translate(400, 500);
  
  // initialize variables
  int gradDiam = 600;
  int gradAlpha = 0;
  
  // silhouette buildings
  fill(#2f0c00);
  stroke(#2f0c00);
  quad(-250, -200, -150, -200, -190, 300, -290, 300);
  quad(-120, -150, -150, -200, -190, 300, -160, 300);
  
  // gradient
  noStroke();
  fill(#d8614d); // opacity argument prevents the color picker in tweak mode from showing
  while(gradAlpha <= 50){
    fill(#d8614d, gradAlpha);
    circle(0, 0, gradDiam);
    gradDiam -= 8;
    gradAlpha += 1;
  }
  
  // UFO body
  fill(#be543e);
  stroke(#be543e);
  quad(10, -200, 14, -200, 30, -150, 15, -150);
  quad(-10, -200, -14, -200, -30, -150, -15, -150);
  quad(30, -150, 15, -150, 34, -60, 80, -47);
  quad(-30, -150, -15, -150, -34, -60, -80, -47);
  
  fill(#d16f56);
  stroke(#d16f56);
  quad(10, -200, -10, -200, -15, -150, 15, -150);
  quad(34, -60, -34, -60, -15, -150, 15, -150);
  
  fill(#fabea2);
  stroke(#fabea2);
  quad(15, -150, -15, -150, -24, -105, 24, -105);
  
  fill(#c64c34);
  stroke(#c64c34);
  quad(-34, 60, -80, 67, -50, 132, -24, 130);
  quad(34, 60, 80, 67, 50, 132, 24, 130);
  
  fill(#c7432c);
  stroke(#c7432c);
  quad(34, -60, -34, -60, -34, 60, 34, 60);
  quad(-34, -60, -34, 60, -90, 70, -90, -45);
  quad(34, -60, 34, 60, 90, 70, 90, -45);
  
  fill(#e3654c);
  stroke(#e3654c);
  quad(-34, 60, 34, 60, 24, 130, -24, 130);
  
  // title text
  fill(#AAAAAA);
  textSize(15);
  textAlign(CENTER);
  text("X .   X X V .   M M X X I I I", 0, -400);
  textSize(30);
  text("REBEL SCUM & TASHA BAXTER", 0, -360);
  textSize(60);
  text("ENDGAME", 0, -300);
}
