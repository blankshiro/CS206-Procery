import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentList.dart';
// import 'package:Procery/src/screens/grocerylist/GLItemsPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastList.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';

import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

class GLEditPage extends StatefulWidget {
  @override
  _GLEditPageState createState() => _GLEditPageState();
}

class _GLEditPageState extends State<GLEditPage> {
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: buildAppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            child: buildTextTitleVariation1('Edit Lists'),
          ),
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
                    Container(
                        // child: Row(
                        //   children: buildIngredientEntryLists(),
                        // ),
                        ),
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
  List<Widget> buildIngredientEntryLists() {
    List<Widget> itemList = [];

    for (var i = 0; i < getItemList().length; i++) {
      // show if the grocery not bought yet
      itemList.add(buildIngredientList(getItemList()[i]));
    }
    return itemList;
  }

  Widget buildIngredientList(ItemList collabList) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Icon(
              Icons.delete_outline,
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
            child: Icon(
              Icons.delete_outline,
            ),
          ),
          Expanded(
            flex: 2,
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
            flex: 1,
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
            child: Container(
              color: Colors.grey[50],
              child: Text(
                '-',
                style: priceText,
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: IconButton(
              onPressed: () {},
              iconSize: 30,
              icon: Icon(Icons.check_circle_outline),
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
          SizedBox(
            width: 10,
          ),
          Container(
            child: Text(
              'uHave:',
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
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 150.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(16.0),
                topRight: Radius.circular(16.0),
                bottomLeft: Radius.circular(16.0),
                bottomRight: Radius.circular(16.0),
              ),
            ),
            child: FlatButton(
              onPressed: () {},
              child: Text(
                'Add from Recipe',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Poppins',
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
              width: 150.0,
              height: 30.0,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                  bottomLeft: Radius.circular(16.0),
                  bottomRight: Radius.circular(16.0),
                ),
              ),
              child: FlatButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GLPastPage()),
                  );
                },
                child: Text(
                  'Combine Lists',
                  style: priceText,
                  textAlign: TextAlign.center,
                ),
              )),
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
                  hintText: 'Type here',
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
              child: Icon(
                Icons.calendar_today_outlined,
                size: 30,
              ),
            ),
          ),
        ],
      ),
    );
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
                  hintText: 'Type here',
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

  AppBar buildAppBar() {
    return AppBar(
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
    );
  }
}
