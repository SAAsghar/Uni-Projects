int count = 0; //<>//

void setup() {
 size (400, 400);
}

void draw () {
}

void mousePressed() {
 if (count == 0)
   fill (255, 255, 0);
   if (count == 1)
   fill (150, 0, 150);
   if (count == 2)
   fill (60, 0, 250);
   
   ellipse (mouseX, mouseY, 50, 50);
   count ++;
   
   if (count > 2)
   count = 0;
}
