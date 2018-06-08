void setup() {
  size(500, 500);
  background(0);
  
  Star[] stars;
  
  fill(255);
  for (int i = 0; i < 500; i++) {
    stars[i] = new Star(random(width), random(height));
  }
  
}

void draw() {

}

class Star {
   float x;
   float y;
   float alpha;
 
   public Star(float x, float y) {
      this.x = x;
      this.y = y;
      this.alpha = 255;
   }
   
   public void changeAlpha() {
       
   }
   
   public void display() {
      ellipse(x, y, 3, 3); 
   }
   
}
