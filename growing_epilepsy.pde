float x; 
int y;

float a;
float c;
float q;

float r;
float g;
float b;

float z; 

void setup() {
size (1000, 1000);
x = 0;
y = 0;
frameRate (60);
}

void draw() {
r = random (0, 255);
g = random (0, 255); 
b = random (0, 255);
background (47, 141, 255);
strokeWeight (z) ;
stroke (0, c, q);
line (0, 0, 500, 500);
fill (r, g, b);
ellipse (x, y, 250, 250);
x = x + 0.5;
y = y + 2;
a = a + 0.5;
c = c + 0.5;
q = q + 0.5;
z = z + 2; 
}

void keyPressed() {
  if (key=='X'){
    println("Thank You ;)");
  }
}
