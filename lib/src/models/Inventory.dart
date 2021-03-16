import 'package:hive/hive.dart';
import 'Recipe.dart';
import 'Ingredient.dart';

part 'Inventory.g.dart';

@HiveType(typeId: 5)
class Inventory {
  @HiveField(0)
  Ingredient ingredient;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  DateTime datePurchased;

  @HiveField(3)
  int daysToExpiry;

  @HiveField(4)
  int id;

  Inventory(
      {this.ingredient,
        this.quantity,
        this.datePurchased,
        this.id,
      });

}
