class ChristmasHouse {
  float x, y;       // house position
  float w, h;       // house width and height
  color houseColor, roofColor, windowColor, doorColor, bellColor, ribbonColor, leafColor; // colors
  boolean isTopWindowLit; // maybe can change if light is on or not

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
    this.ribbonColor = color(255, 0, 0);     // red ribbon on bell
    this.leafColor = color(0, 128, 0);       // green leaves
    this.isTopWindowLit = true;              // window light boolean
  }

  void display() { // draws house
    fill(houseColor);
    rect(x, y, w, h);

    fill(roofColor);     // draws roof
    triangle(x, y, x + w, y, x + w / 2, y - h / 2);

    // draw lit top window
    float windowWidth = w / 6;
    float windowHeight = h / 6;
    float topWindowX = x + w / 2 - windowWidth / 2;
    float topWindowY = y + h / 8;
    
    fill(isTopWindowLit ? windowColor : color(0)); // can change boolean to turn light off
    rect(topWindowX, topWindowY, windowWidth, windowHeight);

    // two bottom floor windows
    float firstFloorWindowWidth = w / 4;
    float firstFloorWindowHeight = h / 5;
    float leftWindowX = x + w / 8;
    float rightWindowX = x + 5 * w / 8;
    float firstFloorWindowY = y + h / 2;

    fill(0, 0, 0); // windows outline
    rect(leftWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);
    rect(rightWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);

    fill(windowColor);
    rect(leftWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);
    rect(rightWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);

    // window spacing
    stroke(0); 
    line(leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(leftWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, leftWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);
    line(rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(rightWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, rightWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);

    // door
    float doorWidth = w / 6;
    float doorHeight = h / 3;
    float doorX = x + w / 2 - doorWidth / 2;
    float doorY = y + h - doorHeight;

    fill(doorColor);
    rect(doorX, doorY, doorWidth, doorHeight);
    
    // door h andle
    fill(255, 223, 0);  // Yellowish handle
    ellipse(doorX + doorWidth - 10, doorY + doorHeight / 2, 8, 8);

    // green leaf
    fill(0, 150, 0);
    ellipse(doorX + doorWidth / 2, doorY + doorHeight / 4, doorWidth / 2, doorWidth / 2);

    // bell
    float bellWidth = w / 10;
    float bellHeight = h / 12;
    float bellX = x + w / 2 - bellWidth / 2;
    float bellY = y - h / 2 + bellHeight / 2;

    // bell color
    fill(bellColor);
    ellipse(bellX, bellY, bellWidth, bellHeight);

  
    fill(0);
    ellipse(bellX, bellY + bellHeight / 2, bellWidth / 5, bellWidth / 5);

    // bell decoration
    fill(ribbonColor);
    triangle(bellX - bellWidth / 4, bellY - bellHeight / 2,
             bellX + bellWidth / 4, bellY - bellHeight / 2,
             bellX, bellY - bellHeight / 4);

    // leaves decoration
    fill(leafColor);
    ellipse(bellX - bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
    ellipse(bellX + bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
  }

  void toggleTopWindowLight() {
    isTopWindowLit = !isTopWindowLit;
  }
}