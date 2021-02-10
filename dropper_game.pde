boolean falling;
int x;
int y;

int bcX;
int bcY;

void setup() {
  size (800, 800);
  falling = false;
  bcY = 520;
  bcX = width/2;
}

void draw() {
  background (0);
  fill (255);
  noStroke();

  if (falling) {
    ellipse (x, y, 40, 40); //draw drop
    if (y >620) {
      falling = false;
    }
    y++;
  } else {
    ellipse (mouseX, mouseY, 40, 40);
  }
  rect (bcX, bcY, 80, 80);
}

void mousePressed() {
  if (!falling) {
    falling = true;
    x = mouseX;
    y = mouseY;
  }
}

void keyPressed() {
  if (key == 'a' || keyCode == LEFT) {
    bcX = bcX - 10;
  } else if (key == 'd' || keyCode == RIGHT) {
    bcX = bcX + 10;
  }
}
