import './Ingredient.dart';
import 'package:hive/hive.dart';

part 'Recipe.g.dart';

@HiveType(typeId: 2)
class Recipe {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(2)
  String image;

  @HiveField(3)
  String instructions;

  @HiveField(4)
  int prepMins;

  @HiveField(5)
  List<Ingredient> ingredients;

  @HiveField(
      6) // Order should match the ingredients ie. ingredients[0] quantity is at ingredientsQ[0]
  List<int> ingredientsQ;

  Recipe(
      {this.name,
      this.description,
      this.image,
      this.instructions,
      this.prepMins,
      this.ingredients,
      this.ingredientsQ});
}
