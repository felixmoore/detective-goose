PImage background, backWall, sideWall, bed, woodTexture;
int gameMode = 0; //0=menu, 1=main game, 2=mini game, 3=win, 4=lose
Sprite detective;
Enemy enemy;
int x = 0;
boolean shut;

Background back; 
Room[] room;
RoomL[] roomL;

//items for enemies
Item sword, axe, bow, staff, 
  ring, helmet, hat, shoes, 
  goldKey, silverKey, blueScroll, redScroll, 
  apple, cheese, egg, pie, 
  candle, chalice, potion, necklace, 
  bookshelf, barrel, tableShort, tableLong, chest, 
  bomb,
  empty;

//ARRAY LIST INVENTORY
ArrayList<Item> inventory = new ArrayList<Item>();
//ARRAY LIST INVENTORY

void setup() {
  size(1000, 600);
  //background = loadImage("temp_background.png");
  frameRate(30); //controls animation speed
  
  //background
  back=new Background(width, height);//set background
  size(1000, 600);

  shut=true;//shut doors

  //load image
  bed=loadImage("Blue_Bed_Side.png");
  woodTexture=loadImage("woodTexture.jpg");
  backWall= loadImage("wall_side_right.png");
  sideWall=loadImage("wall_side.png"); 

  //create rooms
  room= new Room[2];
  roomL= new RoomL[2];

  for (int i=0; i<room.length; i++) {
    room[i]=new Room(width, height, 200*(i+1), (width/2.001), 200*(i+1)) ;
  }
  
  //weapon
  sword = new Item(loadImage("item_sword.png"), "sword", 1, 1, false);
  axe = new Item(loadImage("item_axe.png"), "axe", 1, 1, false);
  bow = new Item(loadImage("item_bow.png"), "bow", 1, 1, false);
  staff = new Item(loadImage("item_staff.png"), "staff", 1, 1, false);
  //clothing identifier
  ring = new Item(loadImage("item_ring.png"), "ring", 1, 1, false);
  helmet = new Item(loadImage("item_helmet.png"), "helmet", 1, 1, false);
  hat = new Item(loadImage("item_hat.png"), "hat", 1, 1, false);
  shoes = new Item(loadImage("item_shoes.png"), "shoes", 1, 1, false);
  //unlocking item
  goldKey = new Item(loadImage("item_goldKey.png"), "gold key", 1, 1, false);
  silverKey = new Item(loadImage("item_silverKey.png"), "silver key", 1, 1, false);
  redScroll = new Item(loadImage("item_redScroll.png"), "red scroll", 1, 1, false);
  blueScroll = new Item(loadImage("item_blueScroll.png"), "blue scroll", 1, 1, false);
  //food
  apple = new Item(loadImage("item_apple.png"), "apple", 1, 1, false);
  cheese = new Item(loadImage("item_cheese.png"), "cheese", 1, 1, false);
  egg = new Item(loadImage("item_egg.png"), "egg", 1, 1, false);
  pie = new Item(loadImage("item_pie.png"), "pie", 1, 1, false);
  //location identifier
  candle = new Item(loadImage("item_candle.png"), "candle", 1, 1, false);
  chalice = new Item(loadImage("item_chalice.png"), "chalice", 1, 1, false);
  potion = new Item(loadImage("item_potion.png"), "potion", 1, 1, false);
  necklace = new Item(loadImage("item_necklace.png"), "necklace", 1, 1, false);
  //furniture
  bookshelf = new Item(loadImage("item_bookshelf.png"), "bookshelf", 1, 1, false);
  barrel = new Item(loadImage("item_barrel.png"), "barrel", 1, 1, false);
  tableShort = new Item(loadImage("item_tableShort.png"), "table", 1, 1, false);
  tableLong = new Item(loadImage("item_tableLong.png"), "table", 1, 1, false);
  chest = new Item(loadImage("item_chestClosed.png"), "chest", 1, 1, false);
  // items for mini game
  bomb = new Item(loadImage("item_bomb.png"), "bomb", 1, 1, false);
  
  
  //EMPTY ITEM
  //empty = new Item(loadImage("item_empty.png"), "empty", 1, 1, false);
  //EMPTY ITEM
  //ARRAY INVENTORY LIST
  int inventorySize = 5;
  for (int i =0; i<inventorySize; i++){
    inventory.add(new Item(loadImage("item_empty.png"), "empty", 50 *(i+1), 15, false));
  }
  /*
  //ArrayList<Item> inventory = new ArrayList<Item>();
   //int num = inventory.size();
   //println(num);
   //println(inventory);
   for (int i =0; i<inventory.size(); i++){
     Item tempItem = inventory.get(i);
     println(tempItem);
     tempItem.display();
     String description = tempItem.getDescription();
     println(description);
     println();
   }
  //ARRAY INVENTORY LIST
  */
  
  gameMode = 1;
  detective = new Sprite();
}


void draw() {
  if (gameMode==0) {
    //menu
    minigame();
  } else if (gameMode==1) {
    //image(background,0,0);
    back.display(); //show rooms
    for (int i=0; i<room.length; i++) {
      room[i]=new Room(width, height, 200*(i+1), (width/2.001), 40+200*(i+1)) ;
    }
    room[0].display();//display rooms
    room[1].display();//display rooms

    for (int i=0; i<roomL.length; i++) {
      roomL[i]=new RoomL(width, height, 200*(i+1), width-(width/2.001), 40+200*(i+1)) ;
    }
    roomL[0].display();//display rooms
    roomL[1].display();
    detective.display();
    //NEW
    displayInventory();
    //if item collision then call getItem()
    //NEW
    //detective.textbox();
  } else if (gameMode==2) {
    //minigame();
    image(background, x, 0); //draw background twice adjacent
    image(background, x+background.width, 0); 
    x -=10;
    if (x == -background.width) {
      x=0; //wrap background
    }
    detective.display();
    enemy.move();
    enemy.display();
  } else if (gameMode==3) {
    //win
  } else if (gameMode==4) {
    //lose
  }
}


void minigame() {
  gameMode = 2;
  background = loadImage("grass.png");
  background.resize(width, height);
  enemy = new Enemy();
  detective.y = height/2;
  detective.x = 20;
  detective.walkRight.display(detective.x, detective.y);
}

//NEW
void displayInventory(){
  fill(255);
  rect(40,10, 250, 25);
  for (int i =0; i<inventory.size(); i++){
     Item tempItem = inventory.get(i);
     //println(tempItem);
     tempItem.display();
     //String description = tempItem.getDescription();
     //println(description);
     //println();
   }
}


//if item has been collided with, then call getItem()
void getItem(){
  String itemRange = isItemInRange(); //returns item or null
  //check if space in inventory: spaceInInventory = isInventoryFull()
  boolean spaceInInventory, int emptyIndex = isInventoryFull();
  //println(itemRange, spaceInInventory);
  if (itemRange != "null" && spaceInInventory == true){
    //put item in inventory
    inventory[emptyIndex] = collidedItem;
    //collidedItem.setStatus = true;
  }
}

String isItemInRange(){
  //use goose coordinates to identify item
  //
  return 
}

boolean, int isInventoryFull(){
  boolean isFull = true;
  int index = -1; //-1 means no more index avaiable
  for (int i =0; i<inventory.size(); i++){
     Item tempItem = inventory.get(i);
     //println(tempItem);
     String itemDescription = tempItem.getDescription();
     if(itemDescription != "empty"){
       isFull = false;
       index = i;
       noLoop();
     }
  }
  return isFull, index;
}
//NEW


void keyPressed() {
  if (gameMode == 2) {
    if (key == CODED) { //moves goose on key press
      if (keyCode == UP) { 
        if (detective.y>5) { //prevents goose going off screen  

          detective.y-=5;
        }
      } else if (keyCode == DOWN) {
        if (detective.y<height-20) {

          detective.y += 5;
        }
      }
    }
  }


  if (gameMode == 1) {
    if (key == CODED) {
      if (keyCode == UP) { 
        detective.dY = -1;
        detective.dX = 0;
        detective.y -= 5;
      }
      if (keyCode == DOWN) {
        detective.dY = 1;
        detective.dX = 0;
        detective.y += 5;
      }
      if (keyCode == LEFT) {
        detective.dY = 0;
        detective.dX = -1;
        detective.x -= 5;
      }
      if (keyCode == RIGHT) {
        detective.dY = 0;
        detective.dX = 1;
        detective.x += 5;
      }
      //if e.g. X is clicked
      //   check x,y coordinates of goose
      //   loop through array list of potential item locations
      //   if goosePos is with 
    }
  }
}
