class Snowflake {
  
  float x, y;      
  float speed;     // Falling speed 
  float size;    
  float wind;      // Wind direction/strength
  
  // Change values ro alter possible snow flake variations
  Snowflake() {
    
    x = random(width);   
    y = random(-height, 0);         
    speed = random(1, 5);          
    size = random(2, 5);        
    wind = random(-0.5, 0.5);  
    
  }

 void update() {
   
   // Wind and fall effects
  x += wind;    
  y += speed;
  
  // Wrap around the edges
  if (x > width) x = 0;
  if (x < 0) x = width;
  if (y > height) {
    y = random(-100, 0);
    x = random(width);
  }
  
}

void display() {
  
  noStroke();
  float alpha = map(sin(frameCount * 0.1 + x), -1, 1, 200, 255); // Varying brightness over time to give twinkling effect
  fill(255, alpha);
  ellipse(x, y, size, size);
  
}

}
