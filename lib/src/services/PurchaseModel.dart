import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../models/Purchase.dart';

class PurchaseModel with ChangeNotifier {
  String _purchaseBox = 'purchases';

  List _purchaseList = <Purchase>[];

  List get purchaseList => _purchaseList;

  addItem(Purchase purchase) async {
    var box = await Hive.openBox<Purchase>(_purchaseBox);

    box.add(purchase);

    print('added ' + purchase.ingredient.name);

    getItem();
    notifyListeners();
  }

  getItem() async {
    final box = await Hive.openBox<Purchase>(_purchaseBox);

    _purchaseList = box.values.toList();

    notifyListeners();
  }

  updateItem(int index, Purchase purchase) {
    final box = Hive.box<Purchase>(_purchaseBox);

    box.putAt(index, purchase);

    print('updated ' + purchase.ingredient.name);

    getItem();
    notifyListeners();
  }

  deleteItem(int index) {
    final box = Hive.box<Purchase>(_purchaseBox);

    box.deleteAt(index);

    print('deleted');

    getItem();

    notifyListeners();
  }

  deleteAll() async{
    var box = await Hive.openBox<Purchase>(_purchaseBox);
    while(box.isNotEmpty){
      box.delete(box.keyAt(0));
    }
    print('delete all -');
    print(box.length);

  }
}
