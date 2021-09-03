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
      pos = new PVector(random(0, 1000), -50);
      vel = new PVector(0, 0);
    }
    else
    {
      deathTimer--;
    }
    circle(pos.x, pos.y, CIRCLE_RADIUS);
    pos.add(vel);
  }
  
}
