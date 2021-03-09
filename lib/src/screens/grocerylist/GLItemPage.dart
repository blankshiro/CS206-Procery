import 'package:Procery/src/screens/grocerylist/GLAddPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLData.dart';
// import 'package:Procery/src/screens/grocerylist/GLItemsPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';

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
            color: Colors.grey[50],
            alignment: Alignment.centerLeft,
            child: Text(
              'Family Foods List',
              style: h3,
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            alignment: Alignment.centerLeft,
            child: Text(
              'TBC: 22/2/21',
              style: priceText,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(65, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Name:',
                    style: priceText,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Quantity:',
                    style: priceText,
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
              child: buildGLItemList(itemList.title),
            ),
          ]),
    );
  }

  buildGLItemList(String text) {
    return Padding(
      padding: EdgeInsets.only(bottom: 0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
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
            flex: 4,
            child: Text(
              text,
              style: priceText,
            ),
          ),
          Expanded(
            flex: 3,
            child: Text(
              text,
              style: priceText,
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.grey[50],
              child: Icon(
                Icons.remove,
                size: 30,
              ),
            ),
          ),
          Expanded(
            flex: 1,
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
