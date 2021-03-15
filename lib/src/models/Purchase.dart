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
  DateTime datePurchased;

  Purchase(
      {this.ingredient,
        this.quantity,
        this.datePurchased,
        });

}
