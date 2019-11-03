class Background{
  private float y;
  private float x;
  
 public Background(float gX, float gY){
       x=gX;
       y=gY;
   
 }
 
 
 public void display(){
   
    roomBoarder(); 
 }
 
 
  private void roomBoarder(){
    tileFloor(); 
    for (int i=0 ; i<sizeX; i=i+30){
      image(backWall,i,0,30,40);
          }
          for (int i=0 ; i<sizeX; i=i+30){
      image(backWall,i,sizeY-30,30,40);
          }
    for( int i=0 ; i<sizeY; i=i+30){
      image(sideWall,0,i,40,30);
    }
    for( int i=0 ; i<sizeY; i=i+30){
      image(sideWall,sizeX-40,i,40,30);
    }
 }
 
  private void tileFloor(){
   for( float i =0 ; i<sizeY ; i=i+60){
     for (float w=0 ; w<sizeX ; w=w+60){
   image(woodTexture,w,i,60,60);
   }}
    
  }
  
  
  
  
  
}
