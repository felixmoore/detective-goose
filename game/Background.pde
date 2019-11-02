class Background {
  private float y;
  private float x;

  public Background(float gX, float gY) {
    x=gX;
    y=gY;
  }


  public void display() {

    roomBoarder();
  }


  private void roomBoarder() {
    tileFloor(); 
    for (int i=0; i<width; i=i+30) {
      image(backWall, i, 0, 30, 40);
    }
    for (int i=0; i<width; i=i+30) {
      image(backWall, i, height-30, 30, 40);
    }
    for ( int i=0; i<height; i=i+30) {
      image(sideWall, 0, i, 40, 30);
    }
    for ( int i=0; i<height; i=i+30) {
      image(sideWall, width-40, i, 40, 30);
    }
  }

  private void tileFloor() {
    for ( float i =0; i<height; i=i+60) {
      for (float w=0; w<width; w=w+60) {
        image(woodTexture,w,i,60,60);
      }
    }
  }
}
