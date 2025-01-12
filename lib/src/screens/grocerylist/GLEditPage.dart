import 'package:Procery/src/data/GroceryListData.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLEditAddRecipePage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/services/PurchaseModel.dart';
import 'package:intl/intl.dart';
import '../../screens/BaseWidgets.dart';

import '../../models/GroceryList.dart';
import '../../models/Purchase.dart';
import '../../models/Inventory.dart';
import '../../models/Ingredient.dart';

import '../../services/GroceryListModel.dart';
import '../../services/InventoryModel.dart';
import '../../services/IngredientModel.dart';

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
  TextEditingController textController1 = TextEditingController();
  TextEditingController textController2 = TextEditingController();
  IngredientModel ingredientModel;
  PurchaseModel purchaseModel;

  @override
  Widget build(BuildContext context) {
    List<GroceryList> groceryListList =
        context.watch<GroceryListModel>().grocerylistList;
    GroceryListModel groceryListModel =
        Provider.of<GroceryListModel>(context, listen: false);
    InventoryModel inventoryModel =
        Provider.of<InventoryModel>(context, listen: false);
    ingredientModel = Provider.of<IngredientModel>(context, listen: false);
    purchaseModel = Provider.of<PurchaseModel>(context, listen: false);

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
          getBackButton(context),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 0, 0),
            child: Text(
              "My",
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 0, 10),
            alignment: Alignment.centerLeft,
            child: Text(
              groceryList.name,
              textAlign: TextAlign.left,
              style: TextStyle(
                fontSize: 27,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          buildNameEntryBar(),
          buildDateEntryBar(),
          buildListOptions(context, groceryListModel),
          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Container(
                child: Column(
                  children: [
                    // buildRowNewEntry(groceryListModel),
                    buildNameAndQuantityHeaders(),
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
            flex: 2,
            child: IconButton(
              onPressed: () {
                deleteItemToPurchase(groceryListModel, _purchase);
              },
              iconSize: 20,
              icon: Icon(Icons.delete_outline),
            ),
          ),
          Expanded(
            flex: 4,
            child: Text(
              _purchase.ingredient.name,
              style: priceText,
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
              padding: EdgeInsets.fromLTRB(0, 7, 0, 0),
              width: 10,
              height: 35,
              child: Text(
                _purchase.quantity.toString() + _purchase.ingredient.measurementType.toString(),
                style: priceText,
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
                  incrementQuantityToPurchase(groceryListModel, inventoryModel,
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
                  incrementQuantityToPurchase(groceryListModel, inventoryModel,
                      groceryList, _purchase, 1);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
        ],
      ),
    );
  }

  void incrementQuantityToPurchase(
      GroceryListModel groceryListModel,
      InventoryModel inventoryModel,
      GroceryList groceryList,
      Purchase _purchase,
      int change) {
    // Prevent negatives / there is no overflow
    if (_purchase.quantity == 0 && change == -1) {
      return;
    }

    GroceryList toUpdateList;
    var groceryListList = groceryListModel.grocerylistList;

    for (int i = 0; i < groceryListList.length; i++) {
      if (groceryListList[i].id == groceryList.id) {
        toUpdateList = groceryListList[i];
        break;
      }
    }

    int purchaseIndex = 0;
    for (int i = 0; i < toUpdateList.purchases.length; i++) {
      if (toUpdateList.purchases[i].id == _purchase.id) {
        toUpdateList.purchases[i].quantity += change;
        break;
      }
    }

    groceryListModel.updateItemByKey(toUpdateList.id, toUpdateList);

    return;
  }

  void createNewItemToPurchase(
      GroceryListModel groceryListModel, String itemName, String itemQ) {
    GroceryList toUpdateList = widget.groceryList;
    Purchase toUpdatePurchase;
    for (int i = 0; i < toUpdateList.purchases.length; i++) {
      if (toUpdateList.purchases[i].ingredient.name == itemName) {
        toUpdateList.purchases[i].quantity += int.parse(itemQ);
        toUpdatePurchase = toUpdateList.purchases[i];
        break;
      }
    }

    if (toUpdatePurchase == null) {
      List<Ingredient> ingredientList = ingredientModel.ingredientList;
      Ingredient toBuy;
      for (int i = 0; i < ingredientList.length; i++) {
        if (ingredientList[i].name == itemName) {
          toBuy = ingredientList[i];
        }
      }

      Purchase toCreate = new Purchase()
        ..ingredient = toBuy
        ..quantity = int.parse(itemQ)
        ..purchased = 0
        ..id = purchaseModel.purchaseList.length
        ..listName = widget.groceryList.name;

      purchaseModel.addItem(toCreate);
      toUpdateList.purchases.add(toCreate);
    }

    groceryListModel.updateItemByKey(widget.groceryList.id, toUpdateList);
  }

  void deleteItemToPurchase(GroceryListModel groceryListModel, _purchase) {
    GroceryList groceryList = widget.groceryList;
    for (int i = 0; i < groceryList.purchases.length; i++) {
      if (groceryList.purchases[i].id == _purchase.id) {
        groceryList.purchases.removeAt(i);
        break;
      }
    }

    groceryListModel.updateItemByKey(groceryList.id, groceryList);
  }

  ////////////////////////////
  ///OTHER CONTAINERS
  ////////////////////////////

  Container buildRowNewEntry(GroceryListModel groceryListModel) {
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
            flex: 6,
            child: Container(
              width: 10,
              height: 35,
              child: TextFormField(
                controller: textController1,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an ingredient name';
                  }
                  return null;
                },
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
            flex: 4,
            child: Container(
              width: 10,
              height: 35,
              child: TextFormField(
                controller: textController2,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  if (value.isEmpty) {
                    return 'Please enter an initial quantity to purchase';
                  } else if (int.tryParse(value) == null ||
                      int.tryParse(value) < 0) {
                    return 'Please enter a valid quantity';
                  }
                  return null;
                },
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
            flex: 2,
            child: Container(
              color: Colors.grey[50],
              child: IconButton(
                icon: Icon(Icons.check_circle_outline),
                iconSize: 30,
                onPressed: () {
                  createNewItemToPurchase(groceryListModel,
                      textController1.text, textController2.text);
                },
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 10,
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
            width: 50,
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
              'To Buy:',
              style: h5,
              textAlign: TextAlign.left,
            ),
          ),
        ],
      ),
    );
  }

  Container buildListOptions(
      BuildContext context, GroceryListModel groceryListModel) {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          RaisedButton.icon(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => GLEditAddRecipePage(
                            currentList: widget.groceryList,
                          )));
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
              print('Add Individual Ingredient');
              _showMyDialog(groceryListModel);
            },
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            label: Text(
              'Add Item',
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

  Future<void> _showMyDialog(GroceryListModel groceryListModel) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Add Item',
            style: h4,
          ),
          content: Container(
            height: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Name: ',
                    style: priceText,
                  ),
                ),
                TextFormField(
                  controller: textController1,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an ingredient name';
                    }
                    return null;
                  },
                ),
                Container(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    'Quantity: ',
                    style: priceText,
                  ),
                ),
                TextFormField(
                  controller: textController2,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter an initial quantity to purchase';
                    } else if (int.tryParse(value) == null ||
                        int.tryParse(value) < 0) {
                      return 'Please enter a valid quantity';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.clear),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              iconSize: 30,
              onPressed: () {
                createNewItemToPurchase(groceryListModel, textController1.text,
                    textController2.text);
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  Container buildDateEntryBar() {
    return Container(
      padding: EdgeInsets.all(5),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(20, 0, 24, 0),
            child: Text(
              'Date:',
              style: priceText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 7,
            child: Container(
              width: 10,
              height: 35,
              child: TextField(
                decoration: InputDecoration(
                  hintText: DateFormat('yyyy - MM - dd')
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
          Container(
            padding: EdgeInsets.fromLTRB(13, 0, 17, 0),
            child: Text(
              'Name:',
              style: priceText,
              textAlign: TextAlign.center,
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
          SizedBox(
            width: 10,
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
