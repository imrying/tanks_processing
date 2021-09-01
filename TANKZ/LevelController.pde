class LevelController {
  ArrayList<Wall> walls = new ArrayList<Wall>();
  public int p1Score;
  public int p2Score;
  public int restartTimer;
  public boolean firstStart;
  public int startTimer;
  
  LevelController(){
    walls.add(new Wall(100,100,100,50,2));
    walls.add(new Wall(400,300,70,30,0));
    walls.add(new Wall(400,100,100,200,3.14));
    walls.add(new Wall(1000,150,200,10,0));
  }
  
  void update(){
    for (Wall wall:walls) {
      wall.update();
    }
  }
  
  
  
  
  
}
