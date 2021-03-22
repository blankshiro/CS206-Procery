import 'package:hive/hive.dart';
import 'Recipe.dart';
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

  PlannerRecord(
      {this.recipe,
        this.date,
        this.meal,
        this.purchaseId,
      });

}
