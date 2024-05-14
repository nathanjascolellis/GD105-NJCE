// function to create the style of border used in the game
void border(float x, float y, int h, int w, int margin){
  rectMode(CORNER);
  noFill();
  stroke(255);
  strokeWeight(2);
  
  // top corners
  line(x-(w/2), y-(h/2), x-(w/2)+margin, y-(h/2));
  line(x-(w/2), y-(h/2), x-(w/2), y-(h/2)+constrain(margin, 0, h));
  line(x+(w/2), y-(h/2), x+(w/2)-margin, y-(h/2));
  line(x+(w/2), y-(h/2), x+(w/2), y-(h/2)+constrain(margin, 0, h));
  
  // bottom corners
  line(x-(w/2), y+(h/2), x-(w/2)+margin, y+(h/2));
  line(x-(w/2), y+(h/2), x-(w/2), y+(h/2)-constrain(margin, 0, h));
  line(x+(w/2), y+(h/2), x+(w/2)-margin, y+(h/2));
  line(x+(w/2), y+(h/2), x+(w/2), y+(h/2)-constrain(margin, 0, h));
}
