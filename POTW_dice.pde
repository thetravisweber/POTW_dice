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
  cam = new QueasyCam(this);
  cam.speed = .2;
  cam.sensitivity = 0.3;
  cam.position = new PVector( 68.55572, -23.25305, 56.96473 );
  cam.tilt = 0.43196997;
  cam.pan = 3.9159184;
  
  rectMode(CENTER);

  collection1 = new AxialCollection(2,2,1);
  
}

void draw(){
  background(180);
  
  collection1.draw();
  
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
 println(cam.position);
 println(cam.tilt);
 println(cam.pan);
 saveFrame("images/frame-######.png");
}
