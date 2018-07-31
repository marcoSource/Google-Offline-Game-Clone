class World {

  private Dino dino;

  ArrayList<Cactus> cactus;
  float time;
  int timer;

  Box _box;
  Game game = new Game();

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
    if (timer < time) {
      timer++;
    } else if (timer >= time) {
      time = getTimeSpawnByObjective();
      timer = 0;
      if (started)
        cactus.add(new Cactus(width + 20, height - 70));
    }
    for (Cactus cactu : cactus) {
      cactu.moveLeft();
    }
    for (int i = cactus.size() - 1; i >= 0; i--) {
      Cactus temp = cactus.get(i);
      if (temp.isOut()) {
        cactus.remove(temp);
        score++;
      }
    }

    applyGravity();
    removeAll();
  }

  void applyGravity() {
    if (dino.getPos().y < height - 70) {
      dino.getPos().y += .2f * delta;
    }
  }

  Dino getDino() {
    return dino;
  }

  void removeAll() {
    if (lose) {
      ArrayList<Cactus> toRemove = new ArrayList<Cactus>();
      for (Cactus c : cactus) {
        toRemove.add(c);
      }
      cactus.removeAll(toRemove);
    }
  }

  int getTimeSpawnByObjective() {
    if (game.getObjectiveByScore(score) == 0) {
      return (int)random(75, 150);
    } else if (game.getObjectiveByScore(score) == 1) {
      return (int)random(80, 145);
    } else if (game.getObjectiveByScore(score) == 2) {
      return (int)random(85, 140);
    } else if (game.getObjectiveByScore(score) == 3) {
      return (int)random(90, 135);
    } else if (game.getObjectiveByScore(score) == 4) {
      return (int)random(95, 130);
    } else if (game.getObjectiveByScore(score) == 5) {
      return (int)random(100, 125);
    } else if (game.getObjectiveByScore(score) == 6) {
      return (int)random(105, 120);
    }
    return 0;
  }
}
