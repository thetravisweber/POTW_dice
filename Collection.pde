public class Collection {
 
 // ugly
 ArrayList<ArrayList<ArrayList<Die>>> Dice = new ArrayList<ArrayList<ArrayList<Die>>>(); 
  
 public Collection(int x_layers, int y_layers, int z_layers) {
   for (int i = 0; i < x_layers; i++) {
    ArrayList<ArrayList<Die>> y_layer = new ArrayList<ArrayList<Die>>();
    for (int j = 0; j < y_layers; j++) {
      ArrayList<Die> z_layer = new ArrayList<Die>();
      for (int k = 0; k < z_layers; k++) {
        z_layer.add(new Die(i, j, k));
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
