//PGraphics shenanigans
void clock() {
  int y = 3*height/7;
  clock.beginDraw();
  clock.background(0);
  clock.textAlign(CENTER, CENTER);
  clock.textSize(width*5/14);
  clock.text(nf(hour()%12, 2) + ":" + nf(minute(), 2), width/2, y);
  clock.endDraw();
  //image(clock, 0, 0);
}