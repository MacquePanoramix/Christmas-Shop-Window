// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Main program page displaying the Christmas Shop window and it's interactions
// For more information on the possible interactions check ChritmasLights.pde, House.pde and Music_box.pde

import processing.sound.*; // remember to import "sound" library if you want the music to work when clicking on the radio!

int numSnowflakes = 200;

Snowflake[] snowflakes = new Snowflake[numSnowflakes];  

SoundFile sound;
MusicBox musicBox;
Wall wall;
Window window;
SnowHills snowHills;
ChristmasHouse house;
ChristmasTree christmasTree;
ChristmasLights christmasLights;
Sleigh sleigh;


void setup() {
  
  size(1600, 900);                  
  
  wall = new Wall();
  window = new Window();
  sleigh = new Sleigh();
  
  snowHills = new SnowHills(window.x, window.y, window.diameterX, window.diameterY);
  house = new ChristmasHouse(700, 340, 200, 300); // house position and size
  christmasTree = new ChristmasTree(245, 220, 300, 500);
  musicBox = new MusicBox(this, 1200, 600, 50, 50); // music box position and size

  float[] lightX = {
    310, 335, 360, 390, 420, 445, 470,  // bottom row
    330, 360, 390, 420, 450,   // mid-botoom row
    350, 390, 430,     // mid-top row
    390    // top row
  };
  
  float[] lightY = {
    570, 555, 540, 525, 540, 555, 570,  // bottom row
    500, 475, 460, 475, 500,    // mid-botoom row
    425, 405, 425,    // mid-top row
    360    // top row
  };
  
  color[] lightColors = {
    color(255, 0, 0),    // Red
    color(0, 255, 0),    // Green
    color(0, 0, 255),    // Blue
    color(255, 255, 0),  // Yellow
    color(255, 165, 0)   // Orange
  };
  
  christmasLights = new ChristmasLights(lightX, lightY, lightColors, 500);
  
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
  christmasTree.display();
  christmasLights.update();
  christmasLights.display();
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

   // this is the toggle at the christmas tree
  if (mouseX >= christmasTree.x && mouseX <= christmasTree.x + christmasTree.diameterX &&
      mouseY >= christmasTree.y && mouseY <= christmasTree.y + christmasTree.diameterY) {
    // change the tree's blicking pattern when clicked
    christmasLights.nextPattern();
  }
}
