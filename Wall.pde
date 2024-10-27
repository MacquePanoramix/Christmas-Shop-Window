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
