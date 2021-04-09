import '../models/Ingredient.dart';

Ingredient Function() flour = () {return Ingredient()
  ..name = "Flour"
  ..description = "Flour"
  ..measurementType = "g"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/flour1.png"
  ..divide = 25;};

Ingredient Function() egg = () {return Ingredient()
  ..name = "Egg"
  ..description = "Egg"
  ..measurementType = ""
  ..standardQ = 6
  ..expiryDays = 12
  ..price = 5.0
  ..image = "assets/images/egg1.jpg"
  ..divide = 1;};

Ingredient Function() butter = () {return Ingredient()
  ..name = "Butter"
  ..description = "Butter"
  ..measurementType = "g"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/butter.jpg"
  ..divide = 25;};

Ingredient Function() chocolate = () {return Ingredient()
  ..name = "Chocolate"
  ..description = "Chocolate"
  ..measurementType = "g"
  ..standardQ = 250
  ..expiryDays = 100
  ..price = 10.0
  ..image = "assets/images/chocochip.jpg"
  ..divide = 20;};

Ingredient Function() milk = () {return Ingredient()
  ..name = "Milk"
  ..description = "Milk"
  ..measurementType = "ml"
  ..standardQ = 1500
  ..expiryDays = 20
  ..price = 10.0
  ..image = "assets/images/milk.png"
  ..divide = 50;};

List<Ingredient> getIngredients() {
  return [flour(), egg(), butter(), chocolate(), milk()];
}
