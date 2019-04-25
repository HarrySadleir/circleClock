PGraphics clock;

ArrayList<Circle> circles;
ArrayList<Circle> stunted;
void setup() {
  circles = new ArrayList<Circle>();
  stunted = new ArrayList<Circle>();
  
  size(1400, 800);
  clock = createGraphics(width, height);

  colorMode(HSB);
}

void draw() {
  background(0);
  clock();
  
  //make circles maybe
  for (int i = 0; i < 100; i++) {
    //is randomly choosing x and y values optimal? no
    int x = int(random(width));
    int y = int(random(1*height/4,3*height/4));
    
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
    if(clock.get(x,y) != #FFFFFF) in = true;
    
     
    if (!in) circles.add(new Circle(x, y));
  }
  
  //do the circly things
  for (Circle c : circles) {
    c.show();
    c.grow();
  }
  
  //do the stunted circly things
  for(int i = stunted.size()-1; i >=0; i --) {
    stunted.get(i).dying();
    stunted.get(i).show();
    if(stunted.get(i).life == 0) {
      stunted.remove(i);
    }
  }
  
  //checks if stunted, then moves accordingly
  for(int i = circles.size()-1; i >=0; i--) {
    boolean edged = false;
    Circle c = circles.get(i);
    
    //touching another circle in either array?
    for (Circle other : circles) {
      if (dist(c.x, c.y, other.x, other.y) < c.r+other.r && c!=other) {
        edged = true;
      }
    }
    for(Circle other : stunted) {
      if (dist(c.x, c.y, other.x, other.y) < c.r+other.r && c!=other) {
        edged = true;
      }
    }
     
    //is it touching non-white? the laggiest part of the code i think 
    for(int x = c.x - 100; x < c.x + 100; x++) {
    for(int y = c.y - 100; y < c.y + 100; y++) {
        if(clock.get(x,y) != #FFFFFF && dist(c.x, c.y, x, y) < c.r) edged = true;
    }
    }
    
    if(edged) stunted.add(circles.remove(i));
  } 
}