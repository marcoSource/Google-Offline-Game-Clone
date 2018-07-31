boolean started = false;
boolean debug = false;
boolean hasClickedSpace = false;
boolean lose;

long prev;
double delta;

long score;
long hiscore;

int groundHeight;
int startPoint;

World world;
Text start, _lose, _score;
Game game;

void setup() {
  size(600, 200);
  world = new World();
  game = new Game();
  groundHeight = height - 27;
  startPoint = 75;
  score = 0;

  start = new Text();
  _lose = new Text();
  _score = new Text(10, 30);
}

void draw() {
  printEverything();
  delta = (-prev + (prev = frameRateLastNanos))/1e6d;
  background(255);
  startGame();
  world.getDino().render();
  fill(0);
  stroke(10);
  line(0, groundHeight, width, groundHeight);
  if (started && !lose()) {
    world.render();
    world.update();
    setSpeed();
    _score.showAndUpdate("Score: " + score + " HI: " + hiscore, false);
  }
  if (lose) {
    setHiscore(score);
    score = 0;
    _lose.setText("You lose!");
    _lose.show(false);
    _lose.setX(width/2 - _lose.getWidth(_lose.getText())/2);
    _lose.setY(height/2);
  }
  if (!lose) {
    increaseScore();
  }
  if (!started) {
    start.setText("Press SPACE to start!");
    start.show(false);
    start.setX(width/2 - start.getWidth(start.getText())/2);
    start.setY(height/2);
    start.blink(true);
  }
}

void keyPressed() {
  if (key == ' ') {
    if (!lose) {
      world.getDino().jump();
    }
    hasClickedSpace = true;
  }
  if (key == 'd') {
    debug = true;
  }
  if (key == 'r') {
    lose = false;
  }
}

boolean lose() {
  return lose;
}

void startGame() {
  if (world.getDino().getPos().x < startPoint) {
    world.getDino().getPos().x += 2;
  } else {
    if (hasClickedSpace == true)
      started = true;
  }
}

void setHiscore(long score) {
  if (score > hiscore)
    hiscore = score;
}

int timer;
int time = 10;

void increaseScore() {
  if (timer < time) {
    timer++;
  } else if (timer >= time) {
    timer = 0;
    score++;
  }
}

void setSpeed() {
  for (Cactus c : world.cactus) {
    if (game.getObjectiveByScore(score) == 0) {
      c.getVel().x = -5;
    } else if (game.getObjectiveByScore(score) == 1) {
      c.getVel().x = -6;
    } else if (game.getObjectiveByScore(score) == 2) {
      c.getVel().x = -7;
    } else if (game.getObjectiveByScore(score) == 3) {
      c.getVel().x = -8;
    } else if (game.getObjectiveByScore(score) == 4) {
      c.getVel().x = -9;
    } else if (game.getObjectiveByScore(score) == 5) {
      c.getVel().x = -10;
    } else if (game.getObjectiveByScore(score) == 6) {
      c.getVel().x = -11;
    }
  }
}

void printEverything(){
  println(world.getDino().isInGround() + " " + startPoint + " " + world.getDino().getPos().x + " " + (groundHeight - 42));
}
