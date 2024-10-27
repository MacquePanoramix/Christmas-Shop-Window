int numSnowflakes = 200;              
Snowflake[] snowflakes = new Snowflake[numSnowflakes];  

Wall wall;
Window window;

SnowHills snowHills;
ChristmasHouse house;
Sleigh sleigh;


void setup() {
  
  size(1600, 900);                  
  
  wall = new Wall();
  window = new Window();
  sleigh = new Sleigh();
  
  snowHills = new SnowHills(window.x, window.y, window.diameterX, window.diameterY);
  house = new ChristmasHouse(700, 340, 200, 300);
  
  // Create all snowflakes
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i] = new Snowflake(window.x, window.x + window.diameterX, window.y, window.y+window.diameterY);  // Make it snow inside the window borders
  }
  
}

void draw() {
  
  wall.display(); // Wall display
  
  fill(0);
  rect(window.x, window.y, window.diameterX, window.diameterY); // Set inside display window dark
  
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i].update();
    snowflakes[i].display();
  }
  
  house.display();

  sleigh.update();
  sleigh.display();
  
  snowHills.display(); 
  
  window.display();


void mousePressed() {
  
  // this is the light toggle at top window
  if (house.isTopWindowClicked(mouseX, mouseY)) {
    house.toggleTopWindowLight();
  }

  
}
