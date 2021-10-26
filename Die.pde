public class Die {
  
  private int x,y,z,side_up;
  
  private int size = 20;
  
  public Die(int x, int y, int z, int side_up) {
    this.x = x;
    this.y = y;
    this.z = z;
    this.side_up = side_up;
  }
  
  public void draw() {
     translate(x, y, z);
     fill(255);
     box(size);
     this.drawSides();
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
    
    this.display_pip_pattern(side_num+1);
    popMatrix();
  }
  
  private void display_pip_pattern(int side_num)
  {
    switch (side_num) {
      case 1:
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
      case 6:
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
  
  private void pip(float x_percent, float y_percent) {
    ellipse(x_percent / 100 * size, y_percent / 100 * size, size/10, size/10);
  }
}
