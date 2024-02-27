// Nathan Ellis 2/22/2024
// Album Cover Piece: "Endgame" by Rebel Scum and Tasha Baxter
// THE PLAN IS SIMPLE:
// Make background buildings
// Make a gradient (???) for the glow behind the UFO
// Make the shape of the UFO
// Make the etchings
// Add text
PFont TNR;
PFont VenusS;
PFont VenusB;

void setup(){
  size(800, 800);
  TNR = loadFont("TimesNewRomanPSMT-15.vlw");
  VenusS = loadFont("VenusRisingRg-Regular-30.vlw");
  VenusB = loadFont("VenusRisingRg-Regular-60.vlw");
}

void draw(){
  // set background
  background(#3d1000);
  translate(400, 500);
  
  // initialize variables
  int gradDiam = 600;
  int gradAlpha = 0;
  int eyeR = 95;
  int eyeL = eyeR * -1; 
  float eyeH = 28.0;
  
  // silhouette buildings
  fill(#2f0c00);
  stroke(#2f0c00);
  quad(-250, -200, -150, -200, -190, 300, -290, 300);
  quad(-120, -150, -150, -200, -190, 300, -145, 300);
  
  quad(270, -70, 160, -70, 200, 300, 310, 300);
  quad(150, -50, 160, -70, 200, 300, 180, 300);
  
  // gradient
  noStroke();
  fill(#d8614d); // opacity argument prevents the color picker in tweak mode from showing
  while(gradAlpha <= 40){
    fill(#d8614d, gradAlpha);
    circle(0, 0, gradDiam);
    gradDiam -= 8;
    gradAlpha += 1;
  }
  
  // UFO body - top section sides
  fill(#be543e);
  stroke(#be543e);
  quad(10, -200, 14, -200, 30, -150, 15, -150);
  quad(-10, -200, -14, -200, -30, -150, -15, -150);
  quad(30, -150, 15, -150, 34, -60, 80, -47);
  quad(-30, -150, -15, -150, -34, -60, -80, -47);
  
  // UFO body - top section middle
  fill(#d16f56);
  stroke(#d16f56);
  quad(10, -200, -10, -200, -15, -150, 15, -150);
  quad(34, -60, -34, -60, -15, -150, 15, -150);
  
  // UFO body - top section center
  fill(#fabea2);
  stroke(#fabea2);
  quad(15, -150, -15, -150, -24, -105, 24, -105);
  
  // UFO body - bottom section sides
  fill(#c64c34);
  stroke(#c64c34);
  quad(-34, 60, -80, 67, -50, 132, -24, 130);
  quad(34, 60, 80, 67, 50, 132, 24, 130);
  
  // UFO body - middle section
  fill(#c7432c);
  stroke(#c7432c);
  quad(34, -60, -34, -60, -34, 60, 34, 60);
  quad(-34, -60, -34, 60, -90, 70, -90, -45);
  quad(34, -60, 34, 60, 90, 70, 90, -45);
  
  // UFO body - bottom section middle
  fill(#e3654c);
  stroke(#e3654c);
  quad(-34, 60, 34, 60, 24, 130, -24, 130);
  
  // UFO lines - center
  stroke(#f6a878);
  line(0, 127, 0, 63);
  line(0, 57, 0, -57);
  line(0, -63, 0, -147);
  line(0, -153, 0, -197);
  
  // UFO lines - bottom section
  line(15, 127, 25, 63);
  line(-15, 127, -25, 63);
  line(-27, 85, 27, 85);
  line(-34, 85, -67, 88);
  line(34, 85, 67, 88);
  line(-47, 86, -32, 105);
  line(47, 86, 32, 105);
  line(-23, 108, -19, 108);
  line(23, 108, 19, 108);
  line(10, 108, -10, 108);
  line(10, 108, 8, 127);
  line(-10, 108, -8, 127);
  line(-48, 108, -42, 127);
  line(48, 108, 42, 127);
  line(-48, 108, -58, 109);
  line(48, 108, 58, 109);
  
  // UFO lines - middle section sides
  line(52, -52, 52, -15);
  line(52, 25, 52, 60);
  line(71, -47, 71, -11);
  line(71, 29, 71, 64);
  line(85, 55, 71, 52);
  line(71, 52, 58, 62);
  line(-85, 55, -71, 52);
  line(-71, 52, -58, 62);
  line(52, 49, 36, 47);
  line(71, 37, 36, 32);
  line(-52, 49, -36, 47);
  line(-71, 37, -36, 32);
  line(52, -28, 36, -32);
  line(85, -33, 71, -37);
  line(52, -28, 71, -37);
  line(-52, -28, -36, -32);
  line(-85, -33, -71, -37);
  line(-52, -28, -71, -37);
  
  // UFO lines - middle section center
  line(-23, 57, 23, 57);
  line(-20, 40, 20, 40);
  line(-23, 57, -20, 40);
  line(23, 57, 20, 40);
  line(-20, 28, 20, 28);
  line(-20, 26, 20, 26);
  line(-20, 11, 20, 11);
  line(-20, -11, 20, -11);
  line(-20, -31, 20, -31);
  line(-20, -33, 20, -33);
  line(-20, -33, -25, -57);
  line(20, -33, 25, -57);
  
  // UFO eyes
  noStroke();
  gradAlpha = 0;
  fill(#f6a878); // opacity argument prevents the color picker in tweak mode from showing
  while(gradAlpha <= 40){
    fill(#f6a878, gradAlpha);
    quad(34, -5, 34, 5, eyeR, eyeH, eyeR, (eyeH*-1));
    quad(-34, -5, -34, 5, eyeL, eyeH, eyeL, (eyeH*-1));
    eyeR -= 1;
    eyeL += 1;
    eyeH -= 0.5;
    gradAlpha += 1;
  }
  
  // title text
  fill(#AAAAAA);
  textFont(TNR);
  textAlign(CENTER);
  text("X  .     X  X  V  .     M  M  X  X  I  I  I", 0, -400);
  textFont(VenusS);
  text("REBEL SCUM & TASHA BAXTER", 0, -360);
  textFont(VenusB);
  text("ENDGAME", 0, -300);
}
