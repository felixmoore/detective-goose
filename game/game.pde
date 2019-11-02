PImage background;
int gameMode = 0; //0=menu, 1=main game, 2=mini game, 3=win, 4=lose
Player detective;
int x = 0;



void setup() {
  size(1100, 825);
  //background = loadImage("temp_background.png");
  frameRate(30); //controls animation speed
  gameMode = 2;
  detective = new Player();
}


void draw() {
  if (gameMode==0){
    //menu
  } 
  else if (gameMode==1) {
    //image(background,0,0);
    background(255);
    detective.display();
  } 
  else if (gameMode==2) {
    minigame();
    image(background, x, 0); //draw background twice adjacent
    image(background, x+background.width, 0); 
    x -=10;
    if (x == -background.width) {
      x=0; //wrap background
    }
    detective.display();
  }
  else if (gameMode==3) {
    //win
  }
  else if (gameMode==4) {
    //lose
  }
  
}


void minigame() {
  background = loadImage("grass.png");
  background.resize(width, height);

  //new enemy object (?)
}

void keyPressed() {
  if (gameMode == 2) {
    if (key == CODED) { //moves goose on key press
      if (keyCode == UP) { 
        if (detective.y>10) { //prevents goose going off screen  
          detective.y=detective.y-5;
        }
      } else if (keyCode == DOWN) {
        if (detective.y<height-20) {
          detective.y=detective.y+5;
        }
      }
    }
  }
}
