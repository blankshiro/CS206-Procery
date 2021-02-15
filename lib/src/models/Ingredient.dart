import 'package:hive/hive.dart';

part 'Ingredient.g.dart';

@HiveType(typeId: 1)
class Ingredient {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String description;

  @HiveField(3)
  final int expiryDays;

  @HiveField(4)
  final double price;

  @HiveField(5)
  final int standardQ;

  Ingredient({this.name, this.description, this.expiryDays, this.price, this.standardQ});
}