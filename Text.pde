class Text {
  
  String text;
  float posX, posY;
  PFont font;
  
  /**
   Default style
  */
  int defaultTextSize = 16;
  int alpha = 255;
  color defaultTextColor;
  color defaultShadowColor;
 
  /**
   @param str is the actually text to display
   if the text is defined on here, the same doesnt update
  */
  Text(String str, float x, float y){
    text = str;
    posX = x;
    posY = y;
    defaultTextColor = color(0, 0, 0);
    defaultShadowColor = color(179, 179, 179);
  }
  
  /**
   Simple constructor to define the start position of the text
  */
  Text(float x, float y){
    posX = x;
    posY = y;
    defaultTextColor = color(0, 0, 0);
    defaultShadowColor = color(179, 179, 179);
  }
  
  /**
   constructor to define the start position of the text and the font
   @param name = name of the font file
   (Not tested yet)
  */
  Text(float x, float y, String name){
    font = loadFont(name);
    textFont(font);
    posX = x;
    posY = y;
    defaultTextColor = color(0, 0, 0);
    defaultShadowColor = color(179, 179, 179);
  }
  
  /**
  Empty Constructor to max personalizion;
  */
  Text(){
    defaultTextColor = color(0, 0, 0);
    defaultShadowColor = color(179, 179, 179);
  }
  
  
  /**
   To be called when the first constructor is in use
   @param b = if true, draw the default shadow, else draw just the text
  */
  void show(boolean b){
    if(b){
      drawShadow(5, 5, defaultShadowColor);
      fill(defaultTextColor, alpha);
      textSize(defaultTextSize);
      text(text, posX, posY);
    } else {
      fill(defaultTextColor, alpha);
      textSize(defaultTextSize);
      text(text, posX, posY);
    }
  }
  
  /**
   Called when the second constructor is in use
   Takes @param string, this is actual text to display
   The same will update every loop
  */
  void showAndUpdate(String t, boolean b){
    if(b){
      drawShadow(t, 5, 5, defaultShadowColor);
      fill(defaultTextColor, alpha);
      textSize(defaultTextSize);
      text(t, posX, posY);
    } else {
      fill(defaultTextColor, alpha);
      textSize(defaultTextSize);
      text(t, posX, posY);
    }
  }
  
  /**
   Draws a shadow with the same attributes from the original text
   The position of the shadow is define by:
    @param offX = posX + offX
    @param offY = posY + offY
  */
  void drawShadow(int offX, int offY){
    fill(defaultTextColor);
    textSize(defaultTextSize);
    text(text, posX - offX, posY + offY);
  }
  
  /**
   Draws a shadow with the same attributes from the original text
   The position of the shadow is define by:
    @param offX = posX + offX
    @param offY = posY + offY
    @param c = sets the shadow color, by the default is gray
  */
  void drawShadow(int offX, int offY, color c){
    fill(c);
    textSize(defaultTextSize);
    text(text, posX - offX, posY + offY);
  }
  
  /**
   (This should be called if use the showAndUpdate() method)
   Draws a shadow with the same attributes from the original text
   The position of the shadow is define by:
    @param offX = posX + offX
    @param offY = posY + offY
    @param t = text
  */
  void drawShadow(String t, int offX, int offY){
    fill(defaultTextColor);
    textSize(defaultTextSize);
    text(t, posX - offX, posY + offY);
  }
  
  /**
   (This should be called if use the showAndUpdate() method)
   Draws a shadow with the same attributes from the original text
   The position of the shadow is define by:
   @param t = text;
    @param offX = posX + offX
    @param offY = posY + offY
    @param c = sets the shadow color, by the default is gray
  */
  void drawShadow(String t, int offX, int offY, color c){
    fill(c);
    textSize(defaultTextSize);
    text(t, posX - offX, posY + offY);
  }
  
  /**
    Make the blink effect on text
  */
  void blink(boolean b){
    if(b){
      if(alpha > 0){
        alpha -= 5f;
      } if(alpha == 0){
        alpha = 255;
      }
    }
  }
  
  /**
   Takes the width of the string and return a float
  */
  float getWidth(){
    float stringWidth = textWidth(text);
    return stringWidth;
  }
  
  /**
   Should be used with the updated text
   Takes the width of the string and return a float
   @param t = text
  */
  float getWidth(String t){
    float stringWidth = textWidth(t);
    return stringWidth;
  }
  
  //Getters and setters to retrieve and change the default values
  float getX(){return posX;}
  float getY(){return posY;}
  String getText(){return text;}
  void setX(float x){posX = x;}
  void setY(float y){posY = y;}
  void setTextColor(color c){defaultTextColor = c;}
  void setTextSize(int size){defaultTextSize = size;}
  void setShadowColor(color c){defaultShadowColor = c;}
  void setText(String t){text = t;}
}
