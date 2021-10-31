// This class is just a default orientation algorithm,
//  it will not generate a shape that matches the problem specifications
class SimpleOrienter implements OrientationAlgorithm {
  
  Collection parent;

  public void setParent(Collection parent) {
    this.parent = parent;
  }

  public void orientDie(Die die, int x, int y, int z) {
    die.setSideUp(x+y+z+1);
    die.setSideNorth(x+y+z+1+2);
  }
}
