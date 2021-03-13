import 'package:Procery/src/screens/recipe/RecipeDetail.dart';
import 'package:flutter/material.dart';

import 'dart:developer';

import '../../shared/styles.dart';
import '../../shared/colors.dart';
import '../../shared/fryo_icons.dart';
import '../unused/ProductPage.dart';
import '../../shared/Product.dart';
import '../../shared/partials.dart';

import './DashboardConstants.dart';

import './InventoryData.dart';
import './GroceryData.dart';
import './MealData.dart';

import '../recipe/RecipeData.dart';
import '../recipe/RecipeExplore.dart';
import '../recipe/RecipeDetail.dart';

class ExpiringPage extends StatefulWidget {
  final String pageTitle;

  ExpiringPage({Key key, this.pageTitle}) : super(key: key);

  @override
  _ExpiringPageState createState() => _ExpiringPageState();
}

class _ExpiringPageState extends State<ExpiringPage> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.white,
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

      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Table(
              columnWidths: {
                0: FixedColumnWidth(50),
                1: FixedColumnWidth(180),
                2: FixedColumnWidth(60),
                3: FlexColumnWidth(),
              },
              defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow (
                  children: [
                    Container (
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 15),
                      child: Text (
                          "Name: "
                      ),
                      width: 128,
                    ),
                    Container(
                        child: Text (
                            "Quantity: "
                        )
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 25),
                      child: Text (
                          "Expiring In: "
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Container(
              child: Column(
                  children: buildExpirings(),
              ),
            ),
            SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );


  }

  List<Widget> buildExpirings() {
    List<Widget> expiringList = [];
    for (var i = 0; i < getExpiring().length; i++) {
      expiringList.add(buildExpiring(getExpiring()[i]));
    }
    return expiringList;
  }

  Widget buildExpiring(Inventory inv) {
    return Table(
      // padding: EdgeInsets.all(10),
      // border: TableBorder.all(),
      columnWidths: {
        0: IntrinsicColumnWidth(),
        1: FixedColumnWidth(180),
        2: FlexColumnWidth(),
        3: FlexColumnWidth(),
      },
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      children: [
        TableRow(
          children: [
            TableCell(
              child: Container (
                padding: EdgeInsets.only(left: 15),
                child: Icon(
                  Icons.crop_square,
                  size: 30,
                ),
                width: 50,
                height: 60,
              ),
            ),
            TableCell(
              child: Container(
                padding: EdgeInsets.only(left: 15),
                child: buildGroceryTitle(inv.title),
                width: 128,
              )
            ),
            TableCell(
              child: Container(
                child: buildGrocerySubtitle(inv.description)
              )
            ),
            TableCell(
              child: Container(
                padding: EdgeInsets.only(left: 30),
                child: buildExpiryDays(inv.expiry.toString()),
              ),
            ),
          ],
        ),
      ],



      // child: Row(
      //   children: [
      //     // on press, remove the line of grocery (change bought to true)
      //     // have a button to undo at the bottom of the page
      //     Container(
      //       padding: EdgeInsets.fromLTRB(30, 2, 20, 2),
      //       // color: Colors.red[50],
      //       child: Icon(
      //         Icons.crop_square,
      //         size: 30,
      //       ),
      //     ),
      //     Container(
      //       padding: EdgeInsets.fromLTRB(10, 2, 100, 2),
      //       color: Colors.grey[50],
      //       child: buildGroceryTitle(inv.title),
      //     ),
      //     Container(
      //         padding: EdgeInsets.fromLTRB(10, 2, 37, 2),
      //         color: Colors.grey[50],
      //         child: buildGrocerySubtitle(inv.description)
      //     ),
      //     Container(
      //         padding: EdgeInsets.fromLTRB(10, 2, 37, 2),
      //         color: Colors.grey[50],
      //         child: buildExpiryDays(inv.expiry.toString()),
      //     ),
      //   ],
      // ),
    );
  }
}