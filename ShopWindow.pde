import processing.sound.*; // remember to import "sound" library if you want the music to work when clicking on the radio!

int numSnowflakes = 200;

Snowflake[] snowflakes = new Snowflake[numSnowflakes];  

SoundFile sound;
MusicBox musicBox;
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
  house = new ChristmasHouse(700, 340, 200, 300); // house position and size
  musicBox = new MusicBox(this, 1200, 600, 50, 50); // music box position and size
  
  for (int i = 0; i < numSnowflakes; i++) { // creates the snow flakes
    snowflakes[i] = new Snowflake(window.x, window.x + window.diameterX, window.y, window.y+window.diameterY);  // limit snow within borders
  }
  
}

void draw() {
  
  wall.display(); // displays walls
  
  fill(0);
  rect(window.x, window.y, window.diameterX, window.diameterY); // Set inside display window dark
  
  for (int i = 0; i < numSnowflakes; i++) {
    snowflakes[i].update();
    snowflakes[i].display();
  }
  
  house.display();
  sleigh.update();
  sleigh.display();
  musicBox.display();
  snowHills.display(); 
  window.display();
}

void mousePressed() {
  
  // this is the light toggle at top window
  if (house.isTopWindowClicked(mouseX, mouseY)) {
    house.toggleTopWindowLight();
  }

 // this is the music toggle at musicbox
  if (musicBox.isMouseOver(mouseX, mouseY)) {
    musicBox.toggleMusic();
  }
}
