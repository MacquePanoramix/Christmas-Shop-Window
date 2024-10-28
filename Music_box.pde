// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for music box
// Position, size adjustable
// Music box is interactive
// Plays music

import processing.sound.*;                                                                      // this imports sound library, but people testing this needs to download it!! go to sketch -> import library -> manag libraries and search for "sound". its from processing, so official library

class MusicBox {
  float x, y;                                                                                   // music box location
  float w, h;                                                                                   // musix box x y size
  SoundFile sound1;
  boolean isPlaying;

  MusicBox(PApplet sketch, float x, float y, float w, float h) {                                // constructor the allows changes to x,y, sizes x,y
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.sound1 = new SoundFile(sketch, "1.mp3");                                               // load jolly holly christmasy music from data folder
    this.isPlaying = false;
  }

  void display() {                                                                              // draws the radio     

    fill(139, 69, 19);
    rect(x, y, w, h, 20);

    stroke(90);                                                                                 // draw the antenna
    strokeWeight(2);
    float rodX = x + 35;
    float rodY = y;
    line(rodX, rodY, rodX, rodY - 30);
    noStroke();
    
    fill(90);                                                                                   // tip of the atenna
    ellipse(rodX, rodY - 32, 5, 5);

    fill(90);                                                                                   // speaker grill
    float grillWidth = w * 0.6;
    float grillHeight = h * 0.4;
    float grillX = x + w / 2 - grillWidth / 2;
    float grillY = y + h * 0.25;
    rect(grillX, grillY, grillWidth, grillHeight, 10);

    stroke(60);                                                                                  // speaker grill lines
    for (float i = grillY + 5; i < grillY + grillHeight; i += 10) {
      line(grillX + 5, i, grillX + grillWidth - 5, i);
    }
    noStroke();

    fill(255, 223, 0);                                                                           // golden tuning dials
    ellipse(x + w * 0.3, y + h * 0.75, w * 0.1, h * 0.1);
    ellipse(x + w * 0.7, y + h * 0.75, w * 0.1, h * 0.1);

    fill(255, 140, 0);                                                                           // line beteween dials to look nice
    rect(x + w * 0.4, y + h * 0.75, w * 0.2, h * 0.03);

    fill(isPlaying ? color(0, 255, 0) : color(255, 0, 0));                                       // circle color is green if music is playing, red if not
    ellipse(x + w - 20, y + 20, 10, 10);                                                         // the light
  }


  boolean isMouseOver(float mx, float my) {                                                      // for mousepressed on main, limits mouse clicks only above the music box itself
    return mx > x && mx < x + w && my > y && my < y + h;
  }

  void toggleMusic() {                                                                           // music toggle used in mousePressed() in main, only triggers when isMouseOver and mousePressed
    if (isPlaying) {
      sound1.stop();
      isPlaying = false;
    } else {
      sound1.play();
      isPlaying = true;
    }
  }
}
