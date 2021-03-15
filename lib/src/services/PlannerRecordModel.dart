import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/PlannerRecord.dart';

class PlannerRecordModel with ChangeNotifier {
  String _plannerRecordBox = 'plannerRecord';

  List _plannerRecordList = <PlannerRecord>[];

  List get plannerRecordList => _plannerRecordList;

  addItem(PlannerRecord plannerRecord) async {
    var box = await Hive.openBox<PlannerRecord>(_plannerRecordBox);

    box.add(plannerRecord);

    print('added ' + plannerRecord.recipe.name);

    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<PlannerRecord>(_plannerRecordBox);

    _plannerRecordList = box.values.toList();

    notifyListeners();
  }

  updateItem(int index, PlannerRecord plannerRecord) {
    final box = Hive.box<PlannerRecord>(_plannerRecordBox);

    box.putAt(index, plannerRecord);

    print('updated ' + plannerRecord.recipe.name);

    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<PlannerRecord>(_plannerRecordBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    notifyListeners();
  }
}
