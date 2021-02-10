int count = 0;

void setup() {
  size (400, 400);
}

void draw() {
}  

void keyPressed() {
  if (count == 0) 
    fill (255, 0, 0);
    println ("STOP!!!");
  if (count == 1)
    fill (255, 191, 0);
    println ("maybe...?");
  if (count == 2)
    fill (0, 255, 0);
    println ("GOOOOO!!!");

  strokeWeight (3);
  ellipse (width/2, height/2, 200, 200);

  count ++;

  if (count > 2)
    count = 0;
}
