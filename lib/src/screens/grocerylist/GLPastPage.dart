import 'package:Procery/src/screens/grocerylist/GLAddPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GLPastPage(),
  ));
}

//making a custom stateless widget
class GLPastPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //NUMBER 1
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Text(
              'MY GROCERY LIST',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //NUMBER 2
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
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
                        MaterialPageRoute(builder: (context) => GLHome()),
                      );
                    },
                    child: Text(
                      'Current',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
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
                      'Past',
                      style: TextStyle(
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.greenAccent[700],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //NUMBER 3
          Container(
            padding: EdgeInsets.only(bottom: 10),
            child: Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search',
                  hintStyle: TextStyle(fontSize: 16),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      width: 0,
                      style: BorderStyle.none,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[100],
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
            ),
          ),
          //NUMBER 4
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),
              color: Colors.grey[50],
              child: Text(
                'Name',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          //NUMBER 5
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cancel_outlined),
                  label: Text(
                    'Weekly List',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.grey[50],
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cancel_outlined),
                  label: Text(
                    'Afternoon Tea List',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.grey[50],
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.cancel_outlined),
                  label: Text(
                    'Pink BirthDay List',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.grey[50],
                ),
              ],
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => GLAddPage()),
          );
        },
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }
}
