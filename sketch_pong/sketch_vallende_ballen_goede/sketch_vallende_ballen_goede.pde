int aantalBallen = 5;


float[] ballX = new float [aantalBallen];
float[] ballY = new float [aantalBallen];
float[] snelheid = new float [aantalBallen];
float[] balDiameter = new float [aantalBallen];

boolean[] gevangen = new boolean[aantalBallen];

float paddleHeight = 15;
float paddleWidth = 100;
float paddleY = 475;

int score = 0;

void setup() {
size(350,500);

for(int i = 0; i <aantalBallen; ++i) {
  balDiameter[i] = random(15,45);
  ballX[i] = random(
  balDiameter[i]/2,
  width - balDiameter[i]/2
  );
  ballY[i] = random(-400,0);
  snelheid[i] = random(1,4);
 }
}
void draw() {
background(0);

fill(255);
textSize(15);
text("SCORE: " + score, 15,25);

fill(255,255,355);
rectMode(CENTER);
rect(mouseX, paddleY, paddleWidth, paddleHeight); 

for(int i = 0; i < aantalBallen; i++) {
  
  ballY[i] += snelheid[i];
  
  fill(255,255,355);
  ellipse(ballX[i],ballY[i],balDiameter[i],balDiameter[i]);


if (!gevangen[i] && ballY[i] + balDiameter[i] / 2 >= paddleY - paddleHeight / 2 &&
    ballY[i] - balDiameter[i] / 2 <= paddleY + paddleHeight / 2 &&
    ballX[i] + balDiameter[i] / 2 >= mouseX - paddleWidth / 2 &&
    ballX[i] - balDiameter[i] / 2 <= mouseX + paddleWidth / 2 &&
    snelheid[i] > 0) {
    
    score = score + 1;
    gevangen[i] = true;
    
  }

if(ballY[i] - balDiameter[i] /2 > height) {
   ballY[i] = - balDiameter[i] / 2;
   ballX[i] = random(balDiameter[i] / 2, width - balDiameter[i] / 2);
   snelheid[i]= 0;
   
   snelheid[i] = random(1,4);
   gevangen[i] = false;
  }
}
}

class Ball {
float x;
float y;

Ball(){
  x = 180;
  y = 50;
}
void move() {

    }
void display(){

  
}
}
