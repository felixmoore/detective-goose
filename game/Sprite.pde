//image handling

//textboxes
    //intro
    //one successful
    //one unsuccessful
    //all clues found
    
//inventory


class Sprite{
  private Animation walkDown;
  private int x, y;
 //private PImage[] walk;
  
 public Player(){

   x=10;
   y=height/2;
   walkDown = new Animation("/detective/down", 2);
   
 }
 
 
 public void display(){
   walkDown.display(x, y);
 }
}
