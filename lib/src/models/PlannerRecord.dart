import 'package:hive/hive.dart';
import 'Recipe.dart';
import 'GroceryList.dart';
import 'Ingredient.dart';

part 'PlannerRecord.g.dart';

@HiveType(typeId: 4)
class PlannerRecord {
  @HiveField(0)
  Recipe recipe;

  @HiveField(1)
  DateTime date;

  @HiveField(2) // B/L/D
  String meal;

  @HiveField(3)
  List<int> purchaseId;

  @HiveField(4)
  GroceryList groceryList;

  PlannerRecord(
      {this.recipe,
        this.date,
        this.meal,
        this.purchaseId,
      });

}
