public class Collection {
 
 // ugly
 public ArrayList<ArrayList<ArrayList<Die>>> Dice = new ArrayList<ArrayList<ArrayList<Die>>>(); 
  
 public Collection(int x_layers, int y_layers, int z_layers) {
   int counter = 0;
   for (int i = 0; i < x_layers; i++) {
    ArrayList<ArrayList<Die>> y_layer = new ArrayList<ArrayList<Die>>();
    for (int j = 0; j < y_layers; j++) {
      ArrayList<Die> z_layer = new ArrayList<Die>();
      for (int k = 0; k < z_layers; k++) {
        z_layer.add(new Die(i, j, k));
        Die die = z_layer.get(k);
        
        //if (i==0 && j==0 && k==0) {
        //  z_layer.get(k).setSideNorth(4); 
        //}
        //if (j > 0) {
        //  z_layer.get(k).setSideUp(y_layer.get(j-1).get(k).getBottomSide());
        //}
        //if (i > 0) {
        //  z_layer.get(k).setSideNorth(Dice.get(i-1).get(j).get(k).getSouthSide());
        //}
        
        
        switch(counter) {
          case 0: // [0,0,0]
            die.setSideUp(5);
            die.setSideNorth(3);
            //die.turnRed();
            break;
          case 1: // [0,0,1]
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case 2: // [0,1,0]
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case 3: // [0,1,1]
            die.setSideUp(5);
            die.setSideNorth(3);
            break;
          case 4: // [1,0,0]
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case 5: // [1,0,1]
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case 6: // [1,1,0]
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case 7: // [1,1,1]
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
        }
        counter++;
      }
      y_layer.add(z_layer);
    }
    this.Dice.add(y_layer);
   }
 }
 
 public void draw()
 {
   for (ArrayList<ArrayList<Die>> y_layer: this.Dice) {
    for (ArrayList<Die> z_layer: y_layer) {
     for (Die d: z_layer) {
      d.draw(); 
     }
    }
   }
 }
  
  
 public String coordinates() {
   String collector = "";
   for (ArrayList<ArrayList<Die>> y_layer: this.Dice) {
    for (ArrayList<Die> z_layer: y_layer) {
     for (Die d: z_layer) {
      collector+=d.coordinates();
     }
    }
   }
   return collector;
 }
}
