//whether or not the item holds a clue
//need inventory in main

//make class a sprite so that can detect a collision with goose sprite
class Item{
  private String description;
  private float posX;
  private float posY;
  private boolean inventoryStatus;
  private PImage itemImage;
  
  public Item(PImage imageName, String descrip, float x, float y, boolean status){
    description = descrip;
    posX = x;
    posY = y;
    inventoryStatus = status;
    itemImage = imageName;
  }
  
  public void setStatus(boolean isCollected){
    inventoryStatus = isCollected;
  }
  
  public boolean getStatus(){ 
    return inventoryStatus;
  }
  
  public String getDescription(){
    return description;
  }
  
  public void display(){
    image(itemImage,posX,posY);
  }
    
  public float getX(){
    return posX;
  }
  
  public float getY(){
    return posY;
  }
  
  public void setX(float x){
    posX = x;
  }
  
  public void setY(float y){
    posY = y;
  }
}

//minigame: powerups need to come from right and move left until off screen or collected by player
