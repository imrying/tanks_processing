int TANK_WIDTH = 50;
int TANK_HEIGHT = 80;
float SPEED = 1.5;
float CIRCLE_RADIUS = 20;
float ANGLE_SPEED = 0.035;
float BULLET_SPEED = 10;

Tank p1;
Tank p2;
Wall test_wall;

void settings(){
  frameRate(120);
  size(1920, 1080);
}

void setup() {

  smooth();
  background(255);
  strokeWeight(1);
  noStroke();
  smooth();
  p1 = new Tank(width/2, height/2, 91,119,66);
  p2 = new Tank(width/3, height/3, 30,63,90);
  test_wall = new Wall(width/2-200, height/2, 100, 200, 2);
}
void draw() {
  background(255);
  //textSize(26);
  //text(int (frameRate)+"FPS",20,20);
  Controls();
  p1.update();
  p2.update();
  test_wall.update();
}
