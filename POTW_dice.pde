import queasycam.*;

QueasyCam cam;

Die die1, die2;

void setup(){
  size(800, 800, P3D);
  //fullScreen(1, P3D);
  cam = new QueasyCam(this);
  cam.speed = .2;
  cam.sensitivity = 0.3;
  cam.position = new PVector( -67.83133, -27.184465, -28.216642);
  cam.tilt = 0.41783294;
  cam.pan = .3722;
  
  rectMode(CENTER);
  
  die1 = new Die(0, 0, 0, 6);
  die2 = new Die(0, 50, 0, 5);
}

void draw(){
  background(180);
  die1.draw();
  die2.draw();
}

void mousePressed() {
 println(cam.position);
 println(cam.tilt);
 println(cam.pan);
}
