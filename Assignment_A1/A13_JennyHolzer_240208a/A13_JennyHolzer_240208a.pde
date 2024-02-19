// Nathan Ellis 2024-02-08
// THE PLAN IS SIMPLE:
// Source Material: "Exceptional People Deserve Special Concessions"
// AND "Everyone's Work is Equally Important"
// From Jenny Holzer's "Truisms"
// Intersperse them in between each other line-for-line
// 1 word per line, except put "work is" together
// "everyone's..." should be clear and in front
// "exceptional..." is an echo in the background
PFont rockwell;

void setup(){
  size(700, 900);
  rockwell = loadFont("Rockwell-BoldItalic-78.vlw");
}

void draw(){
  // setting up canvas
  background(#000000);
  translate(width * 0.5, 20);
  int textY = 15;
  
  // text setup - first wave
  textFont(rockwell);
  fill(#fe9352);
  textAlign(CENTER);
  
  // text generation - first wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - second wave
  fill(#ed7b28);
  textY = 30;
  
  // text generation - second wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - third wave
  fill(#b94a0e);
  textY = 45;
  
  // text generation - third wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - fourth wave
  fill(#8f3a07);
  textY = 60;
  
  // text generation - fourth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - fifth wave
  fill(#6f2c07);
  textY = 75;
  
  // text generation - fifth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - sixth wave
  fill(#5d2507);
  textY = 90;
  
  // text generation - sixth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - seventh wave
  fill(#6f2c07);
  textY = 105;
  
  // text generation - seventh wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - eighth wave
  fill(#8f3a07);
  textY = 120;
  
  // text generation - eighth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - ninth wave
  fill(#b94a0e);
  textY = 135;
  
  // text generation - ninth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - tenth wave
  fill(#ed7b28);
  textY = 150;
  
  // text generation - tenth wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - eleventh wave
  fill(#fe9352);
  textY = 165;
  
  // text generation - eleventh wave
  text("exceptional", 0, textY);
  textY += 180;
  text("people", 0, textY);
  textY += 180;
  text("deserve", 0, textY);
  textY += 180;
  text("special", 0, textY);
  textY += 180;
  text("concessions", 0, textY);
  
  // text setup - final wave (i did this first because it kinda 
  // determines the whole text layout)
  fill(#FFFFFF);
  
  // a huge wave of text generation is approaching - final wave
  text("everyone's", 0, 180);
  text("work is", 0, 360);
  text("equally", 0, 540);
  text("important", 0, 720);
  
  // output
  if (frameCount == 1){
    save("Truisms.png");
  }
  
}
