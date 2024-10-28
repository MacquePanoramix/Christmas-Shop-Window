// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

//Class page for the snowy hills that serve as the ground of the shop window

class SnowHills {

  float x, y;
  float diameterX, diameterY;

  PImage snowHillsImage;

  SnowHills(float coordX, float coordY, float xDiameter, float yDiameter) {
    x = coordX;
    y = coordY;
    diameterX = xDiameter;
    diameterY = yDiameter;

    snowHillsImage = loadImage("snow_hills.png");

    // resize to fit in window
    snowHillsImage.resize(int(diameterX), int(diameterY));
  }

  void display() {

    image(snowHillsImage, x, y);
  }
}
