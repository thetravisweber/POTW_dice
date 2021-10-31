public class BadOrienter extends SimpleOrienter {
  public void orientDie(Die die, int x, int y, int z) {
   if (x==0 && y==0 && z==0) {
     die.setSideNorth(4); 
   }
   if (y > 0) {
     die.setSideUp(this.parent.Dice.get(x).get(y-1).get(z).getBottomSide());
   }
   if (x > 0) {
     die.setSideNorth(this.parent.Dice.get(x-1).get(y).get(z).getSouthSide());
   }
 } 
}
