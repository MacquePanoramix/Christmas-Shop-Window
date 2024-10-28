import processing.sound.*;

class MusicBox {
  float x, y;               // Position of the music box
  float w, h;               // Width and height
  SoundFile sound1, sound2; // Sound files
  boolean isPlaying;        // Is any sound currently playing

  MusicBox(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.sound1 = new SoundFile(this, "1.mp3"); // Load first sound
    this.sound2 = new SoundFile(this, "2.mp3"); // Load second sound
    this.isPlaying = false; // Initially no music is playing
  }

  void display() {
    fill(150);  // Gray for the music box
    rect(x, y, w, h); // Draw the music box
    if (isPlaying) {
      fill(0, 255, 0); // Green if music is playing
      ellipse(x + w / 2, y + h / 2, 20, 20); // Indicator for playing
    }
  }

  boolean isClicked(float mouseX, float mouseY) {
    return mouseX >= x && mouseX <= x + w &&
           mouseY >= y && mouseY <= y + h;
  }

  void playRandomSound() {
    if (isPlaying) {
      stopSounds(); // Stop current sounds
    }

    // Randomly choose to play one of the sounds
    if (random(1) < 0.5) {
      sound1.play();
    } else {
      sound2.play();
    }

    isPlaying = true; // Mark as playing
  }

  void stopSounds() {
    sound1.stop();
    sound2.stop();
    isPlaying = false; // Mark as not playing
  }
}
