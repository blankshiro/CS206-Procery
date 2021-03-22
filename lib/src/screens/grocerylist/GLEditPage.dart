import 'package:Procery/src/data/GroceryListData.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:intl/intl.dart';

import '../../models/GroceryList.dart';
import '../../models/Purchase.dart';
import '../../models/Inventory.dart';

import '../../services/GroceryListModel.dart';
import '../../services/InventoryModel.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';

class GLEditPage extends StatefulWidget {
  final GroceryList groceryList;

  GLEditPage({@required this.groceryList});

  @override
  _GLEditPageState createState() => _GLEditPageState();
}

class _GLEditPageState extends State<GLEditPage> {
  List<bool> _checked;

  @override
  Widget build(BuildContext context) {
    List<GroceryList> groceryListList =
        context.watch<GroceryListModel>().grocerylistList;
    GroceryListModel groceryListModel =
        Provider.of<GroceryListModel>(context, listen: false);
    InventoryModel inventoryModel =
        Provider.of<InventoryModel>(context, listen: false);

    GroceryList initialiseGroceryList() {
      GroceryList toInitialise = null;
      for (int i = 0; i < groceryListList.length; i++) {
        if (groceryListList[i].id == widget.groceryList.id) {
          toInitialise = groceryListList[i];
        }
      }

      if (toInitialise != null) {
        _checked = [];
        for (int i = 0; i < toInitialise.purchases.length; i++) {
          if (toInitialise.purchases[i].quantity ==
              toInitialise.purchases[i].purchased) {
            _checked.add(true);
          } else {
            _checked.add(false);
          }
        }
      }

      return toInitialise;
    }

    GroceryList groceryList = initialiseGroceryList();

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: buildTextTitleVariation1(widget.groceryList.name),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   child: buildTextTitleVariation1('Edit Lists'),
          // ),
          buildNameEntryBar(),
          buildDateEntryBar(),
          buildListOptions(context),
          buildNameAndQuantityHeaders(),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    buildRowNewEntry(),
                    Divider(
                      height: 10,
                      thickness: 1,
                      color: Colors.grey[300],
                      indent: 5,
                      endIndent: 5,
                    ),
                    buildIngredientEntryTab(
                        groceryListModel, inventoryModel, groceryListList),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  ////////////////////////////
  ///BUILD INGREDIENT LISTS TO EDIT
  ////////////////////////////
  Container buildIngredientEntryTab(
      groceryListModel, inventoryModel, List<GroceryList> groceryListList) {
    return Container(
      color: Colors.grey[50],
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: buildIngredientEntryLists(
            groceryListModel, inventoryModel, groceryListList),
      ),
    );
  }

  List<Widget> buildIngredientEntryLists(
      groceryListModel, inventoryModel, List<GroceryList> groceryListList) {
    List<Widget> itemList = [];

    GroceryList currentList = widget.groceryList;
    for (int i = 0; i < groceryListList.length; i++) {
      if (groceryListList[i].id == currentList.id) {
        currentList = groceryListList[i];
      }
    }

    for (var i = 0; i < currentList.purchases.length; i++) {
      // show if the grocery not bought yet
      itemList.add(buildGLIngredientList(groceryListModel, inventoryModel,
          currentList, currentList.purchases[i]));
    }
    return itemList;
  }

  Widget buildGLIngredientList(
      groceryListModel, inventoryModel, groceryList, Purchase _purchase) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: EdgeInsets.all(3),
              child: buildIngredientList(
                  groceryListModel, inventoryModel, groceryList, _purchase),
            ),
            Divider(
              height: 10,
              thickness: 1,
              color: Colors.grey[300],
              indent: 5,
              endIndent: 5,
            ),
          ]),
    );
  }

  Widget buildIngredientList(
      GroceryListModel groceryListModel,
      InventoryModel inventoryModel,
      GroceryList groceryList,
      Purchase _purchase) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              iconSize: 20,
              icon: Icon(Icons.delete_outline),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: _purchase.ingredient.name,
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: _purchase.quantity.toString(),
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: IconButton(
                icon: Icon(Icons.remove),
                iconSize: 30,
                onPressed: () {
                  incrementQuantityPurchased(groceryListModel, inventoryModel,
                      groceryList, _purchase, -1);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: IconButton(
                icon: Icon(Icons.add_rounded),
                iconSize: 30,
                onPressed: () {
                  incrementQuantityPurchased(groceryListModel, inventoryModel,
                      groceryList, _purchase, 1);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void incrementQuantityPurchased(
      GroceryListModel groceryListModel,
      InventoryModel inventoryModel,
      GroceryList groceryList,
      Purchase _purchase,
      int change) {
    // Prevent negatives / overflow
    if ((_purchase.purchased == 0 && change == -1) ||
        (_purchase.purchased == _purchase.quantity && change == 1)) {
      return;
    }

    int glIndex = 0;
    var groceryListList = groceryListModel.grocerylistList;

    for (int i = 0; i < groceryListList.length; i++) {
      if (groceryListList[i].id == groceryList.id) {
        glIndex = i;
        break;
      }
    }

    int purchaseIndex = 0;
    for (int i = 0; i < groceryListList[glIndex].purchases.length; i++) {
      if (groceryListList[glIndex].purchases[i].id == _purchase.id) {
        purchaseIndex = i;
        break;
      }
    }

    GroceryList toUpdate = groceryListList[glIndex];
    toUpdate.purchases[purchaseIndex].purchased += change;
    groceryListModel.updateItem(glIndex, toUpdate);

    int invIndex = -1;
    DateTime today = DateTime.now();
    var inventoryList = inventoryModel.inventoryList;

    // If same date, can use the same inventory record since expiry is similar
    // Else create a new inventory record for the different expiry
    for (int i = 0; i < inventoryList.length; i++) {
      if (inventoryList[i].ingredient.name == _purchase.ingredient.name &&
          today.isSameDate(inventoryList[i].datePurchased)) {
        invIndex = i;
        break;
      }
    }

    if (invIndex >= 0) {
      Inventory toUpdate = inventoryList[invIndex];
      toUpdate.quantity += change;

      inventoryModel.updateItem(invIndex, toUpdate);
    } else if (invIndex == -1) {
      Inventory toUpdate = new Inventory()
        ..ingredient = _purchase.ingredient
        ..quantity = change
        ..datePurchased = today
        ..id = inventoryList.length;

      inventoryModel.addItem(toUpdate);
    }

    return;
  }

  ////////////////////////////
  ///OTHER CONTAINERS
  ////////////////////////////

  Container buildRowNewEntry() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 10,
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Ingredient',
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: '0',
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: Icon(
                Icons.check_circle_outline,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildNameAndQuantityHeaders() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          SizedBox(
            width: 60,
          ),
          Container(
            child: Text(
              'Name:',
              style: h5,
            ),
          ),
          SizedBox(
            width: 110,
          ),
          Container(
            child: Text(
              'toBuy:',
              style: h5,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Container buildListOptions(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton.icon(
            onPressed: () {
              print('Add from Recipe');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Add from Recipe',
              style: TextStyle(),
            ),
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: Colors.white,
            color: Colors.green,
          ),
          RaisedButton.icon(
            onPressed: () {
              print('Combine Lists');
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Combine Lists',
              style: TextStyle(),
            ),
            icon: Icon(
              Icons.add_circle,
              color: Colors.white,
            ),
            textColor: Colors.white,
            splashColor: Colors.white,
            color: Colors.green,
          ),
        ],
      ),
    );
  }

  Container buildDateEntryBar() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                'Date:',
                style: priceText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: DateFormat('yyyy - mm - dd')
                      .format(widget.groceryList.deadLine),
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: IconButton(
                onPressed: () => _selectDate(context),
                icon: Icon(Icons.calendar_today),
                iconSize: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }

  DateTime selectedDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  Container buildNameEntryBar() {
    return Container(
      padding: EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                'Name:',
                style: priceText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: widget.groceryList.name,
                  hintStyle: TextStyle(fontSize: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  contentPadding: EdgeInsets.only(
                    left: 30,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// extension DateOnlyCompare on DateTime {
//   bool isSameDate(DateTime other) {
//     return this.year == other.year &&
//         this.month == other.month &&
//         this.day == other.day;
//   }
// }
