import 'package:hive/hive.dart';
import 'Recipe.dart';
import 'Ingredient.dart';

part 'Purchase.g.dart';

@HiveType(typeId: 3)
class Purchase {
  @HiveField(0)
  Ingredient ingredient;

  @HiveField(1)
  int quantity;

  @HiveField(2)
  DateTime dateAdded;

  @HiveField(3)
  String listName;

  @HiveField(4) // Should be 0 by default
  int purchased = 0;  // amt purchased

  @HiveField(5)
  int id;

  Purchase(
      {this.ingredient,
        this.quantity,
        this.dateAdded,
        this.listName,
        this.purchased,
        this.id
        });

}
