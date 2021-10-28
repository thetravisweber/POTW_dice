public class Collection {
 
 // ugly
 public ArrayList<ArrayList<ArrayList<Die>>> Dice = new ArrayList<ArrayList<ArrayList<Die>>>(); 
  
 public Collection(int x_layers, int y_layers, int z_layers) {
   for (int i = 0; i < x_layers; i++) {
    ArrayList<ArrayList<Die>> y_layer = new ArrayList<ArrayList<Die>>();
    for (int j = 0; j < y_layers; j++) {
      ArrayList<Die> z_layer = new ArrayList<Die>();
      for (int k = 0; k < z_layers; k++) {
        z_layer.add(new Die(i, j, k));
        Die die = z_layer.get(k);
        // doing it as a string to preserve order
        String counterString = String.valueOf(i) + String.valueOf(j) + String.valueOf(k);
        switch(counterString) {
          case "000": // [0,0,0]
            die.setSideUp(5);
            die.setSideNorth(3);
            //die.turnRed();
            break;
          case "001": // [0,0,1]
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case "010": // [0,1,0]
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case "011": // [0,1,1]
            die.setSideUp(5);
            die.setSideNorth(3);
            break;
          case "100": // [1,0,0]
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case "101": // [1,0,1]
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case "110": // [1,1,0]
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case "111": // [1,1,1]
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case "002":
            die.setSideUp(5);
            die.setSideNorth(3);
            break;
          case "012":
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case "102":
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case "112":
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case "200":
            die.setSideUp(6);
            die.setSideNorth(3);
            break;
          case "210":
            die.setSideUp(1);
            die.setSideNorth(3);
            break;
          case "201":
            die.setSideUp(1);
            die.setSideNorth(3);
            break;
          case "211":
            die.setSideUp(6);
            die.setSideNorth(3);
            break;
          case "202":
            die.setSideUp(6);
            die.setSideNorth(3);
            break;
          case "212":
            die.setSideUp(1);
            die.setSideNorth(3);
            break;
          case "020":
            die.setSideUp(5);
            die.setSideNorth(3);
            break;
          case "021":
            die.setSideUp(2);
            die.setSideNorth(3);
            break;
          case "120":
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case "121":
            die.setSideUp(5);
            die.setSideNorth(4);
            break;
          case "022":
            die.setSideUp(5);
            die.setSideNorth(3);
            break;
          case "122":
            die.setSideUp(2);
            die.setSideNorth(4);
            break;
          case "220":
            die.setSideUp(6);
            die.setSideNorth(3);
            break;
          case "221":
            die.setSideUp(1);
            die.setSideNorth(3);
            break;
          case "222":
            die.setSideUp(6);
            die.setSideNorth(3);
            break;
          default:
            die.turnBlue();
            println(i,j,k);
        }
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
