abstract class Button {
  int x,y,w;
  color col;
  Button(int x, int y, int w, color col) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.col = col;
  }
  
  color col() {
    return 0;
  } 
  
  void show() {
    fill(col);
    stroke(255);
    strokeWeight(5);
    ellipse(x,y,w,w); 
    noStroke();
  } 
} 

class BWButton extends Button {
  BWButton(int x, int y, int w, color col) {
    super(x,y,w, col);
  
  } 
  
  color col() {
    return color(random(255)); 
  } 
}

class RainButton extends Button {
  RainButton(int x, int y, int w, color col) {
    super(x,y,w, col);
  
  } 
  
  color col() {
    return color(random(255), 255, 255); 
  } 
}

class RedButton extends Button {
  RedButton(int x, int y, int w, color col) {
    super(x,y,w, col);
  
  } 
  
  color col() {
    return color(random(220,255), random(200, 255), random(200, 255)); 
  } 
}

void mousePressed() {
  for(Button b : buttons) {
    if(dist(b.x,b.y, mouseX,mouseY) < b.w/2) masterButton = b;
  } 
} 
