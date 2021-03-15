import 'package:hive/hive.dart';
import 'Recipe.dart';
import 'Ingredient.dart';

part 'PlannerRecord.g.dart';

@HiveType(typeId: 4)
class PlannerRecord {
  @HiveField(0)
  Recipe recipeName;

  @HiveField(1)
  String date;

  @HiveField(2) // B/L/D
  String meal;

  PlannerRecord(
      {this.recipeName,
        this.date,
        this.meal,
      });

}
