import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentList.dart';
// import 'package:Procery/src/screens/grocerylist/GLItemsPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCollabList.dart';

import '../../models/GroceryList.dart';
import '../../models/Purchase.dart';

import '../../services/GroceryListModel.dart';

import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

class GLItemPage extends StatefulWidget {
  final GroceryList groceryList;

  GLItemPage({@required this.groceryList});

  @override
  _GLItemPageState createState() => _GLItemPageState();
}

class _GLItemPageState extends State<GLItemPage> {
  bool _checked = false;

  Widget build(BuildContext context) {

    List<GroceryList> groceryListList = context.watch<GroceryListModel>().grocerylistList;
    GroceryListModel groceryListModel = Provider.of<GroceryListModel>(context, listen: false);

    return Scaffold(
      //APPBAR
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: primaryColor,
        title:
            Text('Procery', style: logoWhiteStyle, textAlign: TextAlign.center),
        actions: <Widget>[
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.magnifier),
          ),
          IconButton(
            padding: EdgeInsets.all(0),
            onPressed: () {},
            iconSize: 21,
            icon: Icon(Fryo.alarm),
          )
        ],
      ),
      body: Column(
        children: [
          //HEADER
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.all(10),
            child: buildTextTitleVariation1('Family Foods List'),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            alignment: Alignment.center,
            child: Text(
              'TBC: 22/2/21',
              style: h5,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 5, 0, 5),
            child: Row(
              children: [
                Container(
                  child: Text(
                    'Collaborating with ',
                    style: h5,
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
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Icon(
                    Icons.add,
                  ),
                ),
              ],
            ),
          ),
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
                      'Quantity:',
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
              children: buildItemLists(groceryListModel, groceryListList),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
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
  List<Widget> buildItemLists(groceryListModel, List<GroceryList> groceryListList) {
    List<Widget> itemList = [];

    GroceryList currentList = widget.groceryList;
    for(int i = 0; i < groceryListList.length; i++){
      if(groceryListList[i].id == currentList.id){
        currentList = groceryListList[i];
      }
    }


    for (var i = 0; i < currentList.purchases.length; i++) {
      // show if the grocery not bought yet
      itemList.add(buildItemList(groceryListModel, currentList, currentList.purchases[i]));
    }
    return itemList;
  }

  Widget buildItemList(groceryListModel, groceryList, Purchase _purchase) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLItemList(groceryListModel, groceryList, _purchase),
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

  buildGLItemList(GroceryListModel groceryListModel, GroceryList groceryList, Purchase _purchase) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Checkbox(
                value: _checked,
                onChanged: (bool value) {
                  setState(() {
                    _checked = value;
                  });
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
                onPressed: () {incrementPurchaseQuantity(groceryListModel, groceryList, _purchase, -1);},
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
                onPressed: () {incrementPurchaseQuantity(groceryListModel, groceryList, _purchase, 1);},
              ),
            ),
          ),
        ],
      ),
    );
  }

  void incrementPurchaseQuantity(GroceryListModel groceryListModel, GroceryList groceryList, Purchase _purchase, int change){
    int GLIndex = 0;
    var groceryListList = groceryListModel.grocerylistList;

    for(int i = 0; i < groceryListList.length; i++){
      if(groceryListList[i].id == groceryList.id){
        GLIndex = i;
        break;
      }
    }

    int purchaseIndex = 0;
    for(int i = 0; i < groceryListList[GLIndex].purchases.length; i++){
      if(groceryListList[GLIndex].purchases[i].id == _purchase.id){
        purchaseIndex = i;
        break;
      }
    }

    GroceryList toUpdate = groceryListList[GLIndex];
    toUpdate.purchases[purchaseIndex].quantity += change;
    if(toUpdate.purchases[purchaseIndex].quantity <= 0){
      toUpdate.purchases.removeAt(purchaseIndex);
    }
    groceryListModel.updateItem(GLIndex, toUpdate);
    return;
  }


}
