class Wall {
   public PVector pos;
   public int radius;
   
   Wall (float wall_x, float wall_y, int r) {
     pos = new PVector(wall_x,wall_y);
     radius = r;
   }
   
   void update(){
     fill(0,0,0);
     pushMatrix();
     translate(pos.x, pos.y);
     circle(0, 0, radius);
     popMatrix();
   }
  
}
