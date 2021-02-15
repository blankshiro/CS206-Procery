import 'package:Procery/src/models/Ingredient.dart';
import 'package:hive/hive.dart';

part 'Recipe.g.dart';

@HiveType(typeId: 2)
class Recipe {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(3)
  final String instructions;

  @HiveField(4)
  final int prepMins;

  @HiveField(5)
  final List<Ingredient> ingredients;

  @HiveField(6)
  final List<int> ingredientsQ;

  Recipe({this.name, this.description, this.instructions, this.prepMins, this.ingredients, this. ingredientsQ});
}