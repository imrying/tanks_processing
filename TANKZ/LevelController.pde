class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int p1Score;
  public int p2Score;
  public int restartTimer;
  public int startTimer;
  public PImage startupImg;

  LevelController() {
    walls.add(new Wall(332, 255, 300, -PI/4));
    walls.add(new Wall(756, 156, 200, 0));
    walls.add(new Wall(1100, 350, 175, 0));
    walls.add(new Wall(1570, 240, 200, -2*PI/10));
    walls.add(new Wall(1570, 620, 200, -8*PI/10));
    walls.add(new Wall(1680, 920, 200, 1.6));
    walls.add(new Wall(1180, 750, 275, -7*PI/10));
    walls.add(new Wall(650, 700, 200, 0));
    walls.add(new Wall(250, 850, 175, 0));
    walls.add(new Wall(800, 1100, 275, 0));
    walls.add(new Wall(600, 400, 200, PI/6));






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
  }
}
