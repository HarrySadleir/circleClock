class Slider {
  int x, cirX, y, w, h, min, max, val;
  String label;
  Slider(int x,int y, int w, int h,int min,int max, String label) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.min = min;
    this.max = max;
    this.cirX = x;
    this.label = label;
   
  } 
  
  void show() {
    rectMode(CENTER);
    fill(100);
    stroke(255);
    strokeWeight(5);
    rect(x,y,w,h);
    ellipse(cirX,y,h,h);
    textAlign(CENTER,CENTER);
    
    fill(255);
    textSize(40);
    text(label, x,y+50);
    noStroke();
  }
  
  int val() {
    return (int)map(cirX, x-w/2,x+w/2,min,max);
  }
  
  void move(int x) { 
    cirX = x;
  }
  
} 

void mouseDragged() {
   if(dist(mouseX, mouseY, s.cirX, s.y) < s.h/2 && mouseX>s.x-s.w/2 && mouseX<s.x+s.w/2)
   s.move(mouseX);
} 
