PImage background;
int gameMode = 0; //0=menu, 1=main game, 2=mini game, 3=win, 4=lose
Sprite detective;
Enemy enemy;
int x = 0;



void setup() {
  size(1100, 825);
  //background = loadImage("temp_background.png");
  frameRate(30); //controls animation speed
  gameMode = 0;
  detective = new Sprite();
 
}


void draw() {
  if (gameMode==0) {
    //menu
        minigame();
       
  } else if (gameMode==1) {
    //image(background,0,0);
    background(255);
    detective.display();
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
  detective.walkRight.display(detective.x,detective.y);
}

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
    }



   
  }
}
