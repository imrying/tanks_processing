int TANK_WIDTH = 50;
int TANK_HEIGHT = 80;
float SPEED = 1.5;
float CIRCLE_RADIUS = 20;
float ANGLE_SPEED = 0.035;
float BULLET_SPEED = 10;

Tank p1;
Tank p2;
LevelController levelController;

void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(120);
  //smooth();
  background(255);
  strokeWeight(1);
  noStroke();
  smooth();
  p1 = new Tank(width/5, height*4/5, 255, 0, 0);
  p2 = new Tank(width*4/5, height*4/5, 0, 255, 0);
  levelController = new LevelController();
}
void draw() {
  background(255);
  levelController.update();
  //textSize(26);
  //text(int (frameRate)+"FPS",20,20);
  Controls();
  p1.update();
  p2.update();
}
