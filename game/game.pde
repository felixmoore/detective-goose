PImage background, backWall, sideWall, bed, woodTexture; //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>// //<>//
int gameMode = 0; //0=menu, 1=main game, 2=mini game, 3=win, 4=lose
Sprite detective;
Enemy enemy;
int x = 0, time, wait = 120000, score = 0;
boolean shut, result;


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
//ARRAY LIST ALL ITEMS
ArrayList<Item> items = new ArrayList<Item>();
//ARRAY LIST RANDOM ITEMS
ArrayList<Item> randomItemsList = new ArrayList<Item>();

//NEEEEEW
float[] randomItemPosX = {100, 900, 100, 100, 900};
float[] randomItemPosY = {100, 300, 500, 300, 500};
//NEEEEEW

void setup() {
  background = loadImage("grass.png");

  size(1000, 600);
  frameRate(30); //controls animation speed

  //background
  back=new Background(width, height);//set background
  //shut=true;//shut doors

  //load image
  bed=loadImage("Blue_Bed_Side.png");

  woodTexture=loadImage("woodTexture.jpg");
  backWall= loadImage("wall_side_right.png");
  sideWall=loadImage("wall_side.png"); 

  //create rooms
  room= new Room[2];
  roomL= new RoomL[2];

  for (int i=0; i<room.length; i++) {
    room[i]=new Room(width, height, 200*(i+1), (width/2.001), 40+200*(i+1)) ;
  }
  for (int i=0; i<roomL.length; i++) {
    roomL[i]=new RoomL(width, height, 200*(i+1), width-(width/2.001), 40+200*(i+1)) ;
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
  empty = new Item(loadImage("item_empty.png"), "empty", 1, 1, false);
  items.add(sword);
  items.add(axe);
  items.add(bow);
  items.add(staff);
  items.add(ring);
  items.add(helmet);
  items.add(hat);
  items.add(shoes);
  items.add(goldKey);
  items.add(silverKey);
  items.add(blueScroll);
  items.add(redScroll);
  items.add(apple);
  items.add(cheese);
  items.add(egg);
  items.add(pie);
  items.add(candle);
  items.add(chalice);
  items.add(potion);
  items.add(necklace);
  items.add(bookshelf);
  items.add(barrel);
  items.add(tableShort);
  items.add(tableLong);
  items.add(chest);
  items.add(bomb);
  items.add(empty);
  println(items);

  int inventorySize = 5;
  for (int i =0; i<inventorySize; i++) {
    inventory.add(new Item(loadImage("item_empty.png"), "empty", 50 *(i+1), 15, false));
  }  

  gameMode = 0;
  detective = new Sprite();
  setRandomItems();
}


void draw() {
  if (gameMode==0) {
    //menu
    color c1 = color(88, 111, 255);
    color c2 = color(116, 255, 154);

    for (int i = 0; i <= width; i++) {
      float inter = map(i, 0, width, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, 0, i, height);
    }
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
    if (!(millis() - time >=wait)) {
      if (score == 5) {
        minigame();
        gameMode = 2;
      }


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

      room[0].display();//display rooms
      room[1].display();//display rooms

      roomL[0].display();//display rooms
      roomL[1].display();
      for (int i=0; i<items.size(); i++) {
        items.get(i).display();
      }
      wallChecks();
      detective.display();
      text(120-(millis()/1000), width-30, 30); //timer
      displayInventory();
      displayRandomItems();
    } else {
      gameMode = 4;
    }
  } else if (gameMode==2) {

    image(background, x, 0); //draw background twice adjacent
    image(background, x+background.width, 0); 
    x -=10;
    if (x == -background.width) {
      x=0; //wrap background
    }



    for (int i=0; i<2; i++) {
      items.get(i).display();
      items.get(i).posX -= 5;
      if (items.get(i).posX < 0) {
        items.get(i).posX = width;
        items.get(i).posY = int(random(100, height-100));
      }
    }
    items.get(12).display();
    items.get(12).posX -= 3;

    if (items.get(12).posX < 0) {
      items.get(12).posX = width;
      items.get(12).posY = int(random(100, height-100));
    }
    if (minigameCollide(color(106, 190, 48))) {
      detective.x += 200;
    }

    if (minigameCollide(color(0)) || minigameCollide(color(87))) {
      detective.x -= 50;
    }

    detective.display();
    enemy.move();
    enemy.display();
    if (detective.x+70 >= enemy.x) {
      gameMode = 3;
    }
    if (detective.x<0) {
      gameMode = 4;
    }
  } else if (gameMode==3) {
    //win //<>//


    color c1 = color(255, 39, 39);
    color c2 = color(255, 15, 212);

    for (int i = 0; i <= width; i++) {
      float inter = map(i, 0, width, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, 0, i, height);
    }

    textAlign(CENTER);
    fill(0);
    text("Congratulations! You saved the gosling!", width/4, (height/2-28));
    fill(255);
    text("Congratulations! You saved the gosling!", width/4, height/2-30);
  } else if (gameMode==4) {
    //lose

    color c1 = color(255, 39, 39);
    color c2 = color(255, 15, 212);

    for (int i = 0; i <= width; i++) {
      float inter = map(i, 0, width, 0, 1);
      color c = lerpColor(c1, c2, inter);
      stroke(c);
      line(i, 0, i, height);
    }
    fill(0);
    textSize(60);
    textAlign(CENTER);
    text("You lost!", (width/2)+2, (height/2-28));
    fill(255);
    text("You lost!", width/2, height/2-30);
  }
}


//NEEEEEEEEEW
void setRandomItems() {
  int randomIndex = int(random(0, 20));
  float xPos;
  float yPos;
  //int index = 0;
  for (int i = 0; i<5; i++) {
    print(i);
    randomIndex = int(random(0, 20));
    Item randomItem = items.get(randomIndex);
    println(randomItemPosX);
    xPos = randomItemPosX[i];
    yPos = randomItemPosY[i];
    randomItem.setX(xPos);
    randomItem.setY(yPos);
    randomItemsList.add(randomItem);
    //randomItem.display();
  }
}

void displayRandomItems() {
  for (int i = 0; i<5; i++) {
    Item item = randomItemsList.get(i);
    item.display();
  }
}




boolean isItemInRange() {
  //
  //
  return true;
}

boolean isInventoryFull() {
  boolean isFull = true;
  //int index = -1; //-1 means no more index avaiable
  for (int i =0; i<inventory.size(); i++) {
    Item tempItem = inventory.get(i);
    //println(tempItem);
    String itemDescription = tempItem.getDescription();
    if (itemDescription == "empty") {
      isFull = false;
      //index = i;
      noLoop();
    }
  }
  return isFull;
}
//NEW

int getIndex() {
  //boolean isFull = true;
  int index = -1;
  for (int i =0; i<inventory.size(); i++) {
    Item tempItem = inventory.get(i);
    //println(tempItem);
    String itemDescription = tempItem.getDescription();
    if (itemDescription == "empty") {
      //isFull = false;
      index = i;
      noLoop();
    }
  }
  return index;
}

//if item has been collided with, then call getItem()
void getItem() {
  String itemRange = str(isItemInRange()); //returns item or null
  //check if space in inventory: spaceInInventory = isInventoryFull()
  boolean spaceInInventory=true;
  int emptyIndex = getIndex();
  //println(itemRange, spaceInInventory);
  if (itemRange != "null" && spaceInInventory == true) {
    //put item in inventory
    //inventory[emptyIndex] = collidedItem;
    //collidedItem.setStatus = true;
  }
}




void wallChecks() {
  back.backWallCheck();
  for (int i=0; i<room.length; i++) {
    room[i].wallDetect();
  }
  for (int i=0; i<roomL.length; i++) {
    roomL[i].wallDetect();
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

  for (int i=0; i<2; i++) {
    items.get(i).itemImage.resize(32, 0);
    items.get(i).posX = width;
    items.get(i).posY = random(0, height);
  }
  items.get(12).itemImage.resize(32, 0);
  items.get(12).posX = enemy.x;
  items.get(12).posY = enemy.y+int(random(-100, 100));

  if (collisionDetection(detective, detective.walkRight.getWidth(), detective.walkRight.getHeight(), items.get(12), items.get(12).getWidth(), items.get(12).getHeight())) {
    detective.x+=20;
  }
}

boolean minigameCollide(color c) {
  color test; 

  for (int i=detective.y; i<detective.y+74; i++) {
    test = get(detective.x+70, i);
    if (test == c) {
      return true;
    }
  }
  return false;
}

void displayInventory() {
  fill(255);
  rect(40, 10, 250, 25);
  for (int i =0; i<inventory.size(); i++) {
    Item tempItem = inventory.get(i);
    tempItem.display();
  }
}






void keyPressed() {
  if ( (key == 'z'|| key == 'Z')&& detective.showTextbox) {
    detective.showTextbox = false;
  } 

  if (gameMode == 0) {
    if (key ==' ') {
      gameMode = 1;
      time = millis();
    }
  }

  if (gameMode == 2) {

    if (keyCode == UP|| key == 'w' || key == 'W') { 
      if (detective.y>0) { //prevents goose going off screen  

        detective.y-=5;
      }
    } else if (keyCode == DOWN|| key == 's'|| key == 'S') {
      if (detective.y<height-74) {

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
        for (int i=0; i<room.length; i++) {
          room[i].doorOpen();
        }

        for (int i=0; i<roomL.length; i++) {
          roomL[i].doorOpen();
        }
        for (int i=0; i<items.size(); i++) {
          items.get(i).pickup(detective.x, detective.y);
          items.get(i).display();
        }
      } else if  (key == 'z'|| key == 'Z') {
        detective.showTextbox = false;
      }
      //else if (facing item && (key == 'z'|| key == 'Z'){

      //}
    }
  }
}
