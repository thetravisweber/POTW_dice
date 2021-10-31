public class Collection {
 
 // ugly
 public ArrayList<ArrayList<ArrayList<Die>>> Dice = new ArrayList<ArrayList<ArrayList<Die>>>(); 
   
 public OrientationAlgorithm orienter;
  
 public Collection(int x_layers, int y_layers, int z_layers, OrientationAlgorithm orienter) {
   this.orienter = orienter;
   this.orienter.setParent(this);
   this.generateDice(x_layers, y_layers, z_layers);
 }
 
 private void generateDice(int x_layers, int y_layers, int z_layers) {
   for (int i = 0; i < x_layers; i++) {
    this.Dice.add(new ArrayList<ArrayList<Die>>());
    for (int j = 0; j < y_layers; j++) {
      this.Dice.get(i).add(new ArrayList<Die>());
      for (int k = 0; k < z_layers; k++) {
        Die baby = new Die(i, j, k);
        this.Dice.get(i).get(j).add(baby);
        this.orienter.orientDie(baby,i,j,k);
      }
    }
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
