class Enemy {

  float x, y, vx, vy, size;
  boolean alive;
  PImage enemy;
  float spawnchoice;
  int n = 30;

  Enemy() {
    aim();
    spawnchoice = int(random(0, 4));
    size = 50;
    alive = true;
    enemy = loadImage("enemy.png");
    imageMode(CENTER);
    if (spawnchoice == 0) {
      x = random(width);
      y = 0;
    } else if (spawnchoice == 1) {
      x = random(width);
      y = height - 30;
    } else if (spawnchoice == 2) {
      x = 0;
      y = random(height);
    } else {
      x = width - 30;
      y = random(height);
    }
  }

  void show() {
    image(enemy, x, y, size, size);
  }

  void act() {
    aim();
    x = x + vx;
    y = y + vy;

    int i = 0;
    while (i < bulletList.size()) {
      Bullet myBullet = bulletList.get(i);
      if (dist(myBullet.x, myBullet.y, x, y) < (myBullet.size/2 + size/2)) {
        alive = false;
        myBullet.alive = false;
      }
      i++;
    }

    if (myShip.alive == true) {
      if (dist(x, y, myShip.x, myShip.y) < (size/2 + myShip.size/2)) {
        myShip.alive = false;
        alive = false;
        bulletList = new ArrayList<Bullet>();
        int j = 0;
        while (j < n) {
          fireworkList.add(new Firework());
          j = j + 1;
        }
      }
    }
  }

  void aim() {
    PVector direction = new PVector(myShip.x - x, myShip.y - y);
    if (spawnchoice == 0) {
      direction.setMag(3);
    } else if (spawnchoice == 1) {
      direction.setMag(4);
    } else if (spawnchoice == 2) {
      direction.setMag(2);
    } else {
      direction.setMag(5);
    }
    vx = direction.x;
    vy = direction.y;
  }
}
