//image handling

//textboxes
//intro
//one successful
//one unsuccessful
//all clues found

//inventory


class Sprite {
  private boolean showTextbox = false;
  private Animation walkUp, walkDown, walkLeft, walkRight;
  private int x, y, dX, dY; //position + direction
  //private PImage[] walk;

  public Sprite() {
    dX = 0;
    dY = 1;
    x=width/2-35;
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
    
    textbox();
  }

  public void textbox() {
    
    
    if (showTextbox){
      fill(255, 125);
      noStroke();
      rect(0, height-height/3, width, height/3);
      fill(0);
      textSize(30);
      text("X", width-45, height-15);
      //depending on condition, display different text (read from file?)
      //if (gameState ==1)
      //if (interact with object){
        //text(item.description), 50, (height-height/3)+50)
      //}
      
    }
  }
  
  
  public boolean checkInteraction(){
    color test = get(x+32,y);
    return test==255;
  }

}
