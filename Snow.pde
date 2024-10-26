class Snowflake {
  float x, y;      // Position of the snowflake
  float speed;     // Falling speed
  float size;      // Size of the snowflake
  float wind;      // Wind direction

  // Constructor to initialize the snowflake with random properties
  Snowflake() {
    x = random(width);             // Random x-position within the window width
    y = random(-height, 0);        // Random y-position above the window
    speed = random(1, 5);          // Random falling speed between 1 and 5
    size = random(2, 5);           // Random size between 2 and 5 pixels
    wind = random(-0.5, 0.5);  // Random wind direction
  }

 void update() {
  x += wind;    // Move sideways //<>//
  y += speed;
  // Wrap around the edges
  if (x > width) x = 0;
  if (x < 0) x = width;
  if (y > height) {
    y = random(-100, 0);
    x = random(width);
  }
}

  // Method to display the snowflake
void display() {
  noStroke();
  float alpha = map(sin(frameCount * 0.1 + x), -1, 1, 200, 255);
  fill(255, alpha);
  ellipse(x, y, size, size);
}

}
