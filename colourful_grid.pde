int y;
boolean pressed = true;

void setup() {
  size (800, 800);
}

void draw() {
  stroke (255);
  if (pressed) {
    for (int x = 0; x <= width; x += 100) {
      //rect (x, y, 100, 100);
      for (int y = 0; y <= height; y += 100) {
        rect (x, y, 100, 100);
        fill (random (0, 255), random (0, 255), random (0, 255));
        //println("x: " + x + " y: " + y);
      }
    }
    noLoop();
    pressed = false;
  }
}

void keyPressed() {
  if (keyCode == ' ') {
    pressed = true;
  }
}
