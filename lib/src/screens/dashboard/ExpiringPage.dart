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
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => {
            Navigator.of(context).pop(),

          },
        ),
        title: Text('Procery', style: logoWhiteStyle, textAlign: TextAlign.center),
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
                0: FixedColumnWidth(25),
                1: FixedColumnWidth(165),
                2: FixedColumnWidth(87),
              },
              // defaultVerticalAlignment: TableCellVerticalAlignment.bottom,
              children: [
                TableRow (
                  children: [
                    Container (
                    ),
                    Container(
                      padding: EdgeInsets.only(left: 0),
                      child: Text (
                          "Name: "
                      ),
                      width: 128,
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 0),
                      child: Text (
                          "Quantity: "
                      )
                    ),
                    Container(
                      padding: EdgeInsets.only(right: 0),
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
  //
  // void removeChecked(int i) {
  //   List<Inventory> groceryList = getExpiring();
  // }

  List<Widget> buildExpirings() {
    List<Widget> expiringList = [];
    for (var i = 0; i < getExpiring().length; i++) {
      expiringList.add(buildExpiring(getExpiring()[i], i));
    }
    return expiringList;
  }

  Widget buildExpiring(Inventory inv, int i) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Table (
        // border: TableBorder.all(),
        columnWidths: {
          0: FixedColumnWidth(180),
          1: FlexColumnWidth(),
          2: FlexColumnWidth(),
          3: FixedColumnWidth(40),
          4: FixedColumnWidth(40),
        },
        defaultVerticalAlignment: TableCellVerticalAlignment.middle,
        children: [
          TableRow(
            children: [
              TableCell(
                  child: Container(
                    padding: EdgeInsets.only(left: 15),
                    child: buildGroceryTitle(inv.name),
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
              TableCell(
                child: Container(
                  child: Icon(
                    Icons.remove,
                    size: 30,
                  ),
                ),
              ),
              TableCell(
                child: Container(
                  child: Icon(
                    Icons.add_rounded,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
        ],
      )
    );
  }
}