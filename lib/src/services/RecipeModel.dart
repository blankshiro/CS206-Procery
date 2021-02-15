import 'package:flutter/material.dart';
import 'package:Procery/src/models/Recipe.dart';
import 'package:hive/hive.dart';

class RecipeModel with ChangeNotifier {
  String _recipeBox = 'ingredient';

  List _recipeList = <Recipe>[];

  List get recipeList => _recipeList;

  addItem(Recipe recipe) async {
    var box = await Hive.openBox<Recipe>(_recipeBox);

    box.add(recipe);

    print('added ' + recipe.name);

    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<Recipe>(_recipeBox);

    _recipeList = box.values.toList();

    notifyListeners();
  }

  updateItem(int index, Recipe recipe) {
    final box = Hive.box<Recipe>(_recipeBox);

    box.putAt(index, recipe);

    print('updated ' + recipe.name);

    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<Recipe>(_recipeBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    notifyListeners();
  }
}