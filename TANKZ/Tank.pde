class Tank {
  public PVector pos;
  public float angle;
  boolean loaded;
  Bullet bullet;
  color c;

  Tank (float pos_x, float pos_y, int r, int g, int b) {
    pos = new PVector(pos_x, pos_y);
    loaded = true;
    c=color(r, g, b);
    bullet = new Bullet(random(0, 1000), -50, 0, 0);
  }

  void update() {
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    noStroke();
    rect(-TANK_WIDTH/2, -TANK_HEIGHT/2, TANK_WIDTH, TANK_HEIGHT);
    fill(red(c)-40,green(c)-40,blue(c)-40);
    rect(6, TANK_HEIGHT/2+TANK_HEIGHT/8, -12, -TANK_HEIGHT*5/8);
    circle(0, 0, 40);
    popMatrix();
    bullet.Update();
  }

  void Shoot()
  {
    if (bullet.deathTimer == 0)
    {
      bullet.deathTimer = 100;
      bullet.pos.x = pos.x + sin(-angle)*(TANK_WIDTH+80)/2;
      bullet.pos.y = pos.y + cos(-angle)*(TANK_HEIGHT+50)/2;
      bullet.vel.x = BULLET_SPEED*sin(-angle);
      bullet.vel.y = BULLET_SPEED*cos(-angle);
    }
  }
}
