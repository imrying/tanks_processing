class Bullet {
  public PVector pos, vel;
  int deathTimer = 0;

  Bullet(float x, float y, float vx, float vy)
  {
    pos = new PVector(x, y);
    vel = new PVector(vx, vy);
  }

  void Update()
  {
    if (deathTimer == 0)
    {
      pos = new PVector(-50, -50);
      vel = new PVector(0, 0);
    } else
    {
      deathTimer--;
    }
    circle(pos.x, pos.y, CIRCLE_RADIUS*2);
    pos.add(vel);
    line(pos.x, pos.y, pos.x+vel.x*50, pos.y+vel.y*50);
  }

  void HideBullet() {
    this.pos.x = -500;
    this.pos.y = -500;
  }
}
