// Pong in Processing
// Controls: W/S for player 1, arrow keys for player 2
// Space = start / serve
// R = reset after win

float paddleWidth = 18;
float paddleHeight = 110;
float paddleSpeed = 7;

float playerX, playerY;
float aiX, aiY;

float ballX, ballY;
float ballSize = 12;
float ballSpeedX = 5;
float ballSpeedY = 4;

int playerScore = 0;
int aiScore = 0;
int winningScore = 7;

boolean started = false;
boolean gameOver = false;

void setup() {
  size(800, 600);
  noCursor();
  rectMode(CENTER);
  ellipseMode(RADIUS);

  playerX = 60;
  aiX = width - 60;
  playerY = height / 2;
  aiY = height / 2;

  resetBall(1);
}

void draw() {
  background(15, 15, 25);

  drawField();
  drawScores();

  if (gameOver) {
    drawWinner();
    return;
  }

  updatePlayer();
  updateAI();
  if (started) {
    updateBall();
  } else {
    drawCenterText("PRESS SPACE TO START");
  }

  drawPaddles();
  drawBall();
}

void drawField() {
  stroke(255, 255, 255, 120);
  strokeWeight(2);
  for (int i = 0; i < height; i += 30) {
    line(width / 2, i, width / 2, i + 16);
  }

  noStroke();
  fill(255, 255, 255, 60);
  rect(width / 2, height / 2, width, 2);
}

void updatePlayer() {
  if (keyPressed) {
    if (key == 'w' || key == 'W') {
      playerY -= paddleSpeed;
    }
    if (key == 's' || key == 'S') {
      playerY += paddleSpeed;
    }
  }

  playerY = constrain(playerY, paddleHeight / 2, height - paddleHeight / 2);
}

void updateAI() {
  float targetY = ballY;
  float diff = targetY - aiY;
  aiY += diff * 0.12;

  aiY = constrain(aiY, paddleHeight / 2, height - paddleHeight / 2);
}

void updateBall() {
  ballX += ballSpeedX;
  ballY += ballSpeedY;

  // Top and bottom walls
  if (ballY - ballSize <= 0 || ballY + ballSize >= height) {
    ballSpeedY *= -1;
    ballY = constrain(ballY, ballSize, height - ballSize);
  }

  // Player paddle collision
  if (ballX - ballSize <= playerX + paddleWidth / 2 &&
      ballX + ballSize >= playerX - paddleWidth / 2 &&
      ballY >= playerY - paddleHeight / 2 &&
      ballY <= playerY + paddleHeight / 2 &&
      ballSpeedX < 0) {
    float relativeIntersectY = (ballY - playerY) / (paddleHeight / 2);
    float bounceAngle = relativeIntersectY * 1.2;
    float speed = sqrt(ballSpeedX * ballSpeedX + ballSpeedY * ballSpeedY) + 0.5;

    ballSpeedX = cos(bounceAngle) * speed;
    ballSpeedY = sin(bounceAngle) * speed;

    ballX = playerX + paddleWidth / 2 + ballSize + 1;
  }

  // AI paddle collision
  if (ballX + ballSize >= aiX - paddleWidth / 2 &&
      ballX - ballSize <= aiX + paddleWidth / 2 &&
      ballY >= aiY - paddleHeight / 2 &&
      ballY <= aiY + paddleHeight / 2 &&
      ballSpeedX > 0) {
    float relativeIntersectY = (ballY - aiY) / (paddleHeight / 2);
    float bounceAngle = relativeIntersectY * 1.2;
    float speed = sqrt(ballSpeedX * ballSpeedX + ballSpeedY * ballSpeedY) + 0.5;

    ballSpeedX = -cos(bounceAngle) * speed;
    ballSpeedY = sin(bounceAngle) * speed;

    ballX = aiX - paddleWidth / 2 - ballSize - 1;
  }

  // Score
  if (ballX < -ballSize) {
    aiScore++;
    checkWin();
    if (!gameOver) {
      resetBall(1);
      started = false;
    }
  }

  if (ballX > width + ballSize) {
    playerScore++;
    checkWin();
    if (!gameOver) {
      resetBall(-1);
      started = false;
    }
  }
}

void checkWin() {
  if (playerScore >= winningScore || aiScore >= winningScore) {
    gameOver = true;
  }
}

void keyPressed() {
  if (key == ' ' && !started && !gameOver) {
    started = true;
    float randomDir = random(1) > 0.5 ? 1 : -1;
    ballSpeedX = randomDir * 6;
    ballSpeedY = random(-4, 4);
  }

  if (key == 'r' || key == 'R') {
    resetGame();
  }
}

void resetGame() {
  playerScore = 0;
  aiScore = 0;
  gameOver = false;
  started = false;
  resetBall(1);
}

void resetBall(float direction) {
  ballX = width / 2;
  ballY = height / 2;
  ballSpeedX = direction * 5;
  ballSpeedY = random(-4, 4);
}

void drawPaddles() {
  fill(255);
  rect(playerX, playerY, paddleWidth, paddleHeight);
  rect(aiX, aiY, paddleWidth, paddleHeight);
}

void drawBall() {
  fill(255, 89, 89);
  ellipse(ballX, ballY, ballSize, ballSize);
}

void drawScores() {
  fill(255);
  textAlign(CENTER);
  textSize(42);
  text(playerScore, width * 0.25, 60);
  text(aiScore, width * 0.75, 60);
}

void drawCenterText(String textToShow) {
  fill(255, 255, 255, 200);
  textAlign(CENTER);
  textSize(28);
  text(textToShow, width / 2, height / 2 + 130);
}

void drawWinner() {
  fill(255);
  textAlign(CENTER);
  textSize(48);

  if (playerScore >= winningScore) {
    text("JIJ WINT!", width / 2, height / 2 - 20);
  } else {
    text("AI WINT!", width / 2, height / 2 - 20);
  }

  textSize(22);
  text("Druk R om opnieuw te beginnen", width / 2, height / 2 + 30);
}
