import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentList.dart';
import 'package:Procery/src/screens/grocerylist/GLEditPage.dart';
import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

class GLCurrentPage extends StatefulWidget {
  @override
  _GLCurrentPageState createState() => _GLCurrentPageState();
}

class _GLCurrentPageState extends State<GLCurrentPage> {
  bool _checked = false;
  int _value = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[200],
      resizeToAvoidBottomInset: false,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            //1. Header
            Container(
              padding: EdgeInsets.all(10),
              child: buildTextTitleVariation1('My Grocery Lists'),
            ),
            //2. Current and Past buttons
            buildCurrentAndPastButton(),
            //3. Search Bar
            buildSearchBar(),
            //SCROLLING HERE
            Expanded(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  child: Column(
                    children: [
                      //4. Sort by filter
                      buildFilter(),
                      //5. Name and quantity headers
                      buildNameAndQuantityHeader(),
                      //NUMBER 5
                      Container(
                        color: Colors.grey[50],
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: buildCurrentLists(),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GLEditPage()),
          );
        },
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }

  ////////////////////////////////
  //SEPARATE WIDGETS
  ////////////////////////////////
  Container buildNameAndQuantityHeader() {
    return Container(
      color: Colors.grey[50],
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 4,
            child: Container(
              alignment: Alignment.centerLeft,
              child: Text(
                'Name',
                style: h5,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: SizedBox(
              width: 1,
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.center,
              child: Text(
                'Dateline',
                style: h5,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container buildFilter() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 10),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(16.0),
          bottomLeft: Radius.circular(0),
          bottomRight: Radius.circular(0),
        ),
      ),
      child: Row(children: [
        Container(
          child: Text(
            'Sort by: ',
            style: h5,
          ),
        ),
        Container(
          padding: EdgeInsets.only(left: 10),
          child: DropdownButton(
            value: _value,
            items: [
              DropdownMenuItem(
                child: Text("Most Groceries", style: priceText),
                value: 1,
              ),
              DropdownMenuItem(
                child: Text("Incoming Datelines", style: priceText),
                value: 2,
              ),
              DropdownMenuItem(
                child: Text("Highest Progress", style: priceText),
                value: 3,
              ),
            ],
            onChanged: (value) {
              setState(() {
                _value = value;
              });
            },
          ),
        ),
      ]),
    );
  }

  Container buildSearchBar() {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Search',
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
          suffixIcon: Padding(
            padding: EdgeInsets.only(right: 24.0, left: 16.0),
            child: Icon(
              Icons.search,
              color: Colors.black,
              size: 24,
            ),
          ),
        ),
      ),
    );
  }

  Container buildCurrentAndPastButton() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 100.0,
            height: 30.0,
            decoration: BoxDecoration(
              color: Colors.greenAccent[700],
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
                'Current',
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
              width: 100.0,
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
                  'Past',
                  style: priceText,
                  textAlign: TextAlign.center,
                ),
              )),
        ],
      ),
    );
  }

  ////////////////////////////////
  //GROCERY LISTING PART
  ////////////////////////////////
  List<Widget> buildCurrentLists() {
    List<Widget> currentList = [];
    for (var i = 0; i < getCurrentList().length; i++) {
      // show if the grocery not bought yet
      currentList.add(buildCurrentList(getCurrentList()[i]));
    }
    return currentList;
  }

  Widget buildCurrentList(CurrentList currentList) {
    return GestureDetector(
      onTap: () {},
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: buildGLCurrentList(currentList),
            ),
            Row(
              children: [
                Expanded(
                  flex: 3,
                  child: SizedBox(
                    width: 1,
                  ),
                ),
                Expanded(
                  flex: 16,
                  child: Container(
                    padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                    child: LinearProgressIndicator(
                      minHeight: 10,
                      backgroundColor: Colors.grey[300],
                      valueColor:
                          new AlwaysStoppedAnimation(Colors.greenAccent[700]),
                      value: currentList.progressValue,
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: SizedBox(
                    width: 2,
                  ),
                ),
              ],
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

  buildGLCurrentList(CurrentList currentList) {
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
            flex: 7,
            child: Container(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => GLItemPage()),
                  );
                },
                child: Text(
                  currentList.title,
                  style: priceText,
                  textAlign: TextAlign.left,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              child: Text(
                currentList.date,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
