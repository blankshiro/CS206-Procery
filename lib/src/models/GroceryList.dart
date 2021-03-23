import 'package:hive/hive.dart';
import 'Purchase.dart';

part 'GroceryList.g.dart';

@HiveType(typeId: 6)
class GroceryList {
  @HiveField(0)
  String name;

  @HiveField(1)
  DateTime deadLine;

  @HiveField(2)
  List<Purchase> purchases;

  @HiveField(3)
  double completionPercent;

  @HiveField(4)
  int active = 1; //0-false, 1-true

  @HiveField(5)
  int type; // 0 - autogenerated from mealplanner, 1 - self-created

  @HiveField(6)
  int id;

  GroceryList(
      {this.name,
        this.deadLine,
        this.purchases,
        this.type,
        this.id
      });

  @override
  String toString() {
    return name + " active - " + active.toString();
  }

}
