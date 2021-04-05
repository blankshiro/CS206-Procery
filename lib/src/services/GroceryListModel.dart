import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/GroceryList.dart';

class GroceryListModel with ChangeNotifier {
  String _grocerylistBox = 'groceryList';

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

    print("in getItem - " + grocerylistList.toString());

    notifyListeners();
  }

  updateItem(int index, GroceryList groceryList) {
    final box = Hive.box<GroceryList>(_grocerylistBox);

    print("updating" + box.getAt(index).name);

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
  
  updateItemByKey(int key, GroceryList toUpdate){
    final box = Hive.box<GroceryList>(_grocerylistBox);
    List keys = box.keys.toList();
    for(int i = 0; i < keys.length; i++){
      GroceryList item = box.get(keys[i]);
      if(item.id == key){
        print("updating at " + item.toString() + " to " + toUpdate.toString());
        box.put(keys[i], toUpdate);
        break;
      }
    }

    getItem();

    notifyListeners();

  }

  deleteItemByKey(int key){
    final box = Hive.box<GroceryList>(_grocerylistBox);
    List keys = box.keys.toList();
    for(int i = 0; i < keys.length; i++){
      GroceryList item = box.get(keys[i]);
      if(item.id == key){
        print("deleting at " + item.toString());
        box.delete(keys[i]);
        break;
      }
    }

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
    getItem();

  }
}
