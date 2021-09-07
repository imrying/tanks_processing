class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int restartTimer;
  public int startTimer;
  public boolean firstSpawn;
  public PImage startupImg;

  int p1Score;
  int p2Score;
  Tank t1, t2;
  Bullet b1, b2;

  LevelController(Tank tank1, Tank tank2, Bullet bullet1, Bullet bullet2) {

    CreateWalls();

    t1 = tank1;
    t2 = tank2;
    b1 = bullet1;
    b2 = bullet2;
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
      textSize(50);
      fill(255,0,0);
      text(p1Score, 20, 50);
      fill(0,255,0);
      text(p2Score, width-50, 50);
      if (firstSpawn) {
        t1.pos = new PVector(random(width), random(height));
        t2.pos = new PVector(random(width), random(height));
        firstSpawn=false;
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
    walls.add(new Wall(800, -20, 275));
    walls.add(new Wall(600, 400, 200));
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
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b1.pos.x, b1.pos.y, CIRCLE_RADIUS))
      {
        PVector commonTangent = new PVector(wall.pos.y-b1.pos.y, b1.pos.x-wall.pos.x);
        float dotProduct = b1.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength)).add(b1.vel.mult(-1));
        b1.vel.mult(-1);
        b1.vel.add(projection.mult(2));
      }
      if (Collide(wall.pos.x, wall.pos.y, wall.radius/2, b2.pos.x, b2.pos.y, CIRCLE_RADIUS))
      {
        PVector commonTangent = new PVector(wall.pos.y-b2.pos.y, b2.pos.x-wall.pos.x);
        float dotProduct = b2.vel.dot(commonTangent);
        float tangentLength = commonTangent.dist(new PVector(0, 0));
        PVector projection = commonTangent.mult(dotProduct/(tangentLength*tangentLength));
        b2.vel.mult(-1);
        b2.vel.add(projection.mult(2));
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b2.pos.x, b2.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b2.HideBullet();
        p2Score++;
        restartTimer = 360;
      }
      if (Collide(t1.pos.x, t1.pos.y, TANK_WIDTH/1.5, b1.pos.x, b1.pos.y, CIRCLE_RADIUS))
      {
        t1.HideTank();
        b1.HideBullet();
        p2Score++;
        restartTimer = 360;
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b2.pos.x, b2.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b2.HideBullet();
        p1Score++;
        ResetLevel();
      }
      if (Collide(t2.pos.x, t2.pos.y, TANK_WIDTH/1.5, b1.pos.x, b1.pos.y, CIRCLE_RADIUS))
      {
        t2.HideTank();
        b1.HideBullet();
        p1Score++;
        restartTimer = 360;

      }
    }
  }

  boolean Collide(float x2, float y2, float r2, float x1, float y1, float r1)
  {
    float dist = sqrt((x1-x2)*(x1-x2)+(y1-y2)*(y1-y2));
    return (dist < r1+r2);
  }
  
  void ResetLevel(){
    b1.HideBullet();
    b2.HideBullet();
    restartTimer = -1;
    firstSpawn = true;
  }

}
