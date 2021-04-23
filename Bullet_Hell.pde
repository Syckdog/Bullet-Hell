ArrayList<Bullet> bulletList;
ArrayList<Enemy> enemyList;
ArrayList<Firework> fireworkList;

Ship myShip;

boolean a, d, s, w;
PImage background;

void setup() {
  size(800, 800);
  myShip = new Ship();
  bulletList = new ArrayList<Bullet>();
  enemyList = new ArrayList<Enemy>();
  imageMode(CENTER);

  fireworkList = new ArrayList<Firework>();
  background = loadImage("background.jpg");
  background.resize(800, 800);
}

void draw() {
  fill(0);
  rect(0, 0, width, height);


  int i = 0;
  while (i < bulletList.size()) {
    Bullet b = bulletList.get(i);
    if (b.alive == true) {
      b.show();
      b.act();
      i++;
    } else {
      bulletList.remove(i);
    }
  }

  int j = 0;
  while (j < enemyList.size()) {
    Enemy e = enemyList.get(j);
    if (e.alive == true) {
      e.show();
      e.act();
      j++;
    } else {
      enemyList.remove(j);
    }
  }

  if (myShip.alive == true) {
    myShip.show();
    myShip.act();
  } else {
  }

  if (frameCount % 40 == 0) {
    enemyList.add(new Enemy());
  }

  while (i < fireworkList.size()) {
    Firework myFirework = fireworkList.get(i);

    if (myFirework.alive == true) {
      myFirework.show();
      myFirework.act();
      i = i + 1;
    } else {
      fireworkList.remove(i);
    }
  }
}

void keyPressed() {
  if (key == 'a') a = true;
  if (key == 'd') d = true;
  if (key == 's') s = true;
  if (key == 'w') w = true;
}

void keyReleased() {
  if (key == 'a') a = false;
  if (key == 'd') d = false;
  if (key == 's') s = false;
  if (key == 'w') w = false;
}

void mousePressed() {
  bulletList.add(new Bullet());
}
