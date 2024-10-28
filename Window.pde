// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for window frame and visual effects to give window impression on shop window

class Window {
  int x, y; // Window top-left coordinates
  int diameterX; // Width
  int diameterY; // Height
  
  PImage noiseTexture;

  Window() {
    x = 100;
    y = 100;
    diameterX = width - 200;
    diameterY = height - 200;

    // Noise texture to simulate frosted glass
    noiseTexture = createImage(diameterX, diameterY, ARGB);
    noiseTexture.loadPixels();
    for (int i = 0; i < noiseTexture.pixels.length; i++) {
      float alpha = random(10, 30); // Adjustable setting for glass appearance
      noiseTexture.pixels[i] = color(255, 255, 255, alpha);
    }
    noiseTexture.updatePixels();
  }

  void display() {
    
    PImage currentWindowArea = get(x, y, diameterX, diameterY);

    // Overlay the noise texture
    currentWindowArea.blend(noiseTexture, 0, 0, diameterX, diameterY, 0, 0, diameterX, diameterY, OVERLAY);

    // Draw window frame
    stroke(100);
    strokeWeight(4);
    noFill();
    rect(x, y, diameterX, diameterY);
    
    image(currentWindowArea, x, y); 

    // Draw glass pane
    noStroke();
    fill(173, 216, 230, 70); // Semi transparent blue
    rect(x, y, diameterX, diameterY);
  }
}
