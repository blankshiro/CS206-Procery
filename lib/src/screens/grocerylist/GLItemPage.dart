import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentList.dart';
// import 'package:Procery/src/screens/grocerylist/GLItemsPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCollabList.dart';

import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

class GLItemPage extends StatefulWidget {
  @override
  _GLItemPageState createState() => _GLItemPageState();
}

class _GLItemPageState extends State<GLItemPage> {
  bool _checked = false;

  Widget build(BuildContext context) {
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
                    'Collabing with ',
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
              children: buildItemLists(),
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
  List<Widget> buildItemLists() {
    List<Widget> itemList = [];
    for (var i = 0; i < getItemList().length; i++) {
      // show if the grocery not bought yet
      itemList.add(buildItemList(getItemList()[i]));
    }
    return itemList;
  }

  Widget buildItemList(ItemList itemList) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLItemList(itemList),
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

  buildGLItemList(ItemList itemList) {
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
              itemList.title,
              style: priceText,
            ),
          ),
          Expanded(
            flex: 6,
            child: Text(
              itemList.quantity.toString(),
              style: priceText,
              textAlign: TextAlign.center,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[50],
              child: Icon(
                Icons.remove,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.grey[50],
              child: Icon(
                Icons.add_rounded,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
