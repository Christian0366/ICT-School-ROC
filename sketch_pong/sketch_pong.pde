void setup(){
  size(800,600);
}

void draw(){
  background(0); // Clear the window
}

class ball{
  float x;
  float y;
  float speedY;
  float diameter;
  color c;

ball(float tempX, float tempY, float tempDiameter) {
  x = tempX;
  y = temp;
  diameter = tempDiameter;
  speedX = 0;
  speedY = 0;
  c = (225);
}


void move() {
  // Add speed to location
  y = y + speedY;
  x = x + speedX;
}


void display() {
  fill(c);
  ellipse(x,y,diameter,diameter);
}


// funcions to help with collision detection
float left(){
  return x-diameter/2;
}
