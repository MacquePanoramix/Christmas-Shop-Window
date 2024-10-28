// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for the sleigh thast is shown flying from one side to the other on top of the christmas shop window
// nothing adjustable, should be constant
// doesnt fully work yet as of october 28 xd

class Sleigh {
  float x, y;                                       // positions of the sleigh
  float speed;                                      // speed float
  color trainColor, sleighColor, wheelColor, connectionColor;
  boolean movingLeft;                               // directrion boolean
  int respawnDelay;                                 // respawn time delay
  int lastDespawnTime;                              // keeps track of despawns

  float range1, range2; // Shop window area

  Sleigh(float range1, float range2) {
    this.range1 = range1;
    this.range2 = range2;

    this.trainColor = color(80, 80, 80);            // train engine is grey
    this.sleighColor = color(255, 0, 0);            // sleigh is red
    this.wheelColor = color(255);                   // wheels are white 👍
    this.connectionColor = color(255, 0, 0);        // red conneting cable thingy
    respawn();
  }

  void respawn() {
    y = random(height / 4, height / 2);             // keep sleigh's y above half of the screen so its flying
    speed = random(2, 4);                           // random sleigh speed
    movingLeft = random(1) > 0.5;                   // random sleigh direction when spawning

    if (movingLeft) {                               // if boolean so sleigh can go both ways
      x = width + 100;                              // spawn out of canvas from right
      speed = -speed;                               // moves to the left
    } else {
      x = -100;                                     // spawn out of canvas from left
      speed = speed;                                // moves to the right
    }
    
    lastDespawnTime = millis();                     // tracks last despawn time
    respawnDelay = int(random(3000, 7000));         // give a random tick between 3000 and 7000 (3 to 7 seconds), this doenst really work lol
  }

  void update() {
    x += speed;                                     // move the sleigh horizontally

    if ((movingLeft && x < -100) || (!movingLeft && x > width + 100)) {    // check for the sleigh has left the screen
      if (millis() - lastDespawnTime >= respawnDelay) {  // man 
        respawn();  // Respawn after the delay
      }
    }
  }

  void display() {
if(x > range1+50 && x < range2-50){ // offset a bit to make sure is inside window
    pushMatrix();
    translate(x, y);

    if (movingLeft) {
      scale(-1, 1);                                 // flip horizontally when moving left to look nice
    }

    fill(trainColor);                               // draw train engine
    rect(0, -10, 50, 30);
    fill(150);
    rect(35, -30, 10, 20);

    fill(wheelColor);                               // draw train wheels
    ellipse(15, 25, 15, 15);
    ellipse(35, 25, 15, 15);

    fill(sleighColor);                              // draw sleigh conneted to train
    rect(-70, 0, 40, 20);

    fill(wheelColor);                               // draw sleigh wheels
    ellipse(-60, 20, 10, 10);
    ellipse(-40, 20, 10, 10);

    stroke(connectionColor);                        // draw connetion between train and sleih
    strokeWeight(2);
    line(5, 10, -65, 10);
    noStroke();
    
    popMatrix();
  }
  }
}

