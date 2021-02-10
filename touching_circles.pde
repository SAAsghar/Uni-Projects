void setup() {
  size (400, 400);
}

void draw() {
  background (0);

  float distance = dist(mouseX, mouseY, width/2, height/2);
  if (distance <= 60)
    fill (255, 0, 0);
  else
    fill (255);
    
  ellipse (width/2, height/2, 60, 60);
  ellipse (mouseX, mouseY, 60, 60);
}
