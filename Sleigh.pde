// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

class Sleigh {
  float x, y;            // Position of the sleigh
  float speed;           // Speed of the sleigh
  color trainColor, sleighColor, wheelColor, connectionColor;
  boolean movingLeft;    // Direction of movement
  int respawnDelay;      // Time to wait before respawning
  int lastDespawnTime;

  Sleigh() {
    this.trainColor = color(80, 80, 80);        // Gray for the train engine
    this.sleighColor = color(255, 0, 0);        // Red for the sleigh
    this.wheelColor = color(255);                 // white for wheels
    this.connectionColor = color(255, 0, 0);    // Red for connecting line
    respawn();
  }

  void respawn() {
    y = random(height / 4, height / 2);         // Keep y above half of the screen
    speed = random(2, 4);                       // Random speed for variety
    movingLeft = random(1) > 0.5;               // Randomly decide direction

    if (movingLeft) {
      x = width + 100;                          // Start off-screen to the right
      speed = -abs(speed);                      // Move to the left
    } else {
      x = -100;                                 // Start off-screen to the left
      speed = abs(speed);                       // Move to the right
    }
    
    lastDespawnTime = millis();                 // Track when it despawns
    respawnDelay = int(random(3000, 7000));     // 3-7 seconds random delay
  }

  void update() {
    x += speed;  // Move the sleigh horizontally

    // Check if the sleigh has left the screen
    if ((movingLeft && x < -100) || (!movingLeft && x > width + 100)) {
      if (millis() - lastDespawnTime >= respawnDelay) {
        respawn();  // Respawn after the delay
      }
    }
  }

  void display() {
    pushMatrix();
    translate(x, y);

    if (movingLeft) {
      scale(-1, 1);  // Flip horizontally when moving left
    }

    // Draw the train engine
    fill(trainColor);
    rect(0, -10, 50, 30);                    // Train engine body
    fill(150);                                // Light gray for chimney
    rect(35, -30, 10, 20);                    // Chimney on top

    // Draw wheels on the train engine
    fill(wheelColor);                         // Black wheels
    ellipse(15, 25, 15, 15);                  // Front wheel
    ellipse(35, 25, 15, 15);                  // Back wheel

    // Draw the sleigh attached behind
    fill(sleighColor);
    rect(-70, 0, 40, 20);                     // Sleigh body behind the train

    // Draw wheels on the sleigh
    fill(wheelColor);
    ellipse(-60, 20, 10, 10);                 // Left wheel of sleigh
    ellipse(-40, 20, 10, 10);                 // Right wheel of sleigh

    // Draw connecting red line between train head and sleigh
    stroke(connectionColor);
    strokeWeight(2);
    line(5, 10, -65, 10);                     // Connecting line
    noStroke();
    
    popMatrix();  // Restore original orientation
  }
}
