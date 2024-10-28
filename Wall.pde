// Luís De Albuquerque Hollanda || TzuLing Lin
// Group 9

// Class page for the outter wall background

class Wall {
  
  PImage img;
  
  Wall() {
    
   img = loadImage("wall.jpg"); 
    
  }
  
  void display(){
    
    img.resize(width,height);
   background(img); 
    
  }
  
}
