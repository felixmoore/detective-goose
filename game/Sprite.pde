//image handling

//textboxes
//intro
//one successful
//one unsuccessful
//all clues found

//inventory


class Sprite {
  private Animation walkUp, walkDown, walkLeft, walkRight;
  private int x, y, dX, dY; //position + direction
  //private PImage[] walk;

  public Sprite() {
    dX = 0;
    dY = 1;
    x=10;
    y=height/2;
    walkUp = new Animation("/detective/up", 2); 
    walkDown = new Animation("/detective/down", 2);
    walkLeft = new Animation("/detective/left", 2);
    walkRight = new Animation("/detective/right", 2);
  }


  public void display() {
    if (gameMode == 1){
      
      if (dY == -1 && dX == 0) {
        walkUp.display(x, y);
      } else if (dY == 1 && dX == 0) {
        walkDown.display(x, y);
      } else if (dY == 0 && dX == -1) {
        walkLeft.display(x, y);
      } else if (dY == 0 && dX == 1) {
        walkRight.display(x, y);
      }
    
    }
    
    else if (gameMode == 2){
        walkRight.display(x, y);
    }
  }

  public void textbox() {
    fill(255, 125);
    noStroke();
    rect(0, height-height/3, width, height/3);
    //depending on condition, display different text (read from file?)
  }
}
