class Room{
  private   PImage roomDoor;
  private float y;
  private float x;
  private float startingX;
  private float startingY;
  private float doorY;
  private float doorX;
  private boolean shut;
  
 public Room(float gX, float gY, float yPoint, float dX,float dY){
   shut=true;    
   x=gX/1.5;
       y=gY;
       startingY=yPoint;
       doorY=dY;
       doorX=dX/1.5;
        roomDoor=loadImage("door.jpg");
    } 
 public void display(){

 
     for (float i=1.3 ; i<x/60;i=i+1){
      image(backWall,i*30,startingY,30,40);
      
     
          }
             image(sideWall,doorX-23,doorY+50,30,40);
             image(sideWall,doorX-23,doorY+90,30,40);
             image(sideWall,doorX-23,doorY+100,30,40);
             image(sideWall,doorX-23,doorY+120,30,40);
       
            if (shut){image(roomDoor,doorX-23,doorY,30,60); }
      }
    
 
   
   
   
 
 
 public float getY(){
  return startingY; 
 }
  
  public void open(){//allow doors to open
    shut=!shut;
  }
  
  
  
  
  
}
