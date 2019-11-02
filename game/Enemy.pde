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
  }
  public void display() {

    walkRight.display(x, y);
  }

  public void move() {
    if (y>10 && y<height-200) {
      float yDist = random(-20, 20); //generates random value to move up/down by
      y+=int(yDist);
    } else if (y>height-80) {
      y -= 20;
    } else if (y<10) {
      y += 20;
    }
  }
}
