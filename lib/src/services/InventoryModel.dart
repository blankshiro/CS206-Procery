import 'package:flutter/material.dart';
import '../models/Inventory.dart';
import 'package:hive/hive.dart';

class InventoryModel with ChangeNotifier {
  String _inventoryBox = 'inventory';

  List _inventoryList = <Inventory>[];

  List get inventoryList => _inventoryList;

  addItem(Inventory inventory) async {
    var box = await Hive.openBox<Inventory>(_inventoryBox);

    box.add(inventory);

    print('added ' + inventory.ingredient.name);
    print(box.length);

    getItem();

    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<Inventory>(_inventoryBox);

    _inventoryList = box.values.toList();
    print(box.length);
    print(inventoryList.length);

    notifyListeners();
  }

  updateItem(int index, Inventory inventory) {
    final box = Hive.box<Inventory>(_inventoryBox);

    box.putAt(index, inventory);

    print('updated ' + inventory.ingredient.name);

    getItem();

    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<Inventory>(_inventoryBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    print('deleting --');
    print(box.length);

    notifyListeners();
  }

  deleteAll() async{
    var box = await Hive.openBox<Inventory>(_inventoryBox);
    while(box.isNotEmpty){
      box.delete(box.keyAt(0));
    }
    print('delete all -');
    print(box.length);

  }
}
