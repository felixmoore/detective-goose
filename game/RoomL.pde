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
      
  private void open(){
    shut=!shut;
  }
  public void doorOpen(){
  int xVal;
  int yVal;
  float doorPositionX;
  float doorPositionY;
  doorPositionX=doorX+10;
  doorPositionY=doorY;
  
  xVal=detective.x;
  yVal=detective.y;
  if ((xVal<doorPositionX+60 && yVal< doorPositionY+60 )&&
  (xVal>doorPositionX-60 && yVal> doorPositionY-60)){
   
  
    open(); 
    
    
  }
   
   
   
 }
  public void wallDetect(){
     int xVal;
  int yVal;
  xVal=detective.x;
  yVal=detective.y;
 // rect(width-(16.5*30),doorY,35,doorY+120);
   if ((xVal<=width)&&(yVal>=startingY)&&(xVal>=(width-(16*30)))&&(yVal<=startingY+10)){
       detective.y= yVal+40; 
   }else if((xVal<=width)&&(yVal<=startingY)&&(xVal>=width-(16*30))&&(yVal>=startingY-20)){
   
    detective.y= yVal-30; 
    
     if ((xVal>=width-(16.5*30)&& xVal<=(width-(16.5*30)+35) && ((yVal>=doorY)&&(yVal<=doorY+120)))){
   detective.x=xVal-35; 
    
  }else if((xVal>=width-(16*30) &&xVal<=(width-(16.5*30)+40) && ((yVal>=doorY)&&(yVal<=doorY+120)))){
   detective.x=xVal+35; 
  }
   }
  //roomDoor,doorX-23,doorY,30,60);

 
    else if (xVal>=(width-(16.8*30))-25 && xVal<=width-((17*30)-25) && ((yVal>=doorY-70))&&(yVal<=doorY+120)){
      if (shut){
   detective.x=xVal-40; 
    }}
    else if(xVal>=width-(16.5*30) && xVal<=width-(16*30)+10 && ((yVal>=doorY-70))&&(yVal<=doorY+120)){
      if (shut){
   detective.x=xVal+35; 
    }
    
   } 
 }
  
}
