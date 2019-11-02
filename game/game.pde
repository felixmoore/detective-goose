PImage background;
//items for enemies
Item sword, axe, bow, staff,
     ring, helmet, hat, shoes,
     goldKey, silverKey, blueScroll, redScroll,
     apple, cheese, egg,pie,
     candle, chalice, potion, necklace,
     bookshelf, barrel, tableShort, tableLong, chest,
     bomb;
int gameMode;
ArrayList inventory;


void setup(){
  size(1100,825);
  background = loadImage("temp_background.png");
  //Item(PImage imageName, char descrip, float posX, posY, boolean inventoryStatus)
  //make an array with places for furniture to be placed
  //randomly assign furniture (and a random item associated to a particular enemy) to a location
  //x and y in two diff arrays
  
  //weapon
  sword = new Item(loadImage("item_sword.png"), "sword",1,1 ,false);
  axe = new Item(loadImage("item_axe.png"), "axe",1,1 ,false);
  bow = new Item(loadImage("item_bow.png"), "bow",1,1 ,false);
  staff = new Item(loadImage("item_staff.png"), "staff",1,1 ,false);
  //clothing identifier
  ring = new Item(loadImage("item_ring.png"), "ring",1,1 ,false);
  helmet = new Item(loadImage("item_helmet.png"), "helmet",1,1 ,false);
  hat = new Item(loadImage("item_hat.png"), "hat",1,1 ,false);
  shoes = new Item(loadImage("item_shoes.png"), "shoes",1,1 ,false);
  //unlocking item
  goldKey = new Item(loadImage("item_goldKey.png"), "gold key",1,1 ,false);
  silverKey = new Item(loadImage("item_silverKey.png"), "silver key",1,1 ,false);
  redScroll = new Item(loadImage("item_redScroll.png"), "red scroll",1,1 ,false);
  blueScroll = new Item(loadImage("item_blueScroll.png"), "blue scroll",1,1 ,false);
  //food
  apple = new Item(loadImage("item_apple.png"), "apple",1,1,false);
  cheese = new Item(loadImage("item_cheese.png"), "cheese",1,1 ,false);
  egg = new Item(loadImage("item_egg.png"), "egg",1,1 ,false);
  pie = new Item(loadImage("item_pie.png"), "pie",1,1 ,false);
  //location identifier
  candle = new Item(loadImage("item_candle.png"), "candle",1,1 ,false);
  chalice = new Item(loadImage("item_chalice.png"), "chalice",1,1 ,false);
  potion = new Item(loadImage("item_potion.png"), "potion",1,1 ,false);
  necklace = new Item(loadImage("item_necklace.png"), "necklace",1,1 ,false);
  //furniture
  bookshelf = new Item(loadImage("item_bookshelf.png"), "bookshelf",1,1 ,false);
  barrel = new Item(loadImage("item_barrel.png"), "barrel",1,1 ,false);
  tableShort = new Item(loadImage("item_tableShort.png"), "table",1,1 ,false);
  tableLong = new Item(loadImage("item_tableLong.png"), "table",1,1 ,false);
  chest = new Item(loadImage("item_chestClosed.png"), "chest",1,1 ,false);
  // items for mini game
  bomb = new Item(loadImage("item_bomb.png"), "bomb",1,1 ,false);
  
  gameMode = 1;
}


void draw(){
  if (gameMode==1){
    image(background,0,0);
  }
}
//PLAN

//title screen

//intro dialogue (backstory)


//ending
