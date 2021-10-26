import queasycam.*;

QueasyCam cam;

Collection collection1;

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

  collection1 = new Collection(4, 1, 1);
}

void draw(){
  background(180);
  
  collection1.draw();
}

void mousePressed() {
 println(cam.position);
 println(cam.tilt);
 println(cam.pan);
 println(collection1.coordinates());
}
