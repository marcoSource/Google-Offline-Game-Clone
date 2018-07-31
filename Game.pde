class Game {

  long objectives[] = {200, 400, 800, 1600, 3200, 6400};

  Game() {
  }

  int getObjectiveByScore(long score) {
    if (score > objectives[0]) {
      return 1;
    } else if (score > objectives[1]) {
      return 2;
    } else if (score > objectives[2]) {
      return 3;
    } else if (score > objectives[3]) {
      return 4;
    } else if (score > objectives[4]) {
      return 5;
    } else if (score > objectives[5]) {
      return 6;
    }
    return 0;
  }
}
