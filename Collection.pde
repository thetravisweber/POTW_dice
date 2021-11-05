public class Collection {
 
 // ugly
 public ArrayList<ArrayList<ArrayList<Die>>> Dice = new ArrayList<ArrayList<ArrayList<Die>>>(); 
 public OrientationAlgorithm orienter;
 private boolean axial = false;
  
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
   if (this.axial) {
     this.axialDraw();
     return;
   }
   for (ArrayList<ArrayList<Die>> y_layer: this.Dice) {
    for (ArrayList<Die> z_layer: y_layer) {
     for (Die d: z_layer) {
      d.draw(); 
     }
    }
   }
 }
 
 public void axialDraw() {
    for (int i = 0; i < this.Dice.size(); i++) {
     ArrayList<ArrayList<Die>> x_layer = this.Dice.get(i);
     for (int j = 0; j < x_layer.size(); j++) {
       ArrayList<Die> y_layer = x_layer.get(j);
       for (int k = 0; k < y_layer.size(); k++) {
         Die d = y_layer.get(k);
         if (int(abs(i-Dice.size()/2) < 1) + 
           int(abs(j-x_layer.size()/2) < 1) + 
           int(abs(k-y_layer.size()/2) < 1) 
             > 1) {
           d.draw(); 
         }
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
 
 public boolean flipAxial() {
   this.setAxial(!this.axial);
   return this.axial;
 }
 
 public void setAxial(boolean val) {
   this.axial = val;
 }
}
