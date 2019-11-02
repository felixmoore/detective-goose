class RoomL{
  private   PImage roomDoor;
  private float y;
  private float x;
  private float startingX;
  private float startingY;
  private float doorY;
  private float doorX;
   private boolean shut;
  
 public RoomL(float gX, float gY, float yPoint, float dX,float dY){
      shut=true;  
       x=gX;
       y=gY;
       startingY=yPoint;
       doorY=dY;
       doorX=dX;
        roomDoor=loadImage("door.jpg");
    }
     public void display(){

 
     for (float i=1.3 ; i<x/60;i=i+1){
      image(backWall,x-i*30,startingY,30,40);
      
     
          }
             image(sideWall,doorX+10,doorY+50,30,40);
             image(sideWall,doorX+10,doorY+90,30,40);
             image(sideWall,doorX+10,doorY+100,30,40);
             image(sideWall,doorX+10,doorY+120,30,40);
       
            if (shut){image(roomDoor,x-doorX+10,doorY,30,60); }
      }
      
  public void open(){
    shut=!shut;
  }
  
}
