float x;
float y;

float change_x;
float change_y;

float r;
float g;
float b;

void setup() {
   size (1000, 1000);
   x = 200;
   y = 200;
   change_x = random (3, 8);
   change_y = random (-3, -8);
   frameRate (75);
}

void draw() {
  background (255);
  fill (r, g, b);
  stroke (r, g, b);
  ellipse (x, y, 100, 100);
  
  if(x >= 950 | x <= 50){
    change_x *= -1;
    r = random (0, 255);
    g = random (0, 255);
    b = random (0, 255);
    
  }
     if (y >= 950 | y <= 50){
       change_y *= -1;
    r = random (0, 255);
    g = random (0, 255);
    b = random (0, 255);
     }
     
     x = x + change_x;
     y = y + change_y;
}
  
