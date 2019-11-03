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
       
            if (shut){
               
              image(roomDoor,doorX-23,doorY,30,60);
              
           
          }
        }
          
 public void wallDetect(){
     int xVal;
  int yVal;
  xVal=detective.x;
  yVal=detective.y;
  
   if ((xVal>=0)&&(yVal>=startingY)&&(xVal<=(10*30))&&(yVal<=startingY+7)){
       detective.y= yVal+20; 
   }else if ((xVal>=0)&&(yVal<=startingY)&&(xVal<=(10*30))&&(yVal>=startingY-20)){
   
    detective.y= yVal-60; 
   }
  if ((xVal>=(10*30)&& xVal<=(11*30)) && ((yVal>=doorY)&&(yVal<=doorY+120))){
   detective.x=xVal-35; 
    
  }else if((xVal>=(10*30) &&xVal<=(11*30)+5) && ((yVal>=doorY)&&(yVal<=doorY+120))){
   detective.x=xVal+35; 
  }
 
 //roomDoor,doorX-23,doorY,30,60);

 
    else if (xVal>=(10*30) && xVal<=(11*30) && ((yVal>=doorY-70))&&(yVal<=doorY+120)){
      if (shut){
       
   detective.x=xVal-35; 
    }}
    else if(xVal>=(10*30) && xVal<=(11*30)+10 && ((yVal>=doorY-70))&&(yVal<=doorY+120)){
      if (shut){
        
   detective.x=xVal+35; 
    }
    }
 }

   
   
   
 
 
 public float getY(){
  return startingY; 
 }
  
  private void open(){//allow doors to open
    shut=false;
     
  }
  
 public void doorOpen(){
  int xVal;
  int yVal;
  float doorPositionX;
  float doorPositionY;
  doorPositionX=doorX-23;
  doorPositionY=doorY;
  
  xVal=detective.x;
  yVal=detective.y;
  if ((xVal<doorPositionX+60 && yVal< doorPositionY+60 )&&
  (xVal>doorPositionX-60 && yVal> doorPositionY-60)){
   
  
    shut=!shut; 
    
    
  }
   
   
   
 }
  
  

 }
