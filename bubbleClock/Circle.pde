//very generic class, could be much better. also screw encapsulation apparently
class Circle {
  int x;
  int y;
  int r;
  int c;
  int life = (int) random(90,110);
  
  Circle(int x_, int y_) {
    x = x_;
    y = y_;
    r = 1;
    
    c = int(random(255));;
  }

  void show() {
    strokeWeight(0);
    stroke(255);
    colorMode(HSB);
    fill(c,255,255);

    ellipse(x, y, r*2, r*2);
  }

  void grow() {
      r++;
  }
  
  void dying() {
      life--;
  } 
}