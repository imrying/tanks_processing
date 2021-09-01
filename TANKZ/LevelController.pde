class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int p1Score;
  public int p2Score;
  public int restartTimer;
  public int startTimer;
  public PImage startupImg;

  LevelController() {
    walls.add(new Wall(332, 255, 280, 125, -PI/4));
    walls.add(new Wall(756, 156, 100, 100, 0));
    walls.add(new Wall(990, 347, 150, 150, 0));
    walls.add(new Wall(1570, 240, 400, 200, -2*PI/10));
    walls.add(new Wall(1570, 620, 350, 200, -8*PI/10));
    walls.add(new Wall(1680, 920, 140, 140, 1.6));
    walls.add(new Wall(1180, 750, 550, 300, -7*PI/10));
    walls.add(new Wall(650, 700, 400, 200, 0));
    walls.add(new Wall(250, 850, 150, 300, 0));
    walls.add(new Wall(800, 1100, 550, 290, 0));
    walls.add(new Wall(600, 400, 300, 100, PI/6));






    startupImg = loadImage("Pop-up.png");
    startTimer = 10;
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
  }
}
