import '../models/Ingredient.dart';

Ingredient flour = Ingredient()
  ..name = "Flour"
  ..description = "Flour"
  ..measurementType = "gram"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/oil.jpg"; //TODO: to replace with correct image

Ingredient egg = Ingredient()
  ..name = "Egg"
  ..description = "Egg"
  ..measurementType = "num"
  ..standardQ = 6
  ..expiryDays = 12
  ..price = 5.0
  ..image = "assets/images/bakingpowder.jpeg"; //TODO: to replace with correct image

Ingredient butter = Ingredient()
  ..name = "Butter"
  ..description = "Butter"
  ..measurementType = "gram"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/butter.jpg";

Ingredient chocolate = Ingredient()
  ..name = "Chocolate"
  ..description = "Chocolate"
  ..measurementType = "gram"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/chocochip.jpg";

Ingredient milk = Ingredient()
  ..name = "Milk"
  ..description = "Milk"
  ..measurementType = "ml"
  ..standardQ = 1500
  ..expiryDays = 20
  ..price = 10.0
  ..image = "assets/images/milk.png";

List<Ingredient> getIngredients() {
  return [flour, egg, butter, chocolate, milk];
}