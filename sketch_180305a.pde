int groundHeight;
boolean started = false;
boolean debug = false;
boolean lose;
boolean hasClickedSpace = false;
long prev;
double delta;
long score;

World world;

void setup() {
  size(600, 200);
  world = new World();
  groundHeight = height - 27;
  score = 0;
}

void draw() {
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
    fill(0);
    text("SCORE: " + score, 10, 10);
  }
  if (lose) {
    fill(0);
    stroke(10);
    text("YOU LOSE!!!", width/2, height/2);
    text("SCORE: " + score, width/2, height/2 + 50);
  }
  if(!lose){
    score++;
  }
}

void keyPressed() {
  if (key == ' ') {
    if(!lose){
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
  int startPoint = 75;
  if (world.getDino().getPos().x < startPoint) {
    world.getDino().getPos().x += 2;
  } else {
    if(hasClickedSpace == true)
      started = true;
  }
}
