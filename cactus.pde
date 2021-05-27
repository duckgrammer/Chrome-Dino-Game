class cactus{
  private float xpos;
  private float ypos;
  private float speed;
  private float xposStart;
  
  public cactus(float xpos, float ypos, float speed){
    this.xpos = xpos;
    this.ypos = ypos;
    this.speed = speed;
    xposStart = xpos;
  }
  
  void drawCactus(){
    rect(xpos, ypos, 10, 252 - ypos);
    rect(xpos - 10, ypos + 3, 5, (252 - ypos)/2);
    rect(xpos + 15, ypos + 4, 5, (252 - ypos)/2);
    rect(xpos - 10, ypos +(252 - ypos)/2 -2, 30, 5);
    xpos -= speed;
    if (xpos < -100) {
      xpos = xposStart;
    }
  }
  
  boolean overlap(float obsx, float obsy, float obswidth, float obsheight){
    if((obsx + obswidth > xpos && obsx + obswidth < xpos + 20) || (obsx > xpos && obsx < xpos + 20)){
        if(obsy + obsheight > ypos && obsy < 252){
          return true;
        }
    }
    return false;
  }
}
