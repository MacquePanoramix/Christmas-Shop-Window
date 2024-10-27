int numSnowflakes = 200;              
Snowflake[] snowflakes = new Snowflake[numSnowflakes];  

Wall wall;
Window window;
ChristmasHouse house;

void setup() {
  
  size(1600, 900);                  
  
  wall = new Wall();
  window = new Window();
  house = new ChristmasHouse(800, 450, 200, 300);
  
  // Create all snowflakes
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i] = new Snowflake(window.x, window.x + window.diameterX, window.y, window.y+window.diameterY);  // Make it snow inside the window borders
  }
  
}

void draw() {
  
  wall.display(); // Wall display
  
  fill(0);
  rect(window.x, window.y, window.diameterX, window.diameterY); // Set inside display window dark

  house.display();
  window.display();


  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i].update();
    snowflakes[i].display();
  }
  
}
