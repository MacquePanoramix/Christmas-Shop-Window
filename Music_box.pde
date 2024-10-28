import processing.sound.*;

class MusicBox {
  float x, y; // music box location
  float w, h; // musix box x y size
  SoundFile sound1;
  boolean isPlaying;

  MusicBox(PApplet sketch, float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.sound1 = new SoundFile(sketch, "1.mp3"); // load jolly holly christmasy music
    this.isPlaying = false;
  }

  void display() {

    fill(139, 69, 19);
    rect(x, y, w, h, 20); // draw the radio

    stroke(90); // this is to draw the antenna
    strokeWeight(2);
    float rodX = x + 35;
    float rodY = y;
    line(rodX, rodY, rodX, rodY - 30);
    noStroke();
    
    fill(90); // antenna tip
    ellipse(rodX, rodY - 32, 5, 5);

    fill(90); // speak grill
    float grillWidth = w * 0.6;
    float grillHeight = h * 0.4;
    float grillX = x + w / 2 - grillWidth / 2;
    float grillY = y + h * 0.25;
    rect(grillX, grillY, grillWidth, grillHeight, 10);

    stroke(60); // speaker lines
    for (float i = grillY + 5; i < grillY + grillHeight; i += 10) {
      line(grillX + 5, i, grillX + grillWidth - 5, i);
    }
    noStroke();

    fill(255, 223, 0); // golden tuning dial
    ellipse(x + w * 0.3, y + h * 0.75, w * 0.1, h * 0.1);
    ellipse(x + w * 0.7, y + h * 0.75, w * 0.1, h * 0.1);

    fill(255, 140, 0); // more details
    rect(x + w * 0.4, y + h * 0.75, w * 0.2, h * 0.03);

    // playing/not playing lights
    fill(isPlaying ? color(0, 255, 0) : color(255, 0, 0)); // Green if playing, red if not
    ellipse(x + w - 20, y + 20, 10, 10); // Indicator at the top right
  }

  void toggleMusic() { // music toggle
    if (isPlaying) {
      sound1.stop();
      isPlaying = false;
    } else {
      sound1.play();
      isPlaying = true;
    }
  }

  boolean isMouseOver(float mx, float my) { // for mousepressed on main
    return mx > x && mx < x + w && my > y && my < y + h;
  }
}
