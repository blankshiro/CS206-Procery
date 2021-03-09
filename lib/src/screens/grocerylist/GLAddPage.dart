import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:flutter/material.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';
import 'package:Procery/src/shared/fryo_icons.dart';

void main() {
  runApp(MaterialApp(
    home: GLAddPage(),
  ));
}

//making a custom stateless widget
class GLAddPage extends StatelessWidget {
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
          //num1
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Text(
              'EDIT LIST',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //num2 Name:
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Name:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  color: Colors.grey[50],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 90, 5),
                  color: Colors.grey[200],
                  child: Text(
                    'Family Foods list',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //num3 Date:
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Date:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 25, 5),
                  color: Colors.grey[50],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(15, 5, 120, 5),
                  color: Colors.grey[200],
                  child: Text(
                    '22/02/21',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                  color: Colors.grey[200],
                  child: Icon(
                    Icons.calendar_today_outlined,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          //num4
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
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
                    'Add from Recipe',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
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
                    'Combine Lists',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
          //num5 name and quantity
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
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(80, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Quantity:',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
              ],
            ),
          ),
          //num6 check box
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.crop_square,
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 60, 5),
                  color: Colors.grey[200],
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  color: Colors.grey[50],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                  color: Colors.grey[200],
                  child: Text(
                    'Add',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 5, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                Container(
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
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
            MaterialPageRoute(builder: (context) => GLCurrentPage()),
          );
        },
        child: Text('save'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }
}
