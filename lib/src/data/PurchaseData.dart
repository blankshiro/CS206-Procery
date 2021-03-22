// Data definitions
import '../models/Purchase.dart';
import '../models/Ingredient.dart';

// Sample Data Dependencies
import 'IngredientData.dart';

List<Ingredient> ingredients = getIngredients();
Ingredient flour = ingredients[0];
Ingredient egg = ingredients[1];
Ingredient butter = ingredients[2];
Ingredient chocolate = ingredients[3];
Ingredient milk = ingredients[4];

DateTime today = DateTime.now();

Purchase purchase1 = new Purchase()
  ..ingredient = flour
  ..quantity = 150
  ..dateAdded = today.subtract(Duration(days: 1))
  ..purchased = 0
  ..listName = "My Sample List"
  ..id = 0;

Purchase purchase2 = new Purchase()
  ..ingredient = egg
  ..quantity = 3
  ..dateAdded = today.subtract(Duration(days: 1))
  ..purchased = 1
  ..listName = "My Sample List"
  ..id = 1;

Purchase purchase3 = new Purchase()
  ..ingredient = butter
  ..quantity = 100
  ..dateAdded = today.subtract(Duration(days: 1))
  ..purchased = 0
  ..listName = "My Sample List"
  ..id = 2;

Purchase purchase4 = new Purchase()
  ..ingredient = chocolate
  ..quantity = 50
  ..dateAdded = today.subtract(Duration(days: 1))
  ..purchased = 0
  ..listName = "My Sample List"
  ..id = 3;

Purchase purchase5 = new Purchase()
  ..ingredient = milk
  ..quantity = 751
  ..dateAdded = today.subtract(Duration(days: 1))
  ..purchased = 0
  ..listName = "My Sample List"
  ..id = 4;

List<Purchase> getSampleListPurchase(){
  return [purchase1, purchase2, purchase3, purchase4, purchase5];
}

