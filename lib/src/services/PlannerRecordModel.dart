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

    getItem();

    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<PlannerRecord>(_plannerRecordBox);

    _plannerRecordList = box.values.toList();
    print('PlannerRecordLength' + plannerRecordList.length.toString() + ":"
      + box.length.toString());

    notifyListeners();
  }

  updateItem(int index, PlannerRecord plannerRecord) {
    final box = Hive.box<PlannerRecord>(_plannerRecordBox);

    box.putAt(index, plannerRecord);

    print('updated ' + plannerRecord.recipe.name);

    getItem();

    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<PlannerRecord>(_plannerRecordBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    notifyListeners();
  }

  deleteAll() async{
    var box = await Hive.openBox<PlannerRecord>(_plannerRecordBox);
    while(box.isNotEmpty){
      box.delete(box.keyAt(0));
    }
    print('delete all -');
    print(box.length);

    getItem();

  }
}
