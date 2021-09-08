class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int restartTimer;
  public int startTimer;
  public boolean firstSpawn;
  public PImage startupImg;

  int p1Score;
  int p2Score;
  Tank t1, t2;
  Bullet b1a, b1b, b2a, b2b;

  LevelController(Tank tank1, Tank tank2, Bullet bullet1a, Bullet bullet1b, Bullet bullet2a, Bullet bullet2b) {



    t1 = tank1;
    t2 = tank2;
    b1a = bullet1a;
    b1b = bullet1b;
    b2a = bullet2a;
    b2b = bullet2b;
    p1Score = 0;
    p2Score = 0;
    restartTimer = -1;

    startupImg = loadImage("Pop-up.png");
    startTimer = 500;
    firstSpawn = true;
  }

  void update() {
    if (startTimer != 0)
    {
      --startTimer;
      image(startupImg, 0, 0);
    } else
    {
      if (firstSpawn) {
        t1.pos = new PVector(random(width), random(height));
        t2.pos = new PVector(random(width), random(height));
        firstSpawn=false;
        b1a.deathTimer = 0;
        b2a.deathTimer = 0;
        b1b.deathTimer = 0;
        b2b.deathTimer = 0;
        CreateWalls();
      }

      for (Wall wall : walls) {
        wall.update();
      }
    }
    if (restartTimer > 0)
    {
      restartTimer--;
    }

    if (restartTimer == 0) 
    {
      ResetLevel();
    }

    textSize(50);
    fill(255, 0, 0);
    text(p1Score, 20, 50);
    fill(0, 255, 0);

    text(p2Score, width-70, 50);



    CollisionDetection();
  }

  void CreateWalls()
  {
    walls.add(new Wall(300, 500, 289));
    walls.add(new Wall(243, 900, 192));
    walls.add(new Wall(-50, 400, 350));
    walls.add(new Wall(1970, 400, 350));
    walls.add(new Wall(820, 148, 78));
    walls.add(new Wall(760, 770, 309));
    walls.add(new Wall(523, 100, 342));
    walls.add(new Wall(523, 1180, 342));
    walls.add(new Wall(10, 50, 170));
    walls.add(new Wall(10, 1130, 170));
    walls.add(new Wall(1930, 50, 170));
    walls.add(new Wall(1930, 1130, 170));
    walls.add(new Wall(1302, 342, 460));
    walls.add(new Wall(1342, 1050, 342));
    walls.add(new Wall(1342, -30, 342));
    walls.add(new Wall(1097, 701, 78));
    walls.add(new Wall(637, 421, 50));
    walls.add(new Wall(860, 398, 89));
    walls.add(new Wall(95, 690, 120));
    walls.add(new Wall(460, 720, 108));
    walls.add(new Wall(1000, 0, 131));
    walls.add(new Wall(1000, 1080, 131));
    walls.add(new Wall(1570, 690, 170));
    walls.add(new Wall(1780, 901, 111));
    walls.add(new Wall(220, 170, 104));
    walls.add(new Wall(1690, 200, 132));
  }

  void CollisionDetection()
  {
    for (Wall wall : walls)
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
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b1a.pos.x, b1a.pos.y, CIRCLE_RADIUS))
      {
        PVector diffe = new PVector(b1a.pos.x-wall.pos.x, b1a.pos.y-wall.pos.y);
        b1a.pos = PVector.add(wall.pos, diffe.normalize().mult(CIRCLE_RADIUS+wall.radius/2));

        PVector commonTangent = new PVector(wall.pos.y-b1a.pos.y, b1a.pos.x-wall.pos.x);
        float dotProduct = b1a.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength)).add(b1a.vel.mult(-1));
        b1a.vel.mult(-1);
        b1a.vel.add(projection.mult(2));
      }
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b2a.pos.x, b2a.pos.y, CIRCLE_RADIUS))
      {
        PVector diffe = new PVector(b2a.pos.x-wall.pos.x, b2a.pos.y-wall.pos.y);
        b2a.pos = PVector.add(wall.pos, diffe.normalize().mult(CIRCLE_RADIUS+wall.radius/2));

        PVector commonTangent = new PVector(wall.pos.y-b2a.pos.y, b2a.pos.x-wall.pos.x);
        float dotProduct = b2a.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength));
        b2a.vel.mult(-1);
        b2a.vel.add(projection.mult(2));
      }
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b1b.pos.x, b1b.pos.y, CIRCLE_RADIUS))
      {
        PVector diffe = new PVector(b1b.pos.x-wall.pos.x, b1b.pos.y-wall.pos.y);
        b1b.pos = PVector.add(wall.pos, diffe.normalize().mult(CIRCLE_RADIUS+wall.radius/2));

        PVector commonTangent = new PVector(wall.pos.y-b1b.pos.y, b1b.pos.x-wall.pos.x);
        float dotProduct = b1b.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength)).add(b1b.vel.mult(-1));
        b1b.vel.mult(-1);
        b1b.vel.add(projection.mult(2));
      }
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b2b.pos.x, b2b.pos.y, CIRCLE_RADIUS))
      {
        PVector diffe = new PVector(b2b.pos.x-wall.pos.x, b2b.pos.y-wall.pos.y);
        b2b.pos = PVector.add(wall.pos, diffe.normalize().mult(CIRCLE_RADIUS+wall.radius/2));

        PVector commonTangent = new PVector(wall.pos.y-b2b.pos.y, b2b.pos.x-wall.pos.x);
        float dotProduct = b2b.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength));
        b2b.vel.mult(-1);
        b2b.vel.add(projection.mult(2));
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b2a.pos.x, b2a.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b2a.deathTimer = 0;
        p2Score++;
        restartTimer = 180;
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b1a.pos.x, b1a.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b1a.deathTimer = 0;
        p2Score++;
        restartTimer = 180;
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b2a.pos.x, b2a.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b2a.deathTimer = 0;
        p1Score++;
        restartTimer = 180;
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b1a.pos.x, b1a.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b1a.deathTimer = 0;
        p1Score++;
        restartTimer = 180;
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b2b.pos.x, b2b.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b2b.deathTimer = 0;
        p2Score++;
        restartTimer = 180;
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b1b.pos.x, b1b.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b1b.deathTimer = 0;
        p2Score++;
        restartTimer = 180;
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b2b.pos.x, b2b.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b2b.deathTimer = 0;
        p1Score++;
        restartTimer = 180;
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b1b.pos.x, b1b.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b1b.deathTimer = 0;
        p1Score++;
        restartTimer = 180;
      }
    }
  }

  boolean Collide(float x2, float y2, float r2, float x1, float y1, float r1)
  {
    float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    return (dist < r1+r2);
  }

  void ResetLevel() {
    b1a.deathTimer = 0;
    b2a.deathTimer = 0;
    b1b.deathTimer = 0;
    b2b.deathTimer = 0;
    restartTimer = -1;
    t1.pos = new PVector(random(width), random(height));
    t2.pos = new PVector(random(width), random(height));
    firstSpawn=false;
  }
}
