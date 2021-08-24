class Tank {
  public PVector pos;
  public float angle;
  boolean loaded;
  Bullet bullet;
  float bulletSpeed;

  int r, g, b;

  Tank (float pos_x, float pos_y, int r_, int g_, int b_) {
    pos = new PVector(pos_x, pos_y);
    angle = 50;
    loaded = true;

    r = r_;
    g = g_;
    b = b_;
    bullet = new Bullet(random(0, 1000), -50, 0, 0);
    bulletSpeed = 10;
  }

  void update() {
    fill(r, g, b);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    noStroke();
    rect(-TANK_WIDTH/2, -TANK_HEIGHT/2, TANK_WIDTH, TANK_HEIGHT);
    fill(r-40,g-40,b-40);
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
      bullet.vel.x = bulletSpeed*sin(-angle);
      bullet.vel.y = bulletSpeed*cos(-angle);
    }
  }
}
