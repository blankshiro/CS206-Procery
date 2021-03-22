import 'package:Procery/src/screens/grocerylist/GLEditPage.dart';
import 'package:Procery/src/screens/grocerylist/GLCurrentPage.dart';
import 'package:Procery/src/screens/grocerylist/GLItemPage.dart';
// import 'package:Procery/src/screens/grocerylist/GLPastPage.dart';

import 'package:flutter/material.dart';
import '../../shared/styles.dart';
import 'package:Procery/src/shared/styles.dart';
import 'package:Procery/src/shared/colors.dart';

class GLPastPage extends StatefulWidget {
  @override
  _GLPastPageState createState() => _GLPastPageState();
}

class _GLPastPageState extends State<GLPastPage> {
  bool _checked = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //NUMBER 1
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[50],
            child: Text(
              'MY GROCERY LIST',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          //NUMBER 2
          Container(
            color: Colors.grey[50],
            child: Row(
              children: [
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
                    onPressed: () {},
                    child: Text(
                      'Current',
                      style: priceText,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/egg1.jpg'),
                    ),
                    shape: BoxShape.circle,
                  ),
                ),
                buildWidget(),
              ],
            ),
          ),
          //NUMBER 4

          //NUMBER 5
          // buildPastListTab(),
          buildWidget(),
        ],
      ),
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

  Container buildWidget() {
    return Container(
      width: 150.0,
      height: 200.0,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Colors.redAccent[200],
            Colors.yellow[50],
          ],
        ),
        // color: Colors.greenAccent[700],
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16.0),
          topRight: Radius.circular(80.0),
          bottomLeft: Radius.circular(16.0),
          bottomRight: Radius.circular(16.0),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.topLeft,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRect(
              clipBehavior: Clip.hardEdge,
              child: OverflowBox(
                maxHeight: 50,
                maxWidth: 50,
                alignment: Alignment.topLeft,
                child: Align(
                  alignment: Alignment.topLeft,
                  child: Container(
                    alignment: Alignment.topLeft,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        alignment: Alignment.topLeft,
                        image: AssetImage('assets/images/egg1.jpg'),
                      ),
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
          ),
          // Container(
          //   width: 50,
          //   height: 50,
          //   alignment: Alignment.centerLeft,
          //   decoration: BoxDecoration(
          //     image: DecorationImage(
          //       image: AssetImage('assets/images/egg1.jpg'),
          //     ),
          //     shape: BoxShape.circle,
          //   ),
          // ),
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.fromLTRB(20, 0, 20, 5),
            child: Text(
              'Breakfast',
              style: h7,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
            child: Text(
              'Bread, Peanut Butter, Apple',
              style: h6,
            ),
          ),
        ],
      ),
    );
  }

  ////////////////////////////////
  //GROCERY PAST LISTING PART
  ////////////////////////////////
  // Container buildPastListTab() {
  //   return Container(
  //     color: Colors.grey[50],
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: buildPastLists(),
  //     ),
  //   );
  // }

  // List<Widget> buildPastLists() {
  //   List<Widget> pastList = [];
  //   for (var i = 0; i < getPastList().length; i++) {
  //     // show if the grocery not bought yet
  //     pastList.add(buildPastList(getPastList()[i]));
  //   }
  //   return pastList;
  // }

  // Widget buildPastList(PastList pastList) {
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Column(
  //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Container(
  //             child: buildGLPastList(pastList),
  //           ),
  //           Divider(
  //             height: 10,
  //             thickness: 1,
  //             color: Colors.grey[300],
  //             indent: 5,
  //             endIndent: 5,
  //           ),
  //         ]),
  //   );
  // }

  // buildGLPastList(PastList pastList) {
  //   return Padding(
  //     padding: EdgeInsets.only(bottom: 0),
  //     child: Row(
  //       children: [
  //         Expanded(
  //           flex: 1,
  //           child: Container(
  //             alignment: Alignment.center,
  //             child: Checkbox(
  //               value: _checked,
  //               onChanged: (bool value) {
  //                 setState(() {
  //                   _checked = value;
  //                 });
  //               },
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 7,
  //           child: Container(
  //             alignment: Alignment.centerLeft,
  //             child: TextButton(
  //               onPressed: () {
  //                 Navigator.push(
  //                   context,
  //                   MaterialPageRoute(builder: (context) => GLItemPage()),
  //                 );
  //               },
  //               child: Text(
  //                 pastList.title,
  //                 style: priceText,
  //                 textAlign: TextAlign.left,
  //               ),
  //             ),
  //           ),
  //         ),
  //         Expanded(
  //           flex: 2,
  //           child: Container(
  //             child: Text(
  //               pastList.date,
  //               textAlign: TextAlign.center,
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
}
