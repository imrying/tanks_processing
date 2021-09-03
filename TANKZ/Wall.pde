class Wall {
   public PVector pos;
   public int radius;
   public float angle;
   
   Wall (float wall_x, float wall_y, int r, float a) {
     pos = new PVector(wall_x,wall_y);
     radius = r;
     angle = a;
   }
   
   void update(){
     fill(0,0,0);
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(angle);
     circle(0, 0, radius);
     popMatrix();
   }
  
}
