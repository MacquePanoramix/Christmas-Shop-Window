// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for christmas house
// Position, size adjustable
// Top window light is interactive

class ChristmasHouse {
  float x, y;       // house position
  float w, h;       // house width and height
  color houseColor, roofColor, windowColor, doorColor, bellColor, ribbonColor, leafColor; // colors
  boolean isTopWindowLit; // boolean for top window light

  ChristmasHouse(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.houseColor = color(210, 105, 30);   // brown house
    this.roofColor = color(139, 69, 19);     // dark brown roof
    this.windowColor = color(255, 223, 0);   // window lit color
    this.doorColor = color(100, 50, 0);      // dark door
    this.bellColor = color(255, 215, 0);     // gold bell
    this.leafColor = color(0, 128, 0);       // green leaves
    this.isTopWindowLit = true;              // window light boolean
  }

  void display() {                           // draws house
    fill(houseColor);
    rect(x, y, w, h);

    fill(roofColor);                         // draws roof
    triangle(x, y, x + w, y, x + w / 2, y - h / 2);

    float windowWidth = w / 6;               // draw lit top window
    float windowHeight = h / 6;
    float topWindowX = x + w / 2 - windowWidth / 2;
    float topWindowY = y + h / 8;
    
    fill(isTopWindowLit ? windowColor : color(0));   // windowcolor based on light is on/off boolean
    rect(topWindowX, topWindowY, windowWidth, windowHeight);

    float firstFloorWindowWidth = w / 4;    // two bottom floor windows
    float firstFloorWindowHeight = h / 5;
    float leftWindowX = x + w / 8;
    float rightWindowX = x + 5 * w / 8;
    float firstFloorWindowY = y + h / 2;

    fill(0, 0, 0);                          // windows additino
    rect(leftWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);
    rect(rightWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);

    fill(windowColor);
    rect(leftWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);
    rect(rightWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);

    stroke(0); 
    line(leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(leftWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, leftWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);
    line(rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(rightWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, rightWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);

    float doorWidth = w / 6;                // door!
    float doorHeight = h / 3;
    float doorX = x + w / 2 - doorWidth / 2;
    float doorY = y + h - doorHeight;
  
    fill(doorColor);
    rect(doorX, doorY, doorWidth, doorHeight);
    
    fill(255, 223, 0);                    // door handle circle
    ellipse(doorX + doorWidth - 10, doorY + doorHeight / 2, 8, 8);

    fill(0, 150, 0);                      // green leaf above door
    ellipse(doorX + doorWidth / 2, doorY + doorHeight / 4, doorWidth / 2, doorWidth / 2);

    float bellWidth = w / 10;             // bell
    float bellHeight = h / 12;
    float bellX = x + w / 2 - bellWidth / 2;
    float bellY = y - h / 2 + bellHeight / 2;

    fill(bellColor);                      // bell color
    ellipse(bellX, bellY, bellWidth, bellHeight);

    fill(0);
    ellipse(bellX, bellY + bellHeight / 2, bellWidth / 5, bellWidth / 5);

    fill(leafColor);                      // leaves decoration
    ellipse(bellX - bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
    ellipse(bellX + bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
  }

  boolean isTopWindowClicked(float mouseX, float mouseY) {       // boolean to be used in main mousePressed() , when the following constraints are true, isTopWindowLit can change between true and false
    float windowWidth = w / 6;
    float windowHeight = h / 6;
    float topWindowX = x + w / 2 - windowWidth / 2;
    float topWindowY = y + h / 8;

    return mouseX >= topWindowX && mouseX <= topWindowX + windowWidth &&
           mouseY >= topWindowY && mouseY <= topWindowY + windowHeight;
  }

  void toggleTopWindowLight() {           // use in mousePressed() if statement in main, follow isTopWindowCLicked, the boolean above this void
    isTopWindowLit = !isTopWindowLit;
  }
}
