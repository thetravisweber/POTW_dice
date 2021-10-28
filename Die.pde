public class Die {
  
  private PVector position;
  public PVector orientation;
  private int side_up = 0;
  private int side_north = 4;
  private boolean rotating_x, rotating_y, rotating_z = false;
  private float rotating_speed = 0.01;
  private boolean is_blue, is_red = false;
  
  public int size = 20;
  
  public int[] mapSideNumToPipNum;
  
  public Die(float x, float y, float z) {
    this.position = new PVector(x*size,y*size,z*size);
    mapSideNumToPipNum = new int[] {6,2,1,5,3,4};
    this.setSideUp(1);
  }
  
  public int getSouthSide() {
    if (side_north == 0) { return 1; }
    return 7 - side_north; 
  }
  
  public int getBottomSide() {
   if (side_up == 0) { return 1; }
   return 7 - side_up; 
  }
  
  // defining Up to be Negative Y
  public void setSideUp(int side_up) {
   this.side_up = side_up%6;
   // because matrix multiplication is for nerds
   switch (this.side_up) {
     case 0:
       this.orientation = new PVector(0,0,0);
       break;
     case 1:
       this.orientation = new PVector(PI,0,0);
       break;
     case 2:
       this.orientation = new PVector(PI/2,0,0);
       break;
     case 5:
       this.orientation = new PVector(-PI/2,0,0);
       break;
     case 3:
       this.orientation = new PVector(0,0,PI/2);
       break;
     case 4:
       this.orientation = new PVector(0,0,-PI/2);
       break;
   }
  }
  
  // defining North to be positive X
  public void setSideNorth(int side_north) {
    this.setSideUp(this.side_up);
    this.side_north = side_north%6;
   // How to avoid doing linear Algebra 101
   // 1, 6, 2, or 5 is up
   if (this.orientation.y == 0 && this.orientation.z == 0) {
     // 1 or 6 are up
     if (this.orientation.x==0||this.orientation.x==PI) {
       switch(this.side_north) {
         case 2:
           this.orientation.y+=PI/2;
           break;
         case 5:
           this.orientation.y+=-PI/2;
           break;
         case 4:
           this.orientation.y+=0;
           break;
         case 3:
           this.orientation.y+=PI;
           break;
         default:
           println(this.illegalOrientationError());
           break;
       }
     } else { // 2 or 5 are up
       switch(this.side_north) {
         case 0:
           this.orientation.z+=PI/2;
           break;
         case 1:
           this.orientation.z+=-PI/2;
           break;
         case 3:
           this.orientation.z+=PI;
           break;
         case 4:
           this.orientation.z+=0;
           break;
         default:
           println(this.illegalOrientationError());
           break;
       }
     }
   } else { // 3 or 4 are up
     float flip = 1;
     if (this.orientation.z < 0) {
       flip*=-1;
     }
     switch(this.side_north) {
       case 2:
         this.orientation.y+=PI/2;
         break;
       case 5:
         this.orientation.y+=-PI/2;
         break;
       case 0:
         this.orientation.y+=flip*PI/2-PI/2;
         break;
       case 1:
         this.orientation.y+=flip*PI/2+PI/2;
         break;
       default:
         println(this.illegalOrientationError());
         break;
     }
   }
  }
  
  private String illegalOrientationError() {
    return String.valueOf(this.side_north) + " is up or down already " + String.valueOf(this.orientation);
  }
  
  public void draw() {
     pushMatrix();
     
     translate(this.position.x, this.position.y, this.position.z);
     this.rotateForOrientation();
     
     fill(255 * int(!is_blue),255*int(!is_blue)*int(!is_red),255*int(!is_red));
     box(size);
     
     this.drawSides();
     popMatrix();
  }
  
  public void turnBlue() {
    this.is_blue = true; 
  }
  
  public void turnRed() {
    this.is_red = true;
  }
  
  private void rotateForOrientation() {
    if (rotating_x) {
      this.orientation.x+=rotating_speed; 
    }
    if (rotating_y) {
      this.orientation.y+=rotating_speed; 
    }
    if (rotating_z) {
      this.orientation.z+=rotating_speed; 
    }
    rotateX(this.orientation.x);
    rotateY(this.orientation.y);
    rotateZ(this.orientation.z);
  }
  
  private void drawSides()
  {
    pushMatrix();
    fill(0);
    for (int i = 0; i < 6; i++) {
      this.drawSide(i); 
    }
    popMatrix();
  }
  
  private void drawSide(int side_num) {
    pushMatrix();
    if (side_num < 4) {
      rotateX(PI/2 * (side_num % 4));
      translate(0, size*.501, 0);
      rotateX(PI/2);
    } else {
      rotateY(PI/2);
      translate(0, 0, size*.501 * (1-2*int(side_num==4)));
      rotateZ(PI/2);
    }
    this.display_pip_pattern(side_num);
    popMatrix();
  }
  
  private void display_pip_pattern(int side_num)
  {
    switch (this.sideNumToPipNum(side_num)) {
      case 6:
        this.pip(0, 0);
        break;
      case 2: 
        this.pip(25, 25);
        this.pip(-25, -25);
        break;
      case 3:
        this.pip(25, 25);
        this.pip(0, 0);
        this.pip(-25, -25);
        break;
      case 4:
        this.pip(25, 25);
        this.pip(25, -25);
        this.pip(-25, 25);
        this.pip(-25, -25);
        break;
      case 5:
        this.pip(25, 25);
        this.pip(25, -25);
        this.pip(0,0);
        this.pip(-25, 25);
        this.pip(-25, -25);
        break;
      case 1:
        this.pip(25, 25);
        this.pip(25, 0);
        this.pip(25, -25);
        this.pip(-25, 25);
        this.pip(-25,0);
        this.pip(-25, -25);
        break;
       default:
         this.pip(0, 0);
         break;
    }
  }
  
  private int sideNumToPipNum(int side_num) {
    return mapSideNumToPipNum[side_num];
  }
  
  private void pip(float x_percent, float y_percent) {
    ellipse(x_percent / 100 * size, y_percent / 100 * size, size/10, size/10);
  }
  
  
  public void rotateFreely() {
    rotating_x=true;
    rotating_z=true;
    rotating_y=false;
  }
  
  public boolean flipRotatingX() {
     return rotating_x=!rotating_x;
  }
  
  public boolean flipRotatingY() {
     return rotating_y=!rotating_y;
  }
  
  public boolean flipRotatingZ() {
     return rotating_z=!rotating_z;
  }
  
  public String coordinates() {
   return String.valueOf(this.position);
  }
  
  public String orientation() {
      return String.valueOf(this.orientation);
  }
}
