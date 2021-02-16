import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: GLHome(),
  ));
}

//making a custom stateless widget
class GLHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'PROCERY',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.greenAccent[700],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //NUMBER 1
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Text(
              'MY GROCERY LIST',
              style: TextStyle(
                fontFamily: 'PoppinsB',
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          //NUMBER 2
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.white,
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
                  child: FlatButton(
                    onPressed: () {},
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
                ),
              ],
            ),
          ),
          //NUMBER 3
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
              color: Colors.grey[200],
              child: Text(
                'Search',
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          //NUMBER 4
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.white,
            child: Container(
              padding: EdgeInsets.fromLTRB(50, 5, 10, 5),
              color: Colors.white,
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
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.brightness_1_outlined),
                  label: Text(
                    'All in One List',
                    style: TextStyle(
                      fontFamily: 'PoppinsB',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.white,
                ),
                FlatButton.icon(
                  onPressed: () {},
                  icon: Icon(Icons.brightness_1_outlined),
                  label: Text(
                    'Family FoodList',
                    style: TextStyle(
                      fontFamily: 'PoppinsB',
                      fontWeight: FontWeight.bold,
                      fontSize: 25,
                    ),
                  ),
                  color: Colors.white,
                ),
              ],
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
}
