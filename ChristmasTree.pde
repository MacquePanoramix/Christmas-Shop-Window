// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for christmas tree displayed on the shop window

class ChristmasTree {
  
  float x, y;       // tree coordinates
  float diameterX, diameterY;
  
  PImage treeImage; 


  ChristmasTree(float coordX, float coordY, float xDiameter, float yDiameter) {
    
    x = coordX;
    y = coordY;
    diameterX = xDiameter;
    diameterY = yDiameter;
    
    treeImage = loadImage("christmas_tree.png");
    
    // resize to fit in window
    treeImage.resize(int(diameterX), int(diameterY));
    
  }


  void display() {
    
    image(treeImage, x, y);
    
  }
}
