// function to create a rectangle with rounded corners
void roundCornerRect(float xPos, float yPos, float xSz, float ySz, float cornerRad, int borderSz, color fillCol, color strkCol){
  // position variable calculation
  float xStart = xPos + cornerRad;
  float xEnd = xPos + xSz - cornerRad;
  float yStart = yPos + cornerRad;
  float yEnd = yPos + ySz - cornerRad;
  
  // inner quads
  strokeWeight(1);
  stroke(fillCol);
  fill(fillCol);
  quad(xStart, yPos, xEnd, yPos, xEnd, yPos+ySz, xStart, yPos+ySz);
  quad(xPos, yStart, xPos, yEnd, xPos+xSz, yEnd, xPos+xSz, yStart);
  
  // arcs
  stroke(strkCol);
  strokeWeight(borderSz);
  arc(xStart, yStart, cornerRad*2, cornerRad*2, PI, PI*1.5);
  arc(xEnd, yStart, cornerRad*2, cornerRad*2, PI*1.5, TAU);
  arc(xEnd, yEnd, cornerRad*2, cornerRad*2, 0, PI*0.5);
  arc(xStart, yEnd, cornerRad*2, cornerRad*2, PI*0.5, PI);
  
  // outline
  line(xStart, yPos, xEnd, yPos);
  line(xPos+xSz, yStart, xPos+xSz, yEnd);
  line(xStart, yPos+ySz, xEnd, yPos+ySz);
  line(xPos, yStart, xPos, yEnd);
}
