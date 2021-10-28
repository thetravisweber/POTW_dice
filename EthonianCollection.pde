public class EthonianCollection extends Collection {
 
  public EthonianCollection(int x_layers, int y_layers, int z_layers) {
    super(x_layers, y_layers, z_layers);
  }
 
  
  public void orientDie(Die die, int x, int y, int z) {
    // doing it as a string to preserve order
    String counterString = String.valueOf(x) + String.valueOf(y) + String.valueOf(z);
    switch(counterString) {
      case "000":
        die.setSideUp(5);
        die.setSideNorth(3);
        break;
      case "001":
        die.setSideUp(2);
        die.setSideNorth(3);
        break;
      case "010":
        die.setSideUp(2);
        die.setSideNorth(3);
        break;
      case "011":
        die.setSideUp(5);
        die.setSideNorth(3);
        break;
      case "100":
        die.setSideUp(2);
        die.setSideNorth(4);
        break;
      case "101":
        die.setSideUp(5);
        die.setSideNorth(4);
        break;
      case "110":
        die.setSideUp(5);
        die.setSideNorth(4);
        break;
      case "111":
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
        println(x,y,z);
    }
  }
}
