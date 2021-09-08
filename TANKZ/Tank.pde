class Tank {
  public PVector pos;
  public float angle;
  boolean loaded;
  Bullet bulleta;
  Bullet bulletb;
  color c;

  Tank (float pos_x, float pos_y, int r, int g, int b) {
    pos = new PVector(pos_x, pos_y);
    loaded = true;
    c=color(r, g, b);
    bulleta = new Bullet(random(0, 1000), -50, 0, 0);
    bulletb = new Bullet(random(0, 1000), -50, 0, 0);
  }

  void update() {
    fill(c);
    pushMatrix();
    translate(pos.x, pos.y);
    rotate(angle);
    rect(-TANK_WIDTH/2, -TANK_HEIGHT/2, TANK_WIDTH, TANK_HEIGHT);
    fill(red(c)-60, green(c)-60, blue(c)-60);
    rect(6, TANK_HEIGHT/2+TANK_HEIGHT/8, -12, -TANK_HEIGHT*5/8);
    circle(0, 0, 40);
    popMatrix();
    bulleta.Update();
    bulletb.Update();

    if (pos.x > width && pos.x < (width + 100))
    {
      pos.x -= width;
    } else if (pos.x < 0 && pos.x > -100)
    {
      pos.x += width;
    }

    if (pos.y > height && pos.y < height + 100)
    {
      pos.y -= height;
    } else if (pos.y < 0 && pos.y > -100)
    {
      pos.y += height;
    }
  }

  void Shoot()
  {
    if (bulleta.deathTimer == 0)
    {
      bulleta.deathTimer = 600;
      bulleta.pos.x = pos.x + sin(-angle)*(TANK_WIDTH+80)/2;
      bulleta.pos.y = pos.y + cos(-angle)*(TANK_HEIGHT+50)/2;
      bulleta.vel.x = BULLET_SPEED*sin(-angle);
      bulleta.vel.y = BULLET_SPEED*cos(-angle);
    }
    else if (bulletb.deathTimer == 0)
    {
      bulletb.deathTimer = 600;
      bulletb.pos.x = pos.x + sin(-angle)*(TANK_WIDTH+80)/2;
      bulletb.pos.y = pos.y + cos(-angle)*(TANK_HEIGHT+50)/2;
      bulletb.vel.x = BULLET_SPEED*sin(-angle);
      bulletb.vel.y = BULLET_SPEED*cos(-angle);
    }
  }
  void HideTank() {
    pos = new PVector(-1000, -1000);
  }
}
