// Nathan Ellis 3/10/2024
// THE PLAN IS SIMPLE:
// create coordinate lists
// link number in list to frame count
// draw lines based on lists
// tell it to stop when it gets to the end of the lists
IntList drawX;
IntList drawY;
int strokeRed = 180;
int strokeGrn = 0;
int strokeBlu = 0;
int drawProg = 1;

void setup(){
  // initialize background
  size(800, 700);
  background(255);
  frameRate(40);
}

void draw(){
  // initialize lists
  drawX = new IntList();
  drawX.append(593);
  drawX.append(637);
  drawX.append(688);
  drawX.append(651);
  drawX.append(669);
  drawX.append(711);
  drawX.append(668);
  drawX.append(657);
  drawX.append(694);
  drawX.append(654);
  drawX.append(619);
  drawX.append(583);
  drawX.append(617);
  drawX.append(638);
  drawX.append(623);
  drawX.append(621);
  drawX.append(590);
  drawX.append(552);
  drawX.append(522);
  drawX.append(513);
  drawX.append(495);
  drawX.append(510);
  drawX.append(547);
  drawX.append(512);
  drawX.append(484);
  drawX.append(445);
  drawX.append(483);
  drawX.append(467);
  drawX.append(424);
  drawX.append(470);
  drawX.append(472);
  drawX.append(421);
  drawX.append(474);
  drawX.append(492);
  drawX.append(483);
  drawX.append(347);
  drawX.append(182);
  drawX.append(99);
  drawX.append(23);
  drawX.append(23);
  drawX.append(124);
  drawX.append(276);
  drawX.append(478);
  drawX.append(652);
  drawX.append(717);
  drawX.append(744);
  drawX.append(730);
  drawX.append(487);
  drawX.append(272);
  drawX.append(114);
  drawX.append(271);
  drawX.append(304);
  drawX.append(253);
  drawX.append(312);
  drawX.append(279);
  drawX.append(487);
  drawX.append(540);
  drawX.append(530);
  drawX.append(549);
  drawX.append(611);
  drawX.append(582);
  drawX.append(578);
  drawX.append(592);
  drawX.append(591);
  drawX.append(553);
  drawX.append(622);
  drawX.append(591);
  drawX.append(593);
  
  drawY = new IntList();
  drawY.append(290);
  drawY.append(272);
  drawY.append(283);
  drawY.append(260);
  drawY.append(223);
  drawY.append(212);
  drawY.append(210);
  drawY.append(176);
  drawY.append(159);
  drawY.append(168);
  drawY.append(148);
  drawY.append(179);
  drawY.append(176);
  drawY.append(154);
  drawY.append(134);
  drawY.append(81);
  drawY.append(130);
  drawY.append(131);
  drawY.append(82);
  drawY.append(133);
  drawY.append(156);
  drawY.append(176);
  drawY.append(181);
  drawY.append(152);
  drawY.append(178);
  drawY.append(167);
  drawY.append(189);
  drawY.append(208);
  drawY.append(216);
  drawY.append(220);
  drawY.append(240);
  drawY.append(259);
  drawY.append(252);
  drawY.append(276);
  drawY.append(293);
  drawY.append(298);
  drawY.append(284);
  drawY.append(258);
  drawY.append(337);
  drawY.append(494);
  drawY.append(560);
  drawY.append(589);
  drawY.append(566);
  drawY.append(572);
  drawY.append(584);
  drawY.append(573);
  drawY.append(530);
  drawY.append(512);
  drawY.append(542);
  drawY.append(500);
  drawY.append(533);
  drawY.append(467);
  drawY.append(380);
  drawY.append(464);
  drawY.append(534);
  drawY.append(507);
  drawY.append(511);
  drawY.append(458);
  drawY.append(512);
  drawY.append(516);
  drawY.append(441);
  drawY.append(375);
  drawY.append(305);
  drawY.append(238);
  drawY.append(216);
  drawY.append(207);
  drawY.append(238);
  drawY.append(290);
  
  // stroke settings
  noFill();
  stroke(strokeRed, strokeGrn, strokeBlu);
  strokeWeight(4);
  
  // update stroke color
  if(strokeRed > 0 && strokeBlu == 0){
    strokeRed -= 30;
    strokeGrn += 30;
  } else if(strokeGrn > 0 && strokeRed == 0){
    strokeGrn -= 30;
    strokeBlu += 30;
  } else if(strokeBlu > 0 && strokeGrn == 0){
    strokeBlu -= 30;
    strokeRed += 30;
  }
  
  // draw cat
  line(drawX.get(drawProg-1), drawY.get(drawProg-1), drawX.get(drawProg), drawY.get(drawProg));
  
  // progress report
  drawProg += 1;
  
  if(drawProg == drawX.size() && drawProg == drawY.size()){
    drawProg = 1;
  }
  
  // output
  if (frameCount == drawX.size()-1){
    save("one_line_rainbow_cat.png");
  }
}
