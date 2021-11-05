public class AllSameOrienter extends SimpleOrienter {
  public void orientDie(Die die, int x, int y, int z) {
   die.setSideUp(2);
   die.setSideNorth(4);
 } 
}
