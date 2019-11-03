  float sizeX;
   float sizeY;
   int layout;
   boolean shut;
   PImage backWall;
   PImage sideWall;
   PImage bed; 
   PImage woodTexture;
     PImage chest;
   
    Background back; 
    Room[] room;
    RoomL[] roomL;
void setup(){
     sizeX=1000;
   sizeY=600;
   
  back=new Background(sizeX,sizeY);//set background
   size(1000,600);
   
   shut=true;//shut doors
   //load image
   bed=loadImage("Blue_Bed_Side.png");
   woodTexture=loadImage("woodTexture.jpg");
   chest=loadImage("chest_.png");
   backWall= loadImage("wall_side_right.png");
   sideWall=loadImage("wall_side.png"); 
  
   //create rooms
   room= new Room[2];
   roomL= new RoomL[2];
  for (int i=0; i<room.length;i++){
 room[i]=new Room(sizeX,sizeY,200*(i+1),(sizeX/2.001),200*(i+1)) ; 
  }
 
  
 }
  


void draw(){
  back.display(); //show background
 for (int i=0; i<room.length;i++){
room[i]=new Room(sizeX,sizeY,200*(i+1),(sizeX/2.001),40+200*(i+1)) ;   }
  room[0].display();//display rooms
  room[1].display();//display rooms
  
   for (int i=0; i<roomL.length;i++){
     roomL[i]=new RoomL(sizeX,sizeY,200*(i+1),sizeX-(sizeX/2.001),40+200*(i+1)) ;  
}
  roomL[0].display();//display rooms
  roomL[1].display();
  
  
}

  
