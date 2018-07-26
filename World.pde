class World {

  private Dino dino;

  ArrayList<Cactus> cactus;
  float time;
  int timer;

  Box _box;

  World() {
    dino = new Dino(10, height - 70);
    cactus = new ArrayList<Cactus>();
    _box = new Box();
  }

  void render() {

    for (Cactus cactu : cactus) {
      cactu.render();
      if (_box.collideBox(dino, cactu)) {
        lose = true;
        fill(0);
        text("You Lose!!!", width/2, height/2);
      }
    }
  }

  void update() {
    if(timer < time) {
      timer++;
    } else if (timer >= time) {
      time = random(10, 75);
      timer = 0;
      if(started)
        cactus.add(new Cactus(width + 20, height - 70));
    }
    for (Cactus cactu : cactus) {
      cactu.moveLeft();
    }
    for (int i = cactus.size() - 1; i >= 0; i--) {
      Cactus temp = cactus.get(i);
      if (temp.isOut()) {
        cactus.remove(temp);
      }
    }

    applyGravity();
    removeAll();
  }

  void applyGravity() {
    if (dino.getPos().y < height - 70) {
      dino.getPos().y += .2f * delta;
      dino.getPos().x += .05f;
    }
  }

  Dino getDino() {
    return dino;
  }
  
  void removeAll(){
    if(lose){
      ArrayList<Cactus> toRemove = new ArrayList<Cactus>();
      for(Cactus c : cactus){
        toRemove.add(c);
      }
      cactus.removeAll(toRemove);
    }
  }
}
