class Ship {

  float x, y, size, speed;
  PImage ship;
  boolean alive;
  int n = 30;

  Ship() {
    x = width/2;
    y = height/2;
    size = 100;
    speed = 5;
    ship = loadImage("Ship.png");
    alive = true;
  }

  void show() {
    image (ship, x, y, size, size);
  }

  void act() {
    if (w) y = y - speed;
    if (s) y = y + speed;
    if (a) x = x - speed;
    if (d) x = x + speed;
    
    if (x < size/2) x = size/2;
    if (x > (width - size/2)) x = (width - size/2);
    if (y < size/2) y = size/2;
    if (y > (height - size/2)) y = (height - size/2);
    
   
  }
}
