import queasycam.*;

QueasyCam cam;

Collection collection1;
Die die1, die2;
boolean freeRotate = false;
float cam_y_velocity = 0;
int up_face = 4;
int north_face = 0;

void setup(){
  size(800, 800, P3D);
  //fullScreen(1, P3D);
  cam = new QueasyCam(this);
  cam.speed = .2;
  cam.sensitivity = 0.3;
  cam.position = new PVector( 68.55572, -23.25305, 56.96473 );
  cam.tilt = 0.43196997;
  cam.pan = 3.9159184;
  
  rectMode(CENTER);

  collection1 = new AxialCollection(1, 1, 1);
  die1 = new Die(0.5,0.5,0.5);
  die2 = new Die(0,0,2.5);
  mousePressed();
  
}

void draw(){
  background(180);
  
  //collection1.draw();
  if (freeRotate) {
    die1.rotateFreely(); 
  }
  die1.draw();
  //die2.draw();
  
  drawAxialLines();
}

void drawAxialLines() {
 pushMatrix();
 stroke(0, 200, 0);
 line(0, 0, 0, 100);
 stroke(200, 0, 0);
 line(0, 0, 100, 0);
 stroke(0, 0, 200);
 rotateX(PI/2);
 line(0, 0, 0, 100);
 popMatrix();
}

void mousePressed() {
 //println(cam.position);
 //println(cam.tilt);
 //println(cam.pan);
 //println(die1.orientation());
 println(up_face%6+1, north_face%6+1);
 die1.setSideUp(up_face+1);
 die1.setSideNorth(north_face+1);
 north_face++;
 if (north_face >= 6) {
   up_face++;
   north_face=0;
 }
}

void keyPressed() {
  switch (key) {
    case 'x':
      die1.orientation.x+=PI/2;
      break;
    case 'y':
      die1.orientation.y+=PI/2;
      break;
    case 'z':
      die1.orientation.z+=PI/2;
      break;
  }
}
