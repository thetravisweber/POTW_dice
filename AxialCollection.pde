// TODO: make this not a subclass, and instead add a flag to the collection class
//  to only draw the axes
public class AxialCollection extends Collection {
 
  public AxialCollection(int x_layers, int y_layers, int z_layers, OrientationAlgorithm orienter) {
    super(x_layers, y_layers, z_layers, orienter);
  }
  
  public void draw() {
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
  
}
