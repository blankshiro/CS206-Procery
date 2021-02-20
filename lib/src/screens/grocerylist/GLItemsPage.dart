import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GLItemPage(),
  ));
}

//making a custom stateless widget
class GLItemPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //num1
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Text(
              'Family Foods List',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //num2
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Current',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.greenAccent[700],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(30, 5, 30, 5),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(
                      color: Colors.black,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16.0),
                      topRight: Radius.circular(16.0),
                      bottomLeft: Radius.circular(16.0),
                      bottomRight: Radius.circular(16.0),
                    ),
                  ),
                  child: Text(
                    'Past',
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
          //num3
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey[50],
            child: Text(
              'TBC: 22/02/2021',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //num1
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
          //LIST OF ITEMS
          //item 1
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
                  color: Colors.grey[50],
                  child: Text(
                    'Eggs',
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
                  padding: EdgeInsets.fromLTRB(10, 5, 37, 5),
                  color: Colors.grey[50],
                  child: Text(
                    '10',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          //item 2
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
                  color: Colors.grey[50],
                  child: Text(
                    'Flour',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  color: Colors.grey[50],
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Text(
                    '100g',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
                ),
              ],
            ),
          ),
          //item 3
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.check_box_outlined,
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 37, 5),
                  color: Colors.grey[50],
                  child: Text(
                    'Sugar',
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
                  padding: EdgeInsets.fromLTRB(10, 5, 17, 5),
                  color: Colors.grey[50],
                  child: Text(
                    '250g',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 5, 10, 5),
                  color: Colors.grey[50],
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(5, 5, 10, 5),
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
        onPressed: () {},
        child: Text('save'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }
}
