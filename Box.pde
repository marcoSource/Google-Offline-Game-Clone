class Box{
  
  float _x, _y, _w, _h;
  
  Box(){}
  
  Box(float x, float y, float w, float h){
    _x = x;
    _y = y;
    _w = w;
    _h = h;
  }
  
  void renderBox(){
    noFill();
    stroke(255,0,0);
    rect(_x,_y,_w,_h);
  }
  
  boolean collideBox(Dino dino, Cactus cactus){
    if(dino.getPos().x >= cactus.getPos().x && dino.getPos().x <= cactus.getPos().x + cactus.getWidth() && dino.getPos().y >= cactus.getPos().y && dino.getPos().y <= cactus.getPos().y + cactus.getHeight()){
      return true;
    } else {
      return false;
    }
  }
  
  void updateBox(float newX, float newY){
    _x = newX;
    _y = newY;
  }
  
  String toString(){
    return "Box location: ["+_x+","+_y+"]"; 
  }
}
