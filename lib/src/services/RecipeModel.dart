import 'package:flutter/material.dart';
import '../models/Recipe.dart';
import 'package:hive/hive.dart';

class RecipeModel with ChangeNotifier {
  String _recipeBox = 'recipe';

  List _recipeList = <Recipe>[];

  List get recipeList => _recipeList;

  addItem(Recipe recipe) async {
    var box = await Hive.openBox<Recipe>(_recipeBox);

    box.add(recipe);

    print('added ' + recipe.name);
    print(box.length);

    getItem();

    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<Recipe>(_recipeBox);

    _recipeList = box.values.toList();
    print(box.length);
    print(recipeList.length);

    notifyListeners();
  }

  updateItem(int index, Recipe recipe) {
    final box = Hive.box<Recipe>(_recipeBox);

    box.putAt(index, recipe);

    print('updated ' + recipe.name);

    getItem();

    notifyListeners();
  }

  updateItemByKey(String key, Recipe toUpdate){
    final box = Hive.box<Recipe>(_recipeBox);
    List keys = box.keys.toList();
    for(int i = 0; i < keys.length; i++){
      Recipe item = box.get(keys[i]);
      if(item.name == key){
        print("updating at " + item.name.toString() + " to " + toUpdate.name.toString());
        box.put(keys[i], toUpdate);
        break;
      }
    }

    getItem();

    notifyListeners();

  }



  deleteItem(int index) {
    final box = Hive.box<Recipe>(_recipeBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    print('deleting --');
    print(box.length);

    notifyListeners();
  }

  deleteAll() async{
    var box = await Hive.openBox<Recipe>(_recipeBox);
    while(box.isNotEmpty){
      box.delete(box.keyAt(0));
    }
    print('delete all -');
    print(box.length);

  }
}
