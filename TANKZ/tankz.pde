int TANK_WIDTH = 50;
int TANK_HEIGHT = 80;
float SPEED = 3;
float CIRCLE_RADIUS = 10;
float ANGLE_SPEED = 0.045;
float BULLET_SPEED = 5;

Tank p1;
Tank p2;
LevelController levelController;

void settings() {
  size(1920, 1080);
}

void setup() {
  frameRate(120);
  background(255);
  noStroke();
  smooth();
  p1 = new Tank(width/5, height*4/5, 255, 0, 0);
  p2 = new Tank(width*4/5, height*4/5, 0, 255, 0);
  levelController = new LevelController(p1, p2, p1.bulleta, p1.bulletb, p2.bulleta, p2.bulletb);
}
void draw() {
  background(255);
  text(frameRate, width/2, height/2);

  Controls();

  levelController.update();
  p1.update();
  p2.update();
}
