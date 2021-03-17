import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/GroceryList.dart';

class GroceryListModel with ChangeNotifier {
  String _grocerylistBox = 'ingredient';

  List _grocerylistList = <GroceryList>[];

  List get grocerylistList => _grocerylistList;

  addItem(GroceryList groceryList) async {
    var box = await Hive.openBox<GroceryList>(_grocerylistBox);

    box.add(groceryList);

    print('added ' + groceryList.name);
    getItem();
    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<GroceryList>(_grocerylistBox);

    _grocerylistList = box.values.toList();

    notifyListeners();
  }

  updateItem(int index, GroceryList groceryList) {
    final box = Hive.box<GroceryList>(_grocerylistBox);

    box.putAt(index, groceryList);

    print('updated ' + groceryList.name);

    getItem();
    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<GroceryList>(_grocerylistBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    notifyListeners();
  }

  deleteAll() async{
    var box = await Hive.openBox<GroceryList>(_grocerylistBox);
    while(box.isNotEmpty){
      box.delete(box.keyAt(0));
    }
    print('delete all -');
    print(box.length);

  }
}
