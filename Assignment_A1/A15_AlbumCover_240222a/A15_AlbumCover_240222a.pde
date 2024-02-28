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
  color gradColor = #d8614d; 
  int eyeR = 110;
  int eyeL = eyeR * -1; 
  float eyeH = 28.0;
  
  // silhouette buildings
  fill(#2f0c00);
  stroke(#2f0c00);
  quad(-250, -200, -150, -200, -190, 300, -290, 300);
  quad(-120, -150, -150, -200, -190, 300, -145, 300);
  
  quad(270, -70, 160, -70, 200, 300, 310, 300);
  quad(150, -50, 160, -70, 200, 300, 180, 300);
  
  quad(-160, 170, -80, 180, -80, 300, -160, 300);
  quad(-80, 200, -30, 205, -30, 300, -80, 300);
  quad(-30, 250, 60, 250, 60, 300, -30, 300);
  quad(60, 190, 90, 180, 90, 300, 60, 300);
  quad(110, 205, 145, 195, 145, 300, 110, 300);
  quad(60, 250, 200, 230, 200, 300, 60, 300);
  
  // gradient
  noStroke();
  while(gradAlpha <= 40){
    fill(gradColor, gradAlpha);
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
  fill(#fabfa6);
  stroke(#fabfa6);
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
  line(0, -158, 0, -197);
  
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
  line(20, 11, 20, -11);
  line(-20, -11, 20, -11);
  line(-20, -31, 20, -31);
  line(-20, -33, 20, -33);
  line(-20, -33, -25, -57);
  line(20, -33, 25, -57);
  
  // middle section center tiny lines
  line(-26, 57, -31, 57);
  line(26, 57, 31, 57);
  line(-23, 40, -27, 40);
  line(23, 40, 27, 40);
  line(20, 30, 20, 28);
  line(-20, 30, -20, 28);
  line(-23, 30, -27, 30);
  line(23, 30, 27, 30);
  line(-23, 28, -27, 28);
  line(23, 28, 27, 28);
  line(20, 26, 20, 24);
  line(-20, 26, -20, 24);
  line(-23, 24, -27, 24);
  line(23, 24, 27, 24);
  line(-23, 11, -27, 11);
  line(23, 11, 27, 11);
  line(-23, 8, -27, 1);
  line(23, 8, 27, 1);
  line(-23, -14, -27, -21);
  line(23, -14, 27, -21);
  line(-23, -31, -27, -31);
  line(23, -31, 27, -31);
  line(-23, -33, -27, -33);
  line(23, -33, 27, -33);
  line(-25, -40, -29, -40);
  line(25, -40, 29, -40);
  line(-27, -47, -31, -47);
  line(27, -47, 31, -47);
  
  // UFO lines - upper section lower
  line(15, -63, 14, -78);
  line(-15, -63, -14, -78);
  line(14, -78, 30, -78);
  line(-14, -78, -30, -78);
  line(14, -90, -14, -90);
  line(14, -90, 20, -105);
  line(-14, -90, -20, -105);
  line(24, -105, -24, -105);
  line(27, -105, 55, -95);
  line(-27, -105, -55, -95);
  line(37, -101, 51, -59);
  line(-37, -101, -51, -59);
  line(47, -73, 59, -69);
  line(-47, -73, -59, -69);
  line(59, -69, 65, -55);
  line(-59, -69, -65, -55);
  
  // UFO lines - upper section middle
  line(37, -101, 40, -114);
  line(-37, -101, -40, -114);
  line(40, -114, 24, -120);
  line(-40, -114, -24, -120);
  line(40, -114, 27, -143);
  line(-40, -114, -27, -143);
  line(34, -128, 39, -126);
  line(-34, -128, -39, -126);
  line(20, -120, 11, -120);
  line(-20, -120, -11, -120);
  line(11, -120, 9, -135);
  line(-11, -120, -9, -135);
  line(-9, -135, 9, -135);
  
  // UFO lines - upper section top
  line(-13, -170, 13, -170);
  line(13, -170, 25, -165);
  line(-13, -170, -25, -165);
  line(-11, -185, 11, -185);
  line(11, -185, 21, -181);
  line(-11, -185, -21, -181);
  
  // UFO eye glow
  noStroke();
  gradAlpha = 0;
  gradColor = #f6a878;
  while(gradAlpha <= 20){
    fill(gradColor, gradAlpha);
    quad(41, -2, 41, 8, eyeR, eyeH, eyeR, (eyeH*-1));
    quad(-41, -2, -41, 8, eyeL, eyeH, eyeL, (eyeH*-1));
    eyeR -= 2;
    eyeL += 2;
    eyeH -= 0.5;
    gradAlpha += 1;
  }
  
  // UFO eyes
  fill(#f6a878);
  quad(41, -2, 41, 8, 71, 12, 71, 1);
  quad(-41, -2, -41, 8, -71, 12, -71, 1);
  
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
