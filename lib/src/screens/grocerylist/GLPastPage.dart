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
              'MY GOCERY LIST',
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.left,
            ),
          ),
          Container(
            width: 60,
            height: 60,
            alignment: Alignment.topLeft,
            decoration: BoxDecoration(
              image: DecorationImage(
                alignment: Alignment.topLeft,
                image: AssetImage('assets/images/choc_cupcake.png'),
              ),
            ),
          ),
          Container(
            width: 600,
            height: 600,
            color: Colors.grey[100],
            child: Stack(
              children: [
                Positioned(
                  top: 80,
                  left: 20,
                  child: Container(
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
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16.0),
                        topRight: Radius.circular(80.0),
                        bottomLeft: Radius.circular(16.0),
                        bottomRight: Radius.circular(16.0),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 30,
                  child: Container(
                    alignment: Alignment.topLeft,
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: ClipRect(
                      clipBehavior: Clip.hardEdge,
                      child: OverflowBox(
                        maxHeight: 120,
                        maxWidth: 120,
                        alignment: Alignment.topLeft,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Container(
                            alignment: Alignment.topLeft,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                alignment: Alignment.topLeft,
                                image: AssetImage(
                                    'assets/images/choc_cupcake.png'),
                              ),
                              color: Colors.white.withOpacity(0.4),
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 160,
                  left: 40,
                  child: Container(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Breakfast',
                      style: h7,
                    ),
                  ),
                ),
                Positioned(
                  top: 200,
                  left: 40,
                  child: Container(
                    width: 110,
                    child: Text(
                      'Bread, Peanut Butter, Apple',
                      style: h6,
                    ),
                  ),
                ),
                Positioned(
                  left: 20,
                  child: Text(
                    'Meals Plan',
                    style: h3,
                  ),
                ),
              ],
            ),
          ),
          // Container(
          //   child: ListView.builder(
          //     itemCount: 4,
          //     itemBuilder: (context, index) {
          //       return buildSpacing();
          //     },
          //     physics: BouncingScrollPhysics(),
          //     scrollDirection: Axis.horizontal,
          //   ),
          // ),

          // buildWidget(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Text('edit'),
        backgroundColor: Colors.greenAccent[700],
      ),
    );
  }

  // Container buildSpacing() {
  //   return Container(
  //     padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
  //     child: buildWidget(),
  //   );
  // }

  // Container buildWidget() {
  //   return Container(
  //     child: Stack(
  //       children: [
  //         Container(
  //           width: 150.0,
  //           height: 200.0,
  //           decoration: BoxDecoration(
  //             gradient: LinearGradient(
  //               begin: Alignment.topLeft,
  //               end: Alignment.bottomRight,
  //               colors: [
  //                 Colors.redAccent[200],
  //                 Colors.yellow[50],
  //               ],
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // // Container(
  // //   width: 150.0,
  // //   height: 200.0,
  // //   decoration: BoxDecoration(
  // //     gradient: LinearGradient(
  // //       begin: Alignment.topLeft,
  // //       end: Alignment.bottomRight,
  // //       colors: [
  // //         Colors.redAccent[200],
  // //         Colors.yellow[50],
  // //       ],
  // //     ),
  // //     // color: Colors.greenAccent[700],
  // //     borderRadius: BorderRadius.only(
  // //       topLeft: Radius.circular(16.0),
  // //       topRight: Radius.circular(80.0),
  // //       bottomLeft: Radius.circular(16.0),
  // //       bottomRight: Radius.circular(16.0),
  // //     ),
  // //   ),
  // //   child: Column(
  // //     mainAxisAlignment: MainAxisAlignment.start,
  // //     crossAxisAlignment: CrossAxisAlignment.start,
  // //     children: [
  // //       Container(
  // //         padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
  // //         alignment: Alignment.topLeft,
  // //         height: 70,
  // //         decoration: BoxDecoration(
  // //           borderRadius: BorderRadius.circular(10),
  // //         ),
  // //         child: ClipRect(
  // //           clipBehavior: Clip.hardEdge,
  // //           child: OverflowBox(
  // //             maxHeight: 60,
  // //             maxWidth: 60,
  // //             alignment: Alignment.topLeft,
  // //             child: Align(
  // //               alignment: Alignment.topLeft,
  // //               child: Container(
  // //                 alignment: Alignment.topLeft,
  // //                 decoration: BoxDecoration(
  // //                   image: DecorationImage(
  // //                     alignment: Alignment.topLeft,
  // //                     image: AssetImage('assets/images/choc_cupcake.png'),
  // //                   ),
  // //                   color: Colors.white.withOpacity(0.5),
  // //                   shape: BoxShape.circle,
  // //                 ),
  // //               ),
  // //             ),
  // //           ),
  // //         ),
  // //       ),
  // //       Container(
  // //         alignment: Alignment.centerLeft,
  // //         padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
  // //         child: Text(
  // //           'Breakfast',
  // //           style: h7,
  // //         ),
  // //       ),
  // //       Container(
  // //         padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
  // //         child: Text(
  // //           'Bread, Peanut Butter, Apple',
  // //           style: h6,
  // //         ),
  // //       ),
  // //     ],
  // //   ),
  // );
  // }

//ver1
  // Container buildWidget() {
  //   return Container(
  //     width: 150.0,
  //     height: 200.0,
  //     decoration: BoxDecoration(
  //       gradient: LinearGradient(
  //         begin: Alignment.topLeft,
  //         end: Alignment.bottomRight,
  //         colors: [
  //           Colors.redAccent[200],
  //           Colors.yellow[50],
  //         ],
  //       ),
  //       // color: Colors.greenAccent[700],
  //       borderRadius: BorderRadius.only(
  //         topLeft: Radius.circular(16.0),
  //         topRight: Radius.circular(80.0),
  //         bottomLeft: Radius.circular(16.0),
  //         bottomRight: Radius.circular(16.0),
  //       ),
  //     ),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.start,
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Container(
  //           padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
  //           alignment: Alignment.topLeft,
  //           height: 70,
  //           decoration: BoxDecoration(
  //             borderRadius: BorderRadius.circular(10),
  //           ),
  //           child: ClipRect(
  //             clipBehavior: Clip.hardEdge,
  //             child: OverflowBox(
  //               maxHeight: 60,
  //               maxWidth: 60,
  //               alignment: Alignment.topLeft,
  //               child: Align(
  //                 alignment: Alignment.topLeft,
  //                 child: Container(
  //                   alignment: Alignment.topLeft,
  //                   decoration: BoxDecoration(
  //                     image: DecorationImage(
  //                       alignment: Alignment.topLeft,
  //                       image: AssetImage('assets/images/choc_cupcake.png'),
  //                     ),
  //                     color: Colors.white.withOpacity(0.5),
  //                     shape: BoxShape.circle,
  //                   ),
  //                 ),
  //               ),
  //             ),
  //           ),
  //         ),
  //         Container(
  //           alignment: Alignment.centerLeft,
  //           padding: EdgeInsets.fromLTRB(20, 10, 20, 5),
  //           child: Text(
  //             'Breakfast',
  //             style: h7,
  //           ),
  //         ),
  //         Container(
  //           padding: EdgeInsets.fromLTRB(20, 5, 20, 20),
  //           child: Text(
  //             'Bread, Peanut Butter, Apple',
  //             style: h6,
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

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
