// Nathan Ellis 3/6/2024
// Map Piece - Pokemon GO Overworld
// THE PLAN IS SIMPLE:
// Make the background the color of the roads
// Add buildings on top of that
// Add a gradient for the sky
// Pokestops
IntList pokestopX;
IntList pokestopY;

void setup(){
  size(400, 800);
}

void draw(){
  // set background
  background(#00774e);
  translate(400, 800);
  rotate(PI);
  
  // intialize variables
  int skyH = 510;
  int skyAlpha = 0;
  int i = 0;
  
  // initialize lists
  pokestopX = new IntList();
  pokestopX.append(60);
  pokestopX.append(320);
  pokestopX.append(380);
  pokestopX.append(206);
  pokestopX.append(260);
  pokestopX.append(122);
  
  pokestopY = new IntList();
  pokestopY.append(380);
  pokestopY.append(340);
  pokestopY.append(290);
  pokestopY.append(483);
  pokestopY.append(563);
  pokestopY.append(552);
  
  // building indicators
  fill(#42e59a);
  stroke(#d9ef43);
  strokeWeight(10);
  triangle(-10, -10, -10, 260, 241, -10);
  quad(400, -10, -50, 381, 74, 436, 485, 269);
  triangle(-10, 441, -10, 482, 35, 458);
  strokeWeight(8);
  line(114, 459, 485, 316);
  line(74, 474, -10, 508);
  strokeWeight(6);
  quad(151, 481, 244, 519, 580, 431, 410, 384);
  quad(100, 497, 0, 532, 104, 568, 198, 536);
  strokeWeight(3);
  quad(-4, 547, -4, 554, 19, 559, 28, 555);
  triangle(-4, 562, -4, 573, 10, 565);
  quad(225, 549, 126, 579, 179, 592, 293, 570);
  quad(270, 535, 287, 531, 425, 577, 390, 575);
  triangle(306, 526, 405, 505, 405, 561);
  quad(38, 561, -20, 589, 5, 600, 86, 577);
  strokeWeight(2);
  triangle(107, 587, -13, 618, 267, 629);
  triangle(313, 579, 203, 601, 472, 625);
  
  // sky gradient
  fill(#7ee3fc); // without this, the color picker for the gradient doesn't show up in tweak mode
  noStroke();
  while (skyAlpha <= 100){
    fill(#7ee3fc, skyAlpha);
    quad(-1, skyH, 401, skyH, 401, 801, -1, 801);
    skyH += 2;
    skyAlpha += 1;
  }
  
  // foreground pokestops
  for (i=0; i<=2; i+=1){
    fill(#2afcf0);
    stroke(#2afcf0);
    strokeWeight(1);
    translate(pokestopX.get(i), pokestopY.get(i));
    ellipse(0, 0, 30, 15);
    stroke(#3377cc);
    line(0, 0, 0, 50);
    fill(#2afcf0);
    noStroke();
    quad(0, 35, 20, 45, 0, 55, -20, 45);
    fill(#0ed6e3);
    quad(0, 35, -20, 45, -16, 47, 0, 39);
    noFill();
    stroke(#3377cc);
    strokeWeight(6);
    circle(-2, 91, 80);
    strokeWeight(14);
    circle(-2, 91, 45);
    fill(#3377cc);
    noStroke();
    circle(-2, 91, 25);
    noFill();
    stroke(#2afcf0);
    strokeWeight(6);
    circle(2, 89, 80);
    strokeWeight(14);
    circle(2, 89, 45);
    fill(#2afcf0);
    noStroke();
    circle(2, 89, 25);
    stroke(#01b9c4);
    strokeWeight(2);
    line(18, 89, 30, 89);
    line(-14, 89, -26, 89);
    translate((pokestopX.get(i)*-1), (pokestopY.get(i)*-1));
  }
  
  // background pokestops
  for (i=3; i<=5; i+=1){
    fill(#2afcf0);
    stroke(#2afcf0);
    strokeWeight(1);
    translate(pokestopX.get(i), pokestopY.get(i));
    ellipse(0, 0, 14, 7);
    stroke(#3377cc);
    line(0, 0, 0, 25);
    fill(#01b9c4);
    noStroke();
    quad(0, 21, 0, 31, 12, 40, 12, 31);
    fill(#03536d);
    quad(0, 21, 0, 31, -12, 40, -12, 31);
    fill(#2afcf0);
    quad(0, 30, 12, 40, 0, 50, -12, 40);
    // finish making the rest of the pokestop
    translate((pokestopX.get(i)*-1), (pokestopY.get(i)*-1));
  }
  
  // clouds
  fill(#FFFFFF, 180);
  noStroke();
  ellipse(0, 683, 70, 30);
  ellipse(40, 700, 67, 30);
  ellipse(10, 704, 70, 30);
  ellipse(78, 682, 70, 30);
  ellipse(112, 689, 98, 37);
  ellipse(69, 703, 101, 38);
  ellipse(269, 732, 65, 25);
  ellipse(148, 695, 66, 30);
  ellipse(121, 674, 50, 25);
  ellipse(155, 684, 70, 30);
  ellipse(200, 732, 70, 19);
  ellipse(270, 725, 104, 26);
  ellipse(242, 741, 70, 30);
  ellipse(191, 759, 28, 14);
  ellipse(118, 752, 100, 31);
  ellipse(358, 754, 104, 40);
  ellipse(388, 738, 70, 24);
  ellipse(374, 719, 81, 36);
  ellipse(342, 705, 50, 26);
  ellipse(408, 707, 70, 29);
  ellipse(416, 731, 97, 24);
  ellipse(173, 777, 62, 30);
  ellipse(146, 767, 152, 30);
  
  // output
  if (frameCount == 1){
    save("Map_PokemonGO.png");
  }
}
