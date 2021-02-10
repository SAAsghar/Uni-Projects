int gap;

void setup() {
  size (800, 800);
  frameRate (20);
}

void draw() {
  background (0);
  noFill();
  strokeWeight (3);
  stroke (255);
  int size = gap;
  while (size <= 8*gap) {
    ellipse (width/2, height/2, size, size);
    size = size + gap;

    gap = gap + 1;

    //can also be written as:
    
    //for (int size = gap; size <= 8*gap; size = size + gap) { 
      
    ////FOR loops have 3 parts; an initialiser for a varibale
    ////a condition to be tested
    ////and an update to be made within each loop
    
    //ellipse (width/2, height/2, size, size);

    //gap = gap + 1;
  }
}
