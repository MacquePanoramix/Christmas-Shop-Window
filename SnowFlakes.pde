int numSnowflakes = 200;              // Number of snowflakes
Snowflake[] snowflakes = new Snowflake[numSnowflakes];  // Array to hold snowflakes

void setup() {
  size(600, 400);                     // Set the window size
  // Initialize each snowflake in the array
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i] = new Snowflake();
  }
}

void draw() {
  background(0);                      // Clear the screen with a black background
  // Update and display each snowflake
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i].update();
    snowflakes[i].display();
  }
}
