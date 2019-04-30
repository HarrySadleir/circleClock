PGraphics clock;
Slider s;
ArrayList<Circle> circles;
ArrayList<Circle> stunted;
ArrayList<Button> buttons;

Button masterButton;



void setup() {
  circles = new ArrayList<Circle>();
  stunted = new ArrayList<Circle>();
  buttons = new ArrayList<Button>();
  s = new Slider(300, 650, 200, 50, 10, 200, "frequency");

  colorMode(HSB);

  buttons.add(new BWButton(550, 650, 75, color(150)));
  buttons.add(new RainButton(700, 650, 75, 0));
  buttons.add(new RedButton(850, 650, 75, color(255, 255, 255)));
  buttons.add(new BlueButton(1000, 650, 75, color(150, 255, 255)));
  buttons.add(new GreenButton(1150, 650, 75, color(85, 255, 255)));

  masterButton = buttons.get(0);

  size(1400, 800);
  clock = createGraphics(width, height);
}

void draw() {
  background(0);
  clock();
  s.show();




  for (Button b : buttons) {
    b.show();
  } 

  //make circles maybe
  for (int i = 0; i < s.val(); i++) {
    //is randomly choosing x and y values optimal? no
    int x = int(random(width));
    int y = int(random(1*height/4, 3*height/4));

    /*in being a confusing variable, meaning in another circle, but also not in
     the number area, but i named the var before that was a thing so here we are.
     
     checks if location is valid
     */
    boolean in = false;
    for (Circle c : circles) {
      if (dist(c.x, c.y, x, y) -2< c.r) {
        in = true;
      }
    }
    for (Circle c : stunted) {
      if (dist(c.x, c.y, x, y) -2< c.r) {
        in = true;
      }
    }
    if (clock.get(x, y) != #FFFFFF) in = true;


    if (!in) circles.add(new Circle(x, y));
  }

  //do the circly things
  for (Circle c : circles) {
    c.show();
    c.grow();
  }

  //do the stunted circly things
  for (int i = stunted.size()-1; i >=0; i --) {
    stunted.get(i).dying();
    stunted.get(i).show();
    if (stunted.get(i).life == 0) {
      stunted.remove(i);
    }
  }

  //checks if stunted, then moves accordingly
  for (int i = circles.size()-1; i >=0; i--) {
    boolean edged = false;
    Circle c = circles.get(i);

    //touching another circle in either array?
    for (Circle other : circles) {
      if (dist(c.x, c.y, other.x, other.y) < c.r+other.r && c!=other) {
        edged = true;
      }
    }
    for (Circle other : stunted) {
      if (c!=other && dist(c.x, c.y, other.x, other.y) < c.r+other.r) {
        edged = true;
      }
    }

    //is it touching non-white?
    for (float a = 0; a < TWO_PI; a+=.1) {
      float x = c.r*cos(a);
      float y = c.r*sin(a);
      if (clock.get(c.x+(int)x, c.y+(int)y) != #FFFFFF) edged = true;
    } 

    if (edged) stunted.add(circles.remove(i));
  }
}