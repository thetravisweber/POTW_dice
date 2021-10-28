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
        switch(counter) {
          case 0:
            die.setSideUp(5);
            die.setSideNorth(1);
            break;
          case 1:
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case 2:
            die.turnBlue();
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
