//https://processing.org/examples/animatedsprite.html
class Animation {
  PImage[] images;
  int imageCount;
  int frame;
  
  Animation(String imagePrefix, int count) {
    imageCount = count;
    images = new PImage[imageCount];

    for (int i = 0; i < imageCount; i++) {
      String filename = imagePrefix + i + ".png";
      images[i] = loadImage(filename);
    }
  }

  void display(float xpos, float ypos) {
    frame = (frame+1) % (imageCount);
    image(images[frame], xpos, ypos);
  }
  
  float getWidth() {
    return images[0].width;
  }

  float getHeight() {
    return images[0].height;
  }

}
