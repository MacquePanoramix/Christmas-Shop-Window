// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

//Class page for displaying snowflake and dictating how it should move on the screen

class Snowflake {
  
  float x, y;      
  float speed;     // Falling speed 
  float size;    
  float wind;      // Wind direction/strength
  
  float rangeX1, rangeX2, rangeY1, rangeY2; // area where it will be snowing
  
 
  Snowflake(float xRange1, float xRange2, float yRange1, float yRange2) {
    
    rangeX1 = xRange1;
    rangeX2 = xRange2;
    rangeY1 = yRange1;
    rangeY2 = yRange2;
    
     // Change values to alter possible snow flake variations
    x = random(rangeX1, rangeX2);   
    y = random(-height, rangeY1);         
    speed = random(1, 5);          
    size = random(2, 5);        
    wind = random(-0.5, 0.5);  
    
  }

 void update() {
   
   // Wind and fall effects
  x += wind;    
  y += speed;
  
  // Wrap around the edges
  if (x > rangeX2) x = rangeX1;
  if (x < rangeX1) x = rangeX2;
  if (y > rangeY2) {
    y = random(-height, rangeY1);
    x = random(rangeX1, rangeX2);
  }
  
}

void display() {
  
  noStroke();
  float alpha = map(sin(frameCount * 0.1 + x), -1, 1, 200, 255); // Varying brightness over time to give twinkling effect
  fill(255, alpha);
  
  if( y >= rangeY1){ // Only display if snowflake is inside the window
    
    ellipse(x, y, size, size);
  
}

}

}
