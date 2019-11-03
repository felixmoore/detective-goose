class Enemy extends Sprite {
  private Animation walkRight;
  int dX, dY, x, y;
  String[] enemyTypes = {"fox", "bear", "raccoon", "wolf"};


  public Enemy() {
    x=width-125;
    y=height/2;
    int index = int(random(enemyTypes.length));
    walkRight = new Animation("/enemies/"+enemyTypes[index], 2);
  }

  public void attack() {
    //fire some kind of projectile @ goose

    //for (int i=0; i<2; i++) {
    //  items.get(i).posX = x;
    //  items.get(i).posY = y;
    //  int speed = int(random(5, 10));
    //  items.get(i).display();
    //  items.get(i).posX-=speed;
    //}
  }
  public void display() {
    //attack();
    walkRight.display(x, y);
  }

  public void move() {
    if (y>10 && y<height-200) {
      float yDist = random(-20, 20); //generates random value to move up/down by
      y+=int(yDist);
    } else if (y>height-20) {
      y -= 20;
    } else if (y<10) {
      y += 20;
    }


    //for (int i=0; i<2; i++) {
    //  items.get(i).posX = x;
    //  items.get(i).posY = y;
    //  int speed = int(random(5, 10));
    //  items.get(i).display();
    //  items.get(i).posX-=speed;
    //}
  }
}
