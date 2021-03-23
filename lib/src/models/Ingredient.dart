import 'package:hive/hive.dart';
import 'Recipe.dart';

part 'Ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  String name;

  @HiveField(1)
  String description;

  @HiveField(3)
  int expiryDays;

  @HiveField(4)
  double price; // cost per standardQ

  @HiveField(5) // 6 eggs/250g flour etc
  int standardQ;

  @HiveField(6) // cups/grams/no. etc
  String measurementType;

  @HiveField(7)
  String image;

  @HiveField(8)
  int divide;  //measuring in quantities of 10/20 etc

  Ingredient(
      {this.name,
      this.description,
      this.expiryDays,
      this.price,
      this.standardQ,
      this.measurementType,
      this.image,
      this.divide});

  String getName() {
    return name;
  }
}
