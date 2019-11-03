PImage background, backWall, sideWall, bed, woodTexture; //<>// //<>// //<>// //<>//
int gameMode = 0; //0=menu, 1=main game, 2=mini game, 3=win, 4=lose
Sprite detective;
Enemy enemy;
int x = 0;
boolean shut, result;

ArrayList<Item> items = new ArrayList<Item>();

Background back; 
Room[] room;
RoomL[] roomL;
//Item[] items;
//items for enemies
//Item sword, axe, bow, staff, 
//  ring, helmet, hat, shoes, 
//  goldKey, silverKey, blueScroll, redScroll, 
//  apple, cheese, egg, pie, 
//  candle, chalice, potion, necklace, 
//  bookshelf, barrel, tableShort, tableLong, chest, 
//  bomb;

void setup() {
background = loadImage("grass.png");

  size(1000, 600);
  frameRate(30); //controls animation speed

  //background
  back=new Background(width, height);//set background
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
  items.add(new Item(loadImage("item_sword.png"), "sword", 50, 100, false));
  //sword = new Item(loadImage("item_sword.png"), "sword", 1, 1, false);
  items.add(new Item(loadImage("item_axe.png"), "axe", 1, 1, false));
  //axe = new Item(loadImage("item_axe.png"), "axe", 1, 1, false);
  //bow = new Item(loadImage("item_bow.png"), "bow", 1, 1, false);
  //staff = new Item(loadImage("item_staff.png"), "staff", 1, 1, false);
  ////clothing identifier
  //ring = new Item(loadImage("item_ring.png"), "ring", 1, 1, false);
  //helmet = new Item(loadImage("item_helmet.png"), "helmet", 1, 1, false);
  //hat = new Item(loadImage("item_hat.png"), "hat", 1, 1, false);
  //shoes = new Item(loadImage("item_shoes.png"), "shoes", 1, 1, false);
  ////unlocking item
  //goldKey = new Item(loadImage("item_goldKey.png"), "gold key", 1, 1, false);
  //silverKey = new Item(loadImage("item_silverKey.png"), "silver key", 1, 1, false);
  //redScroll = new Item(loadImage("item_redScroll.png"), "red scroll", 1, 1, false);
  //blueScroll = new Item(loadImage("item_blueScroll.png"), "blue scroll", 1, 1, false);
  ////food
  //apple = new Item(loadImage("item_apple.png"), "apple", 1, 1, false);
  //cheese = new Item(loadImage("item_cheese.png"), "cheese", 1, 1, false);
  //egg = new Item(loadImage("item_egg.png"), "egg", 1, 1, false);
  //pie = new Item(loadImage("item_pie.png"), "pie", 1, 1, false);
  ////location identifier
  //candle = new Item(loadImage("item_candle.png"), "candle", 1, 1, false);
  //chalice = new Item(loadImage("item_chalice.png"), "chalice", 1, 1, false);
  //potion = new Item(loadImage("item_potion.png"), "potion", 1, 1, false);
  //necklace = new Item(loadImage("item_necklace.png"), "necklace", 1, 1, false);
  ////furniture
  //bookshelf = new Item(loadImage("item_bookshelf.png"), "bookshelf", 1, 1, false);
  //barrel = new Item(loadImage("item_barrel.png"), "barrel", 1, 1, false);
  //tableShort = new Item(loadImage("item_tableShort.png"), "table", 1, 1, false);
  //tableLong = new Item(loadImage("item_tableLong.png"), "table", 1, 1, false);
  //chest = new Item(loadImage("item_chestClosed.png"), "chest", 1, 1, false);
  //// items for mini game
  //bomb = new Item(loadImage("item_bomb.png"), "bomb", 1, 1, false);


  gameMode = 0;
  detective = new Sprite();
}


void draw() {
  if (gameMode==0) {
    //menu
    background(139);
    fill(0);
    textSize(60);
    textAlign(CENTER);
    text("GOOSE DETECTIVE", (width/2)+2, (height/2-28));
    fill(255);
    text("GOOSE DETECTIVE", width/2, height/2-30);
    
    fill(0);
    textSize(40);
    text("PRESS SPACE TO START", (width/2)+2, (height/2)+32);
    fill(255);
    text("PRESS SPACE TO START", width/2, height/2+30);
    
    fill(0);
    textSize(20);
    textAlign(CENTER);
    text("There has been a kidnapping! Take a gander at the clues and help Detective Goose find the culprit.", (width/2)+2, (height-20));
    

    
  } else if (gameMode==1) {

    if (detective.dY == -1 && detective.dX == 0) {
      for (int i=0; i<items.size(); i++) {
        result = collisionDetection(detective, detective.walkUp.getWidth(), detective.walkUp.getHeight(), items.get(i), items.get(i).getWidth(), items.get(i).getHeight());
      }
    } else if (detective.dY == 1 && detective.dX == 0 ||detective.dY == 0 && detective.dX == 0 ) {
      for (int i=0; i<items.size(); i++) {
        result = collisionDetection(detective, detective.walkDown.getWidth(), detective.walkDown.getHeight(), items.get(i), items.get(i).getWidth(), items.get(i).getHeight());
      }
    } else if (detective.dY == 0 && detective.dX == -1) {
      for (int i=0; i<items.size(); i++) {
        result = collisionDetection(detective, detective.walkLeft.getWidth(), detective.walkLeft.getHeight(), items.get(i), items.get(i).getWidth(), items.get(i).getHeight());
      }
    } else if (detective.dY == 0 && detective.dX == 1) {
      for (int i=0; i<items.size(); i++) {

        result = collisionDetection(detective, detective.walkRight.getWidth(), detective.walkRight.getHeight(), items.get(i), items.get(i).getWidth(), items.get(i).getHeight());
      }
    }

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
    for (int i=0; i<items.size(); i++) {
      items.get(i).display();
    }






    detective.display();
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
    minigame();
  } else if (gameMode==4) {
    //lose
  }
}

boolean collisionDetection(Sprite sprite, float w1, float h1, Item item, float w2, float h2) {
  return (sprite.x+w1 >= item.posX && sprite.x <= item.posX+w2 && sprite.y+h1 >= item.posY && sprite.y <= item.posY+h2);
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

void keyPressed() {
  if ( (key == 'x'|| key == 'X')&& detective.showTextbox) {
    detective.showTextbox = false;
  } 

  if (gameMode == 0){
   if (key ==' ') {
     gameMode = 1;
   }
  }

  if (gameMode == 2) {

    if (keyCode == UP|| key == 'w' || key == 'W') { 
      if (detective.y>5) { //prevents goose going off screen  

        detective.y-=5;
      }
    } else if (keyCode == DOWN|| key == 's'|| key == 'S') {
      if (detective.y<height-20) {

        detective.y += 5;
      }
    }
  }



  if (gameMode == 1) {

    if  (key == 'x'|| key == 'X' && detective.showTextbox == true) {
      detective.showTextbox = false;
    }

    if (!result) {

      if (keyCode == UP || key == 'w' || key == 'W') { 
        detective.dY = -1;
        detective.dX = 0;
        detective.y -= 5;
      }
      if (keyCode == DOWN|| key == 's'|| key == 'S') {
        detective.dY = 1;
        detective.dX = 0;
        detective.y += 5;
      }
      if (keyCode == LEFT|| key == 'a'|| key == 'A') {
        detective.dY = 0;
        detective.dX = -1;
        detective.x -= 5;
      }
      if (keyCode == RIGHT|| key == 'd'|| key == 'D') {
        detective.dY = 0;
        detective.dX = 1;
        detective.x += 5;
      } else if  (key == 'x'|| key == 'X') {
        detective.showTextbox = true;
      }
    }
  }
}
