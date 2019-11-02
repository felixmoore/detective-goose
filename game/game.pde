PImage background;
int gameMode;

void setup(){
  size(1100,825);
  background = loadImage("temp_background.png");
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
