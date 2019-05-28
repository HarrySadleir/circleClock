abstract class Button {
  int x, y, w;
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
    if (this.equals(masterButton)) {
      stroke(100);
    } else {
      stroke(255);
    }
    strokeWeight(5);
    ellipse(x, y, w, w); 
    noStroke();
  }
} 

class BWButton extends Button {
  BWButton(int x, int y, int w, color col) {
    super(x, y, w, col);
  } 

  color col() {
    return color(random(255));
  }
}

class RainButton extends Button {
  RainButton(int x, int y, int w, color col) {
    super(x, y, w, col);
  } 

  void show() {
    super.show();


    int c = 255;
    float cons = PI/8;
    for (float i = cons; i <= PI-cons; i+=cons) {
      fill(c, 255, 255);
      beginShape(QUADS);
      vertex(x+w/2*sin(i+cons), y+w/2*cos(i+cons));
      vertex(x+w/2*sin(i), y+w/2*cos(i));
      vertex(x+w/2*sin(i+PI), y+w/2*cos(i));
      vertex(x+w/2*sin(i+cons+PI), y+w/2*cos(i+cons));
      endShape(CLOSE);
      c-=255/(PI/cons);
    }
  } 

  color col() {
    return color(random(255), 255, 255);
  }
}

class RedButton extends Button {
  RedButton(int x, int y, int w, color col) {
    super(x, y, w, col);
  } 

  color col() {
    return color(random(240, 255), random(200, 255), random(200, 255));
  }
}

class BlueButton extends Button {
  BlueButton(int x, int y, int w, color col) {
    super(x, y, w, col);
  } 

  color col() {
    return color(random(150, 170), random(200, 255), random(200, 255));
  }
}

void mousePressed() {
  for (Button b : buttons) {
    if (dist(b.x, b.y, mouseX, mouseY) < b.w/2) masterButton = b;
  }
} 

class GreenButton extends Button {
  GreenButton(int x, int y, int w, color col) {
    super(x, y, w, col);
  } 

  color col() {
    return color(random(80, 100), random(200, 255), random(200, 255));
  }
}
