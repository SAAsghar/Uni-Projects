//square properties
int x; //x coordinate of squares
int squarey; //y coordinates of sqaures
int speedx; //speed of movement
int count; //key-presses to determine change in stack size
int stop; //change in x height pending on stack size to reverse direction

int num = 90; //increment of square position along y axis

//stack size properties
int amount = 4; //amount of squares to be drawn
int reset = 0; //count to reset game

int[] yPos = new int [15]; //array of y coordinates
int[] size = {360, 360, 360, 360, 270, 270, 270, 270, 180, 180, 180, 180, 90, 90}; //array for frozen stack sizes
int i;

void setup() {
  size (1280, 720);
  squarey = 0;
  speedx = 90;
  count = 0;
  stop = 90;
}

void draw() {
  background (255);
  fill (255, 147, 79);

  for (int r = 0; r < amount; r++) {
    rect (x, squarey + num * r, 90, 90);
    if (count == 4) {
      amount--;
      count = 0;
      stop -= 90;
    }
  }

    squarey = squarey + speedx;
    if (squarey <= 0 || squarey > height/2 - stop) {
      speedx = speedx * -1;
    }
    
  delay (500);
  
  for (int loc = 0; loc <= 1280; loc += 90) {
    strokeWeight (2);
    line (loc, 0, loc, height);
    line (0, loc, width, loc);
  }
  
  int still = 0;
  int a = 0;
  for (int e = 0; still < x; e++) { 
    rect (still, yPos[e], 90, size[a]);
    still += 90;
    a++;
    if (reset == 4) {
      a = 0;
      e = 0;
    }
  }
}

void keyPressed() {
  if (key == ' ') {
    x += 90;
    count += 1;
    reset += 1;
    yPos[i] = squarey;   
    i++;

    if (reset == 14) {
      amount = 4;
      stop = 90;
      i = 0;
      squarey = 0;
      x = 0;
      draw();
    }
  }
}
