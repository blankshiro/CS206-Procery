import 'package:hive/hive.dart';
import 'Recipe.dart';
import 'Ingredient.dart';

part 'Purchase.g.dart';

@HiveType(typeId: 3)
class Purchase {
  @HiveField(0)
  List<Ingredient> ingredients;

  @HiveField(1)
  List<int> quantity;

  @HiveField(2)
  List<String> datePurchased;

  Purchase(
      {this.ingredients,
        this.quantity,
        this.datePurchased,
        });

}
