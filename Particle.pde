class Firework {

  float x, y, vx, vy, ax, ay;
  float size;
  PImage firework;
  boolean alive;

  Firework() {
    x = myShip.x;
    y = myShip.y;
    vx = random(-5, 5);
    vy = random(-5, 5);
    size = random(5, 50);
    firework = loadImage("star.png");
    alive = true;
    ax = 0;
    ay = 1;
  }

  void show() {
    image(firework, x, y, size, size);
  }

  void act() {
    x = x + vx;
    y = y + vy;
    vx = vx + ax;
    vy = vy + ay;

    if (x < 0 || x > width || y < 0 || y > height) {
      alive = false;
    }
  }
}
