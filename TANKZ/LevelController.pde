class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int p1Score;
  public int p2Score;
  public int restartTimer;
  public int startTimer;
  public PImage startupImg;
  Tank t1, t2;
  Bullet b1, b2;

  LevelController() {
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

  void CollisionDetection()
  {
    for (Wall wall : walls)
    {
      Collide(wall.pos.x, wall.pos.y, t1.pos.x,t1.pos.y,);
    }
  }

  boolean Collide(float x2, float y2, float r2, float x1, float y1, float r1)
  {
    float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    return (dist < r1+r2);
  }
}
