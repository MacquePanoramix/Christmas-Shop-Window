int numSnowflakes = 200;              
Snowflake[] snowflakes = new Snowflake[numSnowflakes];  

void setup() {
  
  size(600, 400);                  
  
  // Create all snowflakes
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i] = new Snowflake();
  }
  
}

void draw() {
  background(0);                      // Clear the screen with a black background


  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i].update();
    snowflakes[i].display();
  }
  
}
