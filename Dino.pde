class Dino {

  PVector pos, vel;
  PImage texture;
  Box renderBox;

  Dino(int posX, int posY) {
    pos = new PVector(posX, posY);
    vel = new PVector(0, -5);
    texture = loadImage("dino.png");
    renderBox = new Box(pos.x, pos.y+5, 45, 40);
  }

  void render() {
    fill(187);
    image(texture, pos.x, pos.y, 50, 50);
    renderBox.updateBox(pos.x, pos.y);
    if (debug)
      renderBox.renderBox();
  }

  void jump() {
     pos.y += vel.y * delta; 
     println(delta + "" + vel.y);
  }

  PVector getPos() {
    return pos;
  }
  
  PVector getVel(){
    return vel;
  }
}
