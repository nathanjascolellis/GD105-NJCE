// Nathan Ellis 2024-02-08
// THE PLAN IS SIMPLE:
// Source Material: "Exceptional People Deserve Special Concessions"
// AND "Everyone's Work is Equally Important"
// From Jenny Holzer's "Truisms"
// Intersperse them in between each other line-for-line
// 1 word per line, except put "work is" together
// "everyone's..." should be clear and in front
// "exceptional..." is an echo in the background

void setup(){
  size(700, 900);
}

void draw(){
  // setting up canvas
  background(#000000);
  translate(width * 0.5, 0);
  
  // text setup - first wave
  textSize(78);
  fill(#5d2507);
  textAlign(CENTER);
  
  // text generation - first wave
  text("exceptional", 0, 90);
  text("people", 0, 270);
  text("deserve", 0, 450);
  text("special", 0, 630);
  text("concessions", 0, 810);
  
  // text setup - final wave (i did this first because it kinda 
  // determines the whole text layout)
  fill(#FFFFFF);
  
  // a huge wave of text generation is approaching - final wave
  text("everyone's", 0, 180);
  text("work is", 0, 360);
  text("equally", 0, 540);
  text("important", 0, 720);
}
