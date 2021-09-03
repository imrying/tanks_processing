class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int p1Score;
  public int p2Score;
  public int restartTimer;
  public int startTimer;
  public PImage startupImg;
  int timeout = 0;
  Tank t1, t2;
  Bullet b1, b2;

  LevelController(Tank tank1, Tank tank2, Bullet bullet1, Bullet bullet2) {

    CreateWalls();

    t1 = tank1;
    t2 = tank2;
    b1 = bullet1;
    b2 = bullet2;

    startupImg = loadImage("Pop-up.png");
    startTimer = 30;
  }

  void update() {
    if (startTimer != 0)
    {
      --startTimer;
      image(startupImg, 0, 0);
    } else
    {
      for (Wall wall : walls) {
        wall.update();
      }
    }

    CollisionDetection();
  }

  void CreateWalls()
  {
    walls.add(new Wall(332, 255, 300));
    walls.add(new Wall(756, 156, 200));
    walls.add(new Wall(1100, 350, 175));
    walls.add(new Wall(1570, 240, 200));
    walls.add(new Wall(1570, 620, 200));
    walls.add(new Wall(1680, 920, 200));
    walls.add(new Wall(1180, 750, 275));
    walls.add(new Wall(650, 700, 200));
    walls.add(new Wall(250, 850, 175));
    walls.add(new Wall(800, 1100, 275));
    walls.add(new Wall(600, 400, 200));
  }

  void CollisionDetection()
  {
    for (Wall wall : walls)
    {
      if (timeout == 0)
      {
        if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, t1.pos.x, t1.pos.y, TANK_WIDTH/2))
        {
          PVector diffe = new PVector(t1.pos.x-wall.pos.x, t1.pos.y-wall.pos.y);
          t1.pos = PVector.add(wall.pos, diffe.normalize().mult(TANK_WIDTH/2+wall.radius/2));
        }
        if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, t2.pos.x, t2.pos.y, TANK_WIDTH/2))
        {
          PVector diffe = new PVector(t2.pos.x-wall.pos.x, t2.pos.y-wall.pos.y);
          t2.pos = PVector.add(wall.pos, diffe.normalize().mult(TANK_WIDTH/2+wall.radius/2));
        }
        if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b1.pos.x, b1.pos.y, CIRCLE_RADIUS))
        {
          float alpha = PVector.angleBetween(b1.vel, new PVector(wall.pos.x-b1.pos.x, wall.pos.y-b1.pos.y));
          b1.vel.rotate(2*(alpha-PI/2));
          timeout = 1000;
        }
        if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b2.pos.x, b2.pos.y, CIRCLE_RADIUS))
        {
          float alpha = PVector.angleBetween(b2.vel, new PVector(wall.pos.x-b2.pos.x, wall.pos.y-b2.pos.y));
          b2.vel.rotate(2*(alpha -PI/2));
          timeout = 1000;
        }
      } else {
        timeout--;
      }
    }
  }

  boolean Collide(float x2, float y2, float r2, float x1, float y1, float r1)
  {
    float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    return (dist < r1+r2);
  }
}
