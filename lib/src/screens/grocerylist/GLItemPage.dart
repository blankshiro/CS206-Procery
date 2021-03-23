import 'package:Procery/src/data/GroceryListData.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
// import 'package:Procery/src/screens/grocerylist/GLItemsPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCollabList.dart';
import 'package:Procery/src/screens/grocerylist/GLEditPage.dart';
import 'package:intl/intl.dart';
import '../../screens/BaseWidgets.dart';

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

class GLItemPage extends StatefulWidget {
  final GroceryList groceryList;

  GLItemPage({@required this.groceryList});

  @override
  _GLItemPageState createState() => _GLItemPageState();
}

class _GLItemPageState extends State<GLItemPage> {
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
      //APPBAR
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          getBackButton(context),
          //HEADER
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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              Container(
                child: IconButton(
                  alignment: Alignment.topLeft,
                  icon: Icon(Icons.delete),
                  iconSize: 20,
                  onPressed: () {
                    _showMyDialog();
                  },
                ),
              ),
            ],
          ),
          buildDatelineRow(),
          buildLocationRow(),
          buildCollaboratorRow(),
          Container(
            padding: EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Container(
                    child: Text(
                      'Name:',
                      style: h5,
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
                    child: Text(
                      'Purchased:',
                      style: h5,
                      textAlign: TextAlign.left,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: buildItemLists(
                  groceryListModel, inventoryModel, groceryListList),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => GLEditPage(
                      groceryList: groceryList,
                    )),
          );
        },
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }

  Row buildDatelineRow() {
    return Row(
      children: [
        Container(
          child: SizedBox(
            width: 10,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Text(
            'Dateline:',
            style: h6,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[50],
          alignment: Alignment.centerLeft,
          child: Text(
            DateFormat('yyyy - MM - dd')
                .format(widget.groceryList.deadLine), //intl package
            textAlign: TextAlign.left,
            style: priceText,
          ),
        ),
      ],
    );
  }

  Row buildLocationRow() {
    return Row(
      children: [
        Container(
          child: SizedBox(
            width: 10,
          ),
        ),
        Container(
          padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
          decoration: BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.all(Radius.circular(10.0))),
          child: Text(
            'Best Location:',
            style: h6,
          ),
        ),
        Container(
          padding: EdgeInsets.all(10),
          color: Colors.grey[50],
          alignment: Alignment.centerLeft,
          child: Text(
            'Cold Storage, Bugis Junction',
            textAlign: TextAlign.left,
            style: priceText,
          ),
        ),
      ],
    );
  }

  Container buildCollaboratorRow() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
            child: Text(
              'Collaborators:',
              style: h6,
            ),
          ),
          Container(
            child: Row(
              children: buildCollabLists(),
            ),
          ),
          SizedBox(
            width: 8,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              // color: Colors.grey[200],
              color: Colors.red,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => GLPastPage()));
              },
              icon: Icon(Icons.add),
              iconSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Delete this List?',
            style: h4,
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cancel),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            IconButton(
              icon: Icon(Icons.check),
              iconSize: 30,
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  ////////////////////////////////
  //COLLABORATORS LIST PART
  ////////////////////////////////
  List<Widget> buildCollabLists() {
    List<Widget> collabList = [];
    for (var i = 0; i < getCollabList().length; i++) {
      // show if the grocery not bought yet
      collabList.add(buildCollabList(getCollabList()[i]));
    }
    return collabList;
  }

  Widget buildCollabList(CollabList collabList) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          SizedBox(
            width: 8,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: Text(
              collabList.name,
              style: priceText,
            ),
          ),
        ],
      ),
    );
  }

  ////////////////////////////////
  //ITEM LISTING PART
  ////////////////////////////////
  List<Widget> buildItemLists(
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
      itemList.add(buildItemList(groceryListModel, inventoryModel, currentList,
          currentList.purchases[i]));
    }
    return itemList;
  }

  // Part 1 of building individual purchase items in list
  Widget buildItemList(
      groceryListModel, inventoryModel, groceryList, Purchase _purchase) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLItemList(
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

  // Part 2 of building individual purchase items in list
  buildGLItemList(
      GroceryListModel groceryListModel,
      InventoryModel inventoryModel,
      GroceryList groceryList,
      Purchase _purchase) {

    if(_purchase.quantity == 0){
      return;
    }

    int checkIndex;
    for (int i = 0; i < groceryList.purchases.length; i++) {
      if (_purchase.id == groceryList.purchases[i].id) {
        checkIndex = i;
      }
    }

    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Checkbox(
                value: _checked[checkIndex],
                onChanged: (bool value) {
                  print("state change 1" + _checked[checkIndex].toString());
                  if (value != false) {
                    if (_checked[checkIndex] == false) {
                      incrementQuantityPurchased(
                          groceryListModel,
                          inventoryModel,
                          groceryList,
                          _purchase,
                          _purchase.quantity - _purchase.purchased);
                    }
                    setState(() {
                      _checked[checkIndex] = true;
                    });
                  }
                  print("state change 2" + _checked[checkIndex].toString());
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
          Expanded(
            flex: 6,
            child: Text(
              _purchase.ingredient.name,
              style: priceText,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              _purchase.purchased.toString() +
                  "\/" +
                  _purchase.quantity.toString(),
              style: priceText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
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
            flex: 2,
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

  void incrementQuantityToPurchase(GroceryListModel groceryListModel,
      GroceryList groceryList, Purchase _purchase, int change) {
    int GLIndex = 0;
    var groceryListList = groceryListModel.grocerylistList;

    for (int i = 0; i < groceryListList.length; i++) {
      if (groceryListList[i].id == groceryList.id) {
        GLIndex = i;
        break;
      }
    }

    int purchaseIndex = 0;
    for (int i = 0; i < groceryListList[GLIndex].purchases.length; i++) {
      if (groceryListList[GLIndex].purchases[i].id == _purchase.id) {
        purchaseIndex = i;
        break;
      }
    }

    GroceryList toUpdate = groceryListList[GLIndex];
    toUpdate.purchases[purchaseIndex].quantity += change;
    if (toUpdate.purchases[purchaseIndex].quantity <= 0) {
      toUpdate.purchases.removeAt(purchaseIndex);
    }
    groceryListModel.updateItem(GLIndex, toUpdate);
    return;
  }
}

extension DateOnlyCompare on DateTime {
  bool isSameDate(DateTime other) {
    return this.year == other.year &&
        this.month == other.month &&
        this.day == other.day;
  }
}
