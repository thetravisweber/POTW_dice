public class not189Orienter extends SimpleOrienter {
  public void orientDie(Die die, int x, int y, int z) {
  if (x == 0) {
    die.setSideUp(1); 
  }
 } 
}
