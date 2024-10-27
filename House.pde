class ChristmasHouse {
  float x, y;       // Position of the house
  float w, h;       // Width and height of the house
  color houseColor, roofColor, windowColor, doorColor, bellColor, ribbonColor, leafColor;
  boolean isTopWindowLit;

  ChristmasHouse(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.houseColor = color(210, 105, 30);   // Warm brown for the house
    this.roofColor = color(139, 69, 19);     // Dark brown for the roof
    this.windowColor = color(255, 223, 0);   // Yellowish for the lit window
    this.doorColor = color(100, 50, 0);      // Darker color for the door
    this.bellColor = color(255, 215, 0);     // Gold color for the bell
    this.ribbonColor = color(255, 0, 0);     // Red for the ribbon
    this.leafColor = color(0, 128, 0);       // Green for the holly leaves
    this.isTopWindowLit = true;              // Top window is lit by default
  }

  void display() {
    // Draw the house base
    fill(houseColor);
    rect(x, y, w, h);

    // Draw the roof
    fill(roofColor);
    triangle(x, y, x + w, y, x + w / 2, y - h / 2);

    // Draw the top window with light toggle
    float windowWidth = w / 6;
    float windowHeight = h / 6;
    float topWindowX = x + w / 2 - windowWidth / 2;
    float topWindowY = y + h / 8;
    
    fill(isTopWindowLit ? windowColor : color(0));
    rect(topWindowX, topWindowY, windowWidth, windowHeight);

    // Draw two main windows on the first floor
    float firstFloorWindowWidth = w / 4;
    float firstFloorWindowHeight = h / 5;
    float leftWindowX = x + w / 8;
    float rightWindowX = x + 5 * w / 8;
    float firstFloorWindowY = y + h / 2;

    fill(0, 0, 0); // Dark window frames
    rect(leftWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);
    rect(rightWindowX - 2, firstFloorWindowY - 2, firstFloorWindowWidth + 4, firstFloorWindowHeight + 4);

    fill(windowColor);
    rect(leftWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);
    rect(rightWindowX, firstFloorWindowY, firstFloorWindowWidth, firstFloorWindowHeight);

    // Add window dividers
    stroke(0);  // Black for window dividers
    line(leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, leftWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(leftWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, leftWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);
    line(rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY, rightWindowX + firstFloorWindowWidth / 2, firstFloorWindowY + firstFloorWindowHeight);
    line(rightWindowX, firstFloorWindowY + firstFloorWindowHeight / 2, rightWindowX + firstFloorWindowWidth, firstFloorWindowY + firstFloorWindowHeight / 2);

    // Draw the door
    float doorWidth = w / 6;
    float doorHeight = h / 3;
    float doorX = x + w / 2 - doorWidth / 2;
    float doorY = y + h - doorHeight;

    fill(doorColor);
    rect(doorX, doorY, doorWidth, doorHeight);
    
    // Add door handle
    fill(255, 223, 0);  // Yellowish handle
    ellipse(doorX + doorWidth - 10, doorY + doorHeight / 2, 8, 8);

    // Optional decorations (like a wreath or lights)
    fill(0, 150, 0);  // Green for wreath
    ellipse(doorX + doorWidth / 2, doorY + doorHeight / 4, doorWidth / 2, doorWidth / 2);

    // Draw the bell at the top of the roof
    float bellWidth = w / 10;
    float bellHeight = h / 12;
    float bellX = x + w / 2 - bellWidth / 2;
    float bellY = y - h / 2 + bellHeight / 2;

    // Bell body
    fill(bellColor);
    ellipse(bellX, bellY, bellWidth, bellHeight);

    // Bell clapper
    fill(0); // Black clapper
    ellipse(bellX, bellY + bellHeight / 2, bellWidth / 5, bellWidth / 5);

    // Red ribbon
    fill(ribbonColor);
    triangle(bellX - bellWidth / 4, bellY - bellHeight / 2,
             bellX + bellWidth / 4, bellY - bellHeight / 2,
             bellX, bellY - bellHeight / 4);

    // Green holly leaves
    fill(leafColor);
    ellipse(bellX - bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
    ellipse(bellX + bellWidth / 3, bellY - bellHeight / 3, bellWidth / 5, bellHeight / 3);
  }

  void toggleTopWindowLight() {
    isTopWindowLit = !isTopWindowLit;
  }
}
