//player 1imp
boolean w;
boolean s;
boolean a;
boolean d;

//player 2
boolean up;
boolean down;
boolean right;
boolean left;

void keyPressed() {
  if  (keyCode == UP) {
    up = true;
    down = false;
  } 
  if (keyCode == DOWN) {
    down = true;
    up = false;
  }
  if (keyCode == LEFT) {
    left = true;
    right = false;
  }
  if (keyCode == RIGHT) {
    right = true;
    left = false;
  }
  if (key == ' ')
  {
    p2.Shoot();
  }
  if (keyCode == TAB)
  {
    p1.Shoot();
  }
  if (key == 'w') {
    w = true;
    s = false;
  } 
  if (key == 's') {
    s = true;
  }
  if (key == 'a') {
    a = true;
  }
  if (key == 'd') {
    d = true;
  }
}
void keyReleased() {
  if  (keyCode == UP) {
    up = false;
  }
  if (keyCode == DOWN) {
    down = false;
  }
  if (keyCode == LEFT) {
    left = false;
  }
  if (keyCode == RIGHT) {
    right = false;
  }
  if (key == 'w') {
    w = false;
  }  
  if (key == 's') {
    s = false;
  }  
  if (key == 'a') {
    a = false;
  }  
  if (key == 'd') {
    d = false;
  }
}

void Controls()
{
  if (w) {
    p1.pos.add(new PVector(sin(-p1.angle), cos(-p1.angle)).normalize().mult(SPEED));
  }
  if (s) {
    p1.pos.add(new PVector(sin(-p1.angle), cos(-p1.angle)).normalize().mult(-1*SPEED));
  }
  if (d) {
    p1.angle += ANGLE_SPEED;
  }
  if (a) {
    p1.angle -= ANGLE_SPEED;
  }
  if (up) {
    p2.pos.add(new PVector(sin(-p2.angle), cos(-p2.angle)).normalize().mult(SPEED));
  }
  if (down) {
    p2.pos.add(new PVector(sin(-p2.angle), cos(-p2.angle)).normalize().mult(-1*SPEED));
  }
  if (right) {
    p2.angle += ANGLE_SPEED;
  }
  if (left) {
    p2.angle -= ANGLE_SPEED;
  }
}