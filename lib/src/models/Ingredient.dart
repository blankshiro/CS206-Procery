import 'package:hive/hive.dart';

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
  double price;

  @HiveField(5) // 6 eggs/250g flour etc
  int standardQ;

  @HiveField(6) // cups/grams/no. etc
  String measurementType;

  Ingredient({this.name, this.description, this.expiryDays, this.price, this.standardQ, this.measurementType});
}