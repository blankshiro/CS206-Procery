// Data definitions
import '../models/Ingredient.dart';
import '../models/Inventory.dart';

// Sample Data Dependencies
import 'IngredientData.dart';

List<Ingredient> ingredients = getIngredients();
Ingredient flour = ingredients[0];
Ingredient egg = ingredients[1];
Ingredient butter = ingredients[2];
Ingredient chocolate = ingredients[3];
Ingredient milk = ingredients[4];

DateTime today = DateTime.now();

Inventory Function() flourInventory = () {return new Inventory()
  ..ingredient = flour
  ..quantity = 250
  ..datePurchased = today.subtract(Duration(days: 0))
  ..id = 0;};

Inventory Function() eggInventory = () {return new Inventory()
  ..ingredient = egg
  ..quantity = 8
  ..datePurchased = today.subtract(Duration(days: 2))
  ..id = 1;};

Inventory Function() butterInventory = () {return new Inventory()
  ..ingredient = butter
  ..quantity = 200
  ..datePurchased = today.subtract(Duration(days: 3))
  ..id = 2;};

Inventory Function()  chocolateInventory = () {return new Inventory()
  ..ingredient = chocolate
  ..quantity = 150
  ..datePurchased = today.subtract(Duration(days: 4))
  ..id = 3;};

Inventory Function()  milkInventory = () {return new Inventory()
  ..ingredient = milk
  ..quantity = 1000
  ..datePurchased = today.subtract(Duration(days: 5))
  ..id = 4;};

List<Inventory> getInventory() {
  return [flourInventory(), eggInventory(), butterInventory(),
    chocolateInventory(), milkInventory()];
}














// class Inventory {
//   String name;
//   String description;
//   String image;
//   int expiry;
//   bool checked;
//
//   Inventory(this.name, this.description, this.image, this.expiry, this.checked);
// }
//
// List<Inventory> getExpiring() {
//   return <Inventory>[
//     Inventory("Milk", "1000ml", "assets/images/milk.png", 6, false),
//     Inventory("Butter", "250g", "assets/images/butter.jpg", 8, false),
//     Inventory("Oil", "100ml", "assets/images/oil.jpg", 9, false),
//     Inventory("Sugar", "200g", "assets/images/sugar.jpg", 11, false),
//     Inventory("Chocolate Chip", "300g", "assets/images/chocochip.jpg", 15, false),
//     Inventory("Baking Powder", "100g", "assets/images/bakingpowder.jpeg", 18, false),
//   ];
// }
