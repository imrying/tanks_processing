class Wall {
   public PVector pos;
   public PVector radii;
   public float angle;
   
   Wall (float wall_x, float wall_y, float rad_x, float rad_y, float a) {
     pos = new PVector(wall_x,wall_y);
     radii = new PVector(rad_x, rad_y);
     angle = a;
   }
   
   void update(){
     fill(0,0,0);
     pushMatrix();
     translate(pos.x, pos.y);
     rotate(angle);
     ellipse(0, 0, radii.x, radii.y);
     popMatrix();
   }
  
}
