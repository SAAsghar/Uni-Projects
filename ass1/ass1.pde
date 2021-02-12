float squarey;  //<>//
float speedx;
boolean move;

void setup() {
  size (1280, 720);
  squarey = 0;
  speedx = height/8; //moves square in equal spaces
}

void draw() {
  keyPressed();
}

void keyPressed() {
  if (key == ' ') {
    move = false;
    speedx = speedx * 1; //pauses the animation
    //press ANY key to continue animation
    //have 2 boolean variables, 1 to check if space has been pressed and another to check if the animation has already stopped 
    
  } else {
    move =true;
    background (240);
    fill (255, 147, 79);
    rect(0, squarey, width/4, height/4);
    delay (500); //creates delay between movements
    squarey = squarey + speedx;
    
    if (squarey <= 0 || squarey > height - height/3) {
      speedx = speedx * - 1; //reverses direction
      {
      }
    }
  }
}
