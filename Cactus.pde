class Cactus {

  int w, h;
  PVector pos, vel;
  PImage texture;
  Box renderBox;

  Cactus(int posX, int posY) {
    w = 30;
    h = 40;
    pos = new PVector(posX, posY);
    vel = new PVector(0, 0);
    texture = loadImage("cactu.png");
    renderBox = new Box(pos.x-5, pos.y-5, 40, 50);
  }

  void render() {
    fill(187);
    image(texture, pos.x, pos.y, 30, 40);
    renderBox.updateBox(pos.x, pos.y);
    if (debug)
      renderBox.renderBox();
  }

  void moveLeft() {
    pos.x += vel.x;
  }

  boolean isOut() {
    if (pos.x < 0) {
      return true;
    } else {
      return false;
    }
  }

  PVector getPos() {
    return pos;
  }
  
  PVector getVel(){
    return vel;
  }

  int getWidth() {
    return w;
  }

  int getHeight() {
    return h;
  }
}
